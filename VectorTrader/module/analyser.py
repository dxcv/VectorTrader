# -*- coding: utf-8 -*-
"""
Created on Mon Aug 21 10:52:45 2017

@author: LDH
"""

# analyser.py
import pickle
import datetime
import pandas as pd

from ..events import EVENT
from ..utils.stats import calc_bar_return,calc_return_pnl
class Analyser():

    def __init__(self,env):
        self.env = env
        
        self.portfolio_net_value = []
        self.position_record = []
        self.order_record = []
        self.fill_order_record = []
        
        self.env.event_bus.add_listener(EVENT.POST_BAR,self._record_account)
        
    def _record_account(self,event):
        trading_dt = self.env.trading_dt
        account = self.env.account
        self.portfolio_net_value.append([trading_dt,account.total_asset_value])
        self.position_record.append([trading_dt,account.position])
        
    def stats(self,name = None,path = None):
        '''
        回测结束后调用该函数，用于统计回测结果。
        parameters
        ------------
            name
                结果名称
            path
                回测结果保存路径
        '''
        if name is None:
            name = 'strategy_' + datetime.datetime.now().strftime('%Y-%m-%d %H-%M-%S')
        if path is None:
            path = 'G:\\Work_ldh\\Backtest\\VectorTrader\\out\\'
        
        out_path = path + name + '.pkl'
            
        self.portfolio_value = pd.DataFrame(self.portfolio_net_value,
                                            columns = ['trading_dt',
                                                       'total_asset_value']).set_index('trading_dt')
        self.bar_return = calc_bar_return(self.portfolio_value['total_asset_value'])
        self.return_pnl = calc_return_pnl(self.portfolio_value['total_asset_value'])
        
        report = {}
        report['bar_return'] = self.bar_return
        report['return_pnl'] = self.return_pnl
        
        with open(out_path,'w') as f: 
            pickle.dump(report,f)
            
    def show_stats(self):
        '''
        展示回测统计结果。
        '''
        self.return_pnl.plot(figsize = (12,8))
        
    
    
    