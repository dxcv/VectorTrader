# -*- coding: utf-8 -*-
"""
Created on Fri Aug 25 10:28:49 2017

@author: ldh
"""

# matlab_utils.py

import numpy as np
import pandas as pd
import matlab.engine

from utils import convert_time,datetime_format_convertor

eng = matlab.engine.start_matlab()

work_dir = 'G:\Work_ldh\Backtest\VectorTrader\VectorTrader\data\data_source\mixed_data_source'
eng.cd(work_dir)


def get_matlab_symbols():
    return eng.get_symbols()

def get_matlab_trading_days():
    '''
    获取交易日历。
    '''
    pass

def get_matlab_history(ticker,start_date,end_date,frequency):
    '''
    借助matlab从数据库中取数据。
    '''
    start_date = datetime_format_convertor(start_date)
    end_date = datetime_format_convertor(end_date)
    data = eng.get_history(ticker,start_date,end_date,frequency)
    data = np.array(data)
    columns = ['num_time','open_price','high_price','low_price','close_price','volume','amount']
    df = pd.DataFrame(data,columns = columns)
    df['date_time'] = convert_time(df['num_time'])
    df.drop('num_time',axis = 1,inplace = True)
    df.set_index('date_time',inplace = True)
    return df

def get_factor(ticker,start_date,end_date,frequency):
    '''
    获取因子数据。
    '''
    pass

if __name__ == '__main__':
    hist_data = get_matlab_history('600340','20150101','20160101','1d')
