%% ��ȡ�ڻ������߻���ڷ����ߺϳɵĸ�������K��
NET.addAssembly([pwd,'FactorsLib2.dll']);
future=FactorsLib2.FutureData; % ʵ����

%% ��ȡ�ڻ���ʷһ����K��
cycle=[3,15,240]; %���ڣ���λ���ӣ���ͬʱ��ȡ������ڵ�K��
Closestruct=future.KLineClose(codes,startdate,enddate,cycle); % cycle=1������cycle�����ɻ�ȡ1�����ߣ�ǰ��Ȩ��
    % �������ڻ�1�����ߵ�����£����ClosestructΪstruct��ʽ��
        close=double(Closestruct.value);             %�۸����ݣ��а���numtime���У��а���stockcode����
        numtime=double(Closestruct.numtime)';        %ʱ������
        stockcode=cell(Closestruct.stockcode)';      %��Լ��������
    % ������ڵ�����£����ClosestructΪstruct�����ʽ��(���´��������һ�����ڵ�����)
        close=double(Closestruct(1).value);             %�۸����ݣ��а���numtime���У��а���stockcode����
        numtime=double(Closestruct(1).numtime)';        %ʱ������
        stockcode=cell(Closestruct(1).stockcode)';      %��Լ��������
        
   
        Openstruct=future.KLineHigh(codes,startdate,enddate,cycle);
        Highstruct=future.KLineHigh(codes,startdate,enddate,cycle);
        Lowstruct=future.KLineLow(codes,startdate,enddate,cycle);
        Volstruct=future.KLineVol(codes,startdate,enddate,cycle);
        Amountstruct=future.KLineAmount(codes,startdate,enddate,cycle);
        OpenIntereststruct=future.KLineOpenInterest(codes,startdate,enddate,cycle);