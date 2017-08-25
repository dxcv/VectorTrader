function [target_matrix] = get_factor( factor_name,ticker,start_date,end_date)
%GET_FACTOR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
lib_path = 'G:\Work_ldh\Backtest\VectorTrader\VectorTrader\data\data_source\mixed_data_source\';
NET.addAssembly([lib_path,'FactorsLib2.dll']);

%% ת������
start_date_num = datenum(start_date);
end_date_num = datenum(end_date);    

%% �ʲ���ծ��
% ����������AssetToLiabilityRatio(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.AssetToLiabilityRatio({'000001','000002'},727200,736875);
value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
%% ÿ�ɾ��ʲ�
% ����������NetAssetsPerShare(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.NetAssetsPerShare({'000001','000002'},727200,736875);

%% ���ʲ�������ROE
% ����������ROE(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.ROE({'000001','000002'},727200,736875);

%% ����ë����
% ����������GrossProfitRatio(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.GrossProfitRatio({'000001','000002'},727200,736875);

%% ������,TTM
% ����������NetProfit(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.NetProfit({'000001','000002'},727200,736875);

%% ������TTM������
% ����������GrowthRateOfNetProfit(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.GrowthRateOfNetProfit({'000001','000002'},727200,736875);

%% Ӫҵ������������
% ����������GrowthRateOfTotalOperatingProfit(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.GrowthRateOfTotalOperatingProfit({'000001','000002'},727200,736875);

%% ÿ�ɾ�Ӫ�ֽ���
% ����������CashFlowFromOperationsPerShare(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.CashFlowFromOperationsPerShare({'000001','000002'},727200,736875);

%% ��ӯ��
% ����������PE(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.PE({'000001','000002'},727200,736875);

%% �о���
% ����������PB(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.PB({'000001','000002'},727200,736875);

%% ������
% ����������PS(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.PS({'000001','000002'},727200,736875);

%% ��Ϣ��
% ����������DividendYieldRatio(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.DividendYieldRatio({'000001','000002'},727200,736875);

end

