# -*- coding: utf-8 -*-
"""
Created on Sun Aug 20 14:12:48 2017

@author: ldh
"""

# data_proxy.py
from ..environment import Environment
from ..module.bar import Bar
from ..utils.convertor import dataframe_to_bars,list_to_generator

class DataProxy():
    '''
    对不同类型的data_source的封装。计划支持不同模式下的代理。
    对于回测/模拟/实盘实现一套系统内部的数据结构，并定义接口。
    对于研究而言，实现以DataFrame为基准的数据结构的接口。
    
    这样的好处在于DataSource只需要实现DataFrame数据类型。
    DataProxy负责对DataFrame数据类型进行加工得到定义的数据类型。
        
    20170828
    ---------
        将回测数据一次性转换成bar_list,并构造成生成器。这样，
        在每次post bar后生成当前bar对象,bar_map通过get_bar方法取得对应的bar.
        
    20170825
    ----------
        创建MixedDataSource集成所有可得数据源。作为默认数据源。
    '''
    
    def __init__(self,data_source,mode = 'b'):
        self.data_source = data_source 
        self.history_bars = None
        self._bars_map = None
        self.mode = mode
        
        if self.mode == 'b':
            # 回测模式
            # 在该模式下,系统会初始化所有基础数据
            self._bars = {} # 存储回测当中所有的bar
            self._bar_generator = {} # bar生成器,在post_bar后由bar_map调用取得当前的bar
            self._initilize_backtest_data()
 
            
        elif self.mode == 'p':
            # 模拟模式
            pass
        elif self.mode == 'r':
            # 实盘
            pass
        elif self.mode == 's':
            # 研究
            pass
        
    def _initilize_backtest_data(self):
        '''
        准备数据.
        '''        
        env = Environment.get_instance()
        universe = env.universe
        start_date = env.start_date
        end_date = env.end_date
        frequency = env.frequency
        
        # 回测专有数据
        self._data = {}
        self._calendar_days = None
        
        self._calendar_days = self.data_source.get_calendar_days(start_date,
                                                                 end_date)
        for ticker in universe:
            self._data[ticker] = self.data_source.get_history(
                                                    ticker,
                                                    start_date,
                                                    end_date,
                                                    frequency).fillna(method = 'pad')
            self._bars[ticker] = dataframe_to_bars(self._data[ticker],ticker,frequency)
            self._bar_generator[ticker] = list_to_generator(self._bars[ticker])

                   
    ## 回测 系统内部数据接口
    def get_bar(self,ticker):
        '''
        get_bar函数仅用于account更新,即只能由bar_map调用,不允许其他调用！
        '''
        if self.mode == 'b':
            bar = next(self._bar_generator[ticker])
            return bar
        
    def get_price(self,ticker,dt,val_type):
        '''
        获取指定日期的价格数据,供api中的order函数使用。
        parameters
        -----------
            ticker
                股票代码
            dt
                时间
            val_type
                价格类型种类
        '''
        data = self._data[ticker].loc[dt]
        price = data[val_type]
        return price
    
    # 一般数据接口
    def get_history(self,ticker,start_date,end_date,frequency,kind):
        '''
        数据接口。
        数据根据上证交易日进行了补全，没有数据用空值表示。
        Parameters
        -----------
            start_date
                '20100101'
            end_date
                '20150101'
            frequency 
                '1d','1m','5m'
            kind
                '0' 不复权
                '1' 后复权
                '-1' 前复权
                
        Returns
        --------
            DataFrame (date_time,open_price,high_price,low_price,close_price,volume,amount)
        '''
        return self.data_source.get_history(ticker,start_date,end_date,frequency,kind)
            
    def get_calendar_days(self,start_date,end_date):
        '''
        返回start_date到end_date间的交易日。
        Parameters
        -----------
            start_date
                '20100101'
            end_date
                '20150101'
        Return
        -------
            list [pd.Timestamp]
        '''
        if self.mode == 'b':
            return self._calendar_days.tolist()
        else:
            calendar_days = self.data_source.get_calendar_days(start_date,
                                                               end_date)
            return calendar_days.tolist()
        
    def get_symbols(self):
        '''
        获取股票代码。
        '''
        try:
            return self.data_source.get_symbols()
        except Exception as e:
            print e
            print 'data_source\'s method [get_symbols] is not realized correctly'
            raise

    def get_rights_issue(self,ticker,start_date,end_date):
        '''
        获取股票已实施配股数据。若时间段内股票没有配股则返回空表。
        Parameters
        ----------
            ticker
                '600340'
            start_date
                '20100101'
            end_date
                '20150101'
        Returns
        --------
            DataFrame
                index ex_rights_date
                columns 
                    'ex_rights_date','rights_issue_per_stock','rights_issue_price',
                    'transfer_rights_issue_per_stock','transfer_price'
                        (除权日,每股配股,配股价，每股转配，每股转配价)
        '''
        return self.data_source.get_rights_issue(ticker,start_date,end_date)
    
    def get_dividend(self,ticker,start_date,end_date):
        '''
        获取股票时间段内实施的分红送股转增数据。若时间段内股票没有分红送股则返回空表。
        Parameters
        ----------
            ticker
                '600340'
            start_date
                '20100101'
            end_date
                '20150101'
        Returns
        --------
            DataFrame
                index XD_date
                columns XD_date,dividend_per_share,multiplier
                        (除权除息日,每股分红,分红后每股乘数)
        '''
        return self.data_source.get_dividend(ticker,start_date,end_date)
    
    def get_trade_status(self,ticker,start_date,end_date):
        '''
        获取股票交易状态。若时间段内股票没有上市交易则返回空表。
        Parameters
        -----------
            ticker
                股票代码
            start_date
                '20100101'
            end_date
                '20150101'
        Returns
        --------
            DataFrame 
                index date_time
                columns (date_time,ticker,status)
        Notes
        -------
            status 
                正常交易: 1
                停牌: 0
        '''  
        return self.data_source.get_trade_status(ticker,start_date,end_date)
    
    def get_list_delist_date(self,ticker):
        '''
        获取股票上市与退市日期。若没有退市，则退市为0.
        Parameters
        -----------
            ticker
                600340
        Returns
        --------
            tuple
                (list_date,delist_date) datetime类型
                
        '''
        return self.data_source.get_list_delist_date(ticker)
    
    
    