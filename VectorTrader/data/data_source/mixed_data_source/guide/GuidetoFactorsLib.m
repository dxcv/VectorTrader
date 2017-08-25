NET.addAssembly('D:\FactorsLib2.dll');

%% ��ȡȫA��Ʊ����ȡ�г����룬��Ʊ����
scode=cell(FactorsLib2.Factors.getStockcode()); %��ȡȫA��Ʊ
scode=cell(FactorsLib2.Factors.getStockcode(1)); %�޳����й�Ʊ���ȫA��Ʊ
stockmarket=cell(FactorsLib2.Factors.getMarket(scode)); %��ȡ�����Ʊ���е��г�����
stockname=cell(FactorsLib2.Factors.getStockName(scode)); %��ȡ�����Ʊ���е����ļ��

%% ��������(ÿ��17:45������)
% ����������DayClose(6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ���֤�����ղ�ȫ,��Ȩѡ��);
% �Ƿ���֤�����ղ�ȫ��1������֤�����ղ�ȫ��-1������Ȼ�ղ�ȫ��0������ȫ��-2������Ȼ�����е�����ȫ
% ��Ȩ��0������Ȩ��1�����Ȩ��-1����ǰ��Ȩ
% DayOpen,DayHigh,DayLow,DayVol,DayAmount����

struct=FactorsLib2.Factors.DayClose({'000001','000002'},730600,736875,1,-1); % �������������谴��struct.value  struct.numtime  struct.stockcode  struct.marketչ��
struct2=FactorsLib2.Factors.DayClose(scode,730600,today,0,0);

value=double(struct.value);             %�۸����ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

%% ���߿��ߵ������ۼ���
% ������������DayOpen���������������谴��struct.value  struct.numtime  struct.stockcode  struct.marketչ��
dayline=FactorsLib2.Factors.DayLine({'000001','000002'},736600,736875,1,0); 

numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������
close=double(struct.close);             %�۸����ݣ��а���numtime���У��а���stockcode���У���ͬ
high=double(struct.high);             
low=double(struct.low);      
open=double(struct.open);       
vol=double(struct.vol);       
amount=double(struct.amount);    

%% ����MA
% ����������MA(��������,6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ���֤�����ղ�ȫ,��Ȩѡ��);
% �Ƿ���֤�����ղ�ȫ��1������֤�����ղ�ȫ��-1������Ȼ�ղ�ȫ��0������ȫ��-2������Ȼ�����е�����ȫ
% ��Ȩ��0������Ȩ��1�����Ȩ��-1����ǰ��Ȩ

struct=FactorsLib2.Factors.MA(5,{'000001','000002'},730600,736875,1,-1); % �����������̼�5�վ�������

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������

struct2=FactorsLib2.Factors.MA(5, pricearray);      % Ҳ��ֱ��������������N�վ��ߣ����ص��Ǻ��������鳤����ȵ����飬��ǰN-1������ΪNaN

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
struct=FactorsLib2.Factors.Capital('����ֵ',{'000001','000002'},727200,736875);

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
struct2=FactorsLib2.Factors.PriceChange(90,730600,736875); % ��������ȫA�����й�Ʊ90���ǵ�������

value=double(struct.value);             %�������ݣ��а���numtime���У��а���stockcode����
numtime=single(struct.numtime)';        %ʱ������
stockcode=cell(struct.stockcode)';      %��Ʊ��������
market=cell(struct.market)';            %�г���������


