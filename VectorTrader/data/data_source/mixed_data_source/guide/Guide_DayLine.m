NET.addAssembly([pwd,'FactorsLib2.dll']);

%% ��������(ÿ��17:45������)
% ����������DayClose(6λ��Ʊ������ɵ�����,MATLAB��ʽ��ʼʱ��,MATLAB��ʽ����ʱ��,�Ƿ���֤�����ղ�ȫ,��Ȩѡ��);
% ������2���������Ƿ���֤�����ղ�ȫ��0������֤���������������ȫ��1������֤�����ղ�ȫ��-2������Ȼ���������������ȫ��-1������Ȼ�ղ�ȫ
% ���1����������Ȩ��0������Ȩ��1�����Ȩ��-1����ǰ��Ȩ
% DayOpen,DayHigh,DayLow,DayVol,DayAmount����

closestruct=FactorsLib2.Factors.DayClose({'000001','000002'},730600,736875,1,-1); % �������������谴��struct.value  struct.numtime  struct.stockcode  struct.marketչ��

    close=double(closestruct.value);             %�۸����ݣ��а���numtime���У��а���stockcode����
    numtime=double(closestruct.numtime)';        %ʱ������
    stockcode=cell(closestruct.stockcode)';      %��Ʊ��������
    market=cell(closestruct.market)';            %�г���������

%% ���߿��ߵ������ۼ���
% ������������DayOpen���������������谴��struct.value  struct.numtime  struct.stockcode  struct.marketչ��
dayline=FactorsLib2.Factors.DayLine({'000001','000002'},736600,736875,1,0); 

    numtime=double(dayline.numtime)';        %ʱ������
    stockcode=cell(dayline.stockcode)';      %��Ʊ��������
    market=cell(dayline.market)';            %�г���������
    close=double(dayline.close);             %�۸����ݣ��а���numtime���У��а���stockcode���У���ͬ
    high=double(dayline.high);             
    low=double(dayline.low);      
    open=double(dayline.open);       
    vol=double(dayline.vol);       
    amount=double(dayline.amount);    