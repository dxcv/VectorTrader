NET.addAssembly([pwd,'FactorsLib2.dll']);

%% �ɶ��ܻ����������ֹ���
% ����������ShareHolders(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ�ȫ��Ȼ������);
% �Ƿ�ȫ��Ȼ�����ݣ�1����ȫ��0������ȫ
% ���������ɶ��ܻ����������ֹ���
struct=FactorsLib2.Factors.ShareHolders('�ɶ��ܻ���',{'000001','000002'},727200,736875,1);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% �ɱ���Ϣ
% ����������ShareStru(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ�ȫ��Ȼ������);
% �Ƿ�ȫ��Ȼ�����ݣ�1����ȫ��0������ȫ
% ���������ܹɱ�,��ͨA��,��ͨ����,���ȹ�
struct=FactorsLib2.Factors.ShareStru('�ܹɱ�',{'000001','000002'},727200,736875,1);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% ��ֵ��Ϣ
% ����������Capital(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��);
% ������������ֵ,��ͨ��ֵ
struct=FactorsLib2.Factors.Capital('��ͨ��ֵ',{'000001','000002'},727200,736875);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% ������
% ����������TurnoverRate(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��);
% ������������ڰ���Ȼ�����У������޽���ʱ��ֵΪNaN
struct=FactorsLib2.Factors.TurnoverRate({'000001','000002'},727200,736875);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% �����ֹ���Ϣ����ɶ��ֹ���Ϣ
% ����������StockHolding(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ�ȫ��Ȼ������);
% �Ƿ�ȫ��Ȼ�����ݣ�1����ȫ��0������ȫ
% ��������ǰʮ��ɶ��ֹ������ϼ�,ǰʮ��ɶ��ֹɱ����ϼ�,�����ֹɱ����ϼ�,����ֹɱ���,ȯ�ֹ̳ɱ���,QFII�ֹɱ���,���չ�˾�ֹɱ���,�籣����ֹɱ���,��ҵ���ֹɱ���,���й�˾�ֹɱ���,���гֹɱ���
struct=FactorsLib2.Factors.StockHolding('ǰʮ��ɶ��ֹ������ϼ�',{'000001','000002'},727200,736875,1);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% ��ɶ���������Ϣ
% ����������PositionChange(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��);
% ���������䶯����,�䶯����ռ��ͨ������,���³�����ͨ����ռ��ͨ������,ƽ���۸�,���³ֹ�����,�������򣨼��� 0������ 1��,����������(���� 0���߹� 1����˾ 2)
struct=FactorsLib2.Factors.PositionChange('��������',{'000001','000002'},727200,736875);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% �߹���������Ϣ
% ����������ShareStru(��������6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��);
% ���������䶯��,�䶯��ֹ���,�ɽ�����
struct=FactorsLib2.Factors.LeaderPositionChange('�䶯��',{'000001','000002'},727200,736875);

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% �ǵ���
% ����������PriceChange(�ǵ�����������,6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��);
% ���㵱�����̼���90��ǰ���̼۶Աȵ��ǵ���,��λΪ%
% ���������Ʊ���룬���������ȫA�����й�Ʊ���ǵ���
struct=FactorsLib2.Factors.PriceChange(90,{'000001','000002'},730600,736875); % ��������90���ǵ�������
struct2=FactorsLib2.Factors.PriceChange(90,730600,736875,15); % ��������ȫA��������δ����ͣ�Ƴ�15��Ĺ�Ʊ90�յ��ǵ������ݣ����һ��������ʡ�ԣ������޳�����ͣ�ƹ�Ʊ��

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% �ʲ���ծ��
% ����������AssetToLiabilityRatio(��Ʊ������ɵ�cell,��ʼʱ��,����ʱ��);
struct=FactorsLib2.Factors.AssetToLiabilityRatio({'000001','000002'},727200,736875);

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