NET.addAssembly([pwd,'FactorsLib2.dll']);

%% ��ȡȫA��Ʊ����ȡ�г����룬��Ʊ����
scode=cell(FactorsLib2.Factors.getStockcode()); %��ȡ��ʷȫA��Ʊ
scode=cell(FactorsLib2.Factors.getStockcode(1)); %�޳����й�Ʊ���ȫA��Ʊ
scode=cell(FactorsLib2.Factors.getStockcode(2)); %�޳����м�ST���ȫA��Ʊ
stockmarket=cell(FactorsLib2.Factors.getMarket(scode)); %��ȡ�����Ʊ���е��г����루����{'000001'}���{'SZ'}��
stockname=cell(FactorsLib2.Factors.getStockName(scode)); %��ȡ�����Ʊ����Ĺ�Ʊ��������{'000001'}���{'ƽ������'}��
scode=cell(FactorsLib2.Factors.SuspensionStock(N,startdate,enddate)); %��ѯ����������ͣ�Ƴ�N�������A�ɴ���

%% ��������
% �����
Guide_DayLine

%% ����������
% �����
Guide_1mLine
    
%% �����漰�г�������
% �����
Guide_FinancialFactors

%% ����ָ������
% �����
Guide_TechFactors





