function [ symbols ] = get_symbols()
%GET_SYMBOLS ��ȡȫA����
%   �˴���ʾ��ϸ˵��
lib_path = 'G:\Work_ldh\Backtest\VectorTrader\VectorTrader\data\data_source\guosen\';
NET.addAssembly([lib_path,'FactorsLib2.dll']);
symbols =cell(FactorsLib2.Factors.getStockcode());
end

