# -*- coding: utf-8 -*-
"""
Created on Tue Aug 22 08:33:34 2017

@author: ldh
"""

# run_file.py

config = {'base':
    {'start_date':'20150101',
     'end_date':'20160101',
     'frequency':'1d',
     'capital':100000,
     'universe':['600340']}}
import sys
sys.path.append('./VectorTrader/')
sys.path.append('./VectorTrader/mod')
from VectorTrader import run_file

strategy_path = './test/test_buy_and_hold.py'
run_file(config,strategy_path)
