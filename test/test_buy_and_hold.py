# -*- coding: utf-8 -*-
"""
Created on Tue Aug 22 08:30:40 2017

@author: ldh
"""

# test_buy_and_hold.py
from VectorTrader.api import *

def initilize(context):
    context.fired = False
    
def before_trading(context):
    context.signal_post_before_trading = 'This is a test'
    print 'TEST'
def handle_bar(context):
    if not context.fired:
        for ticker in context.universe:
            order(ticker,1000,1)
        context.fired = True
    
def after_trading(context):
    context.signal_post_after_trading = 'We have bought the stock'


