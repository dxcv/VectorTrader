%% ��ȡ�����߻���ڷ����ߺϳɵĸ�������K��
NET.addAssembly([pwd,'FactorsLib2.dll']);
scc=cell(FactorsLib2.Factors.getStockcode(1)); %ȫA�����й�Ʊ����
onemin=FactorsLib2.OneMinuteLine; % ʵ����

%% ��ȡ��ֹ�����յ�ǰ��ȨK��
cycle=[3,15,240]; %���ڣ���λ���ӣ���ͬʱ��ȡ������ڵ�K��
Closestruct=onemin.KLineClose(scc,startdate,enddate,cycle); % cycle=1������cycle�����ɻ�ȡ1�����ߣ�ǰ��Ȩ��
    % �������ڻ�1�����ߵ�����£����ClosestructΪstruct��ʽ��
        close=double(Closestruct.value);             %�۸����ݣ��а���numtime���У��а���stockcode����
        numtime=double(Closestruct.numtime)';        %ʱ������
        stockcode=cell(Closestruct.stockcode)';      %��Ʊ��������
        market=cell(Closestruct.market)';            %�г���������
    % ������ڵ�����£����ClosestructΪstruct�����ʽ��(���´��������һ�����ڵ�����)
        close=double(Closestruct(1).value);             %�۸����ݣ��а���numtime���У��а���stockcode����
        numtime=double(Closestruct(1).numtime)';        %ʱ������
        stockcode=cell(Closestruct(1).stockcode)';      %��Ʊ��������
        market=cell(Closestruct(1).market)';            %�г���������
        
        
% ���ѣ���������������һ����ȡȫA���������ʱ�����Ե��ڴ�ʹ�ã�32G�����ӽ����ޣ�����������ݣ����齫��Ʊ�ֶ������ȡ��Ȼ����ƴ����

        Openstruct=onemin.KLineOpen(scc,startdate,enddate,cycle);
        Highstruct=onemin.KLineHigh(scc,startdate,enddate,cycle);
        Lowstruct=onemin.KLineLow(scc,startdate,enddate,cycle);
        Volstruct=onemin.KLineVol(scc,startdate,enddate,cycle);
        Amountstruct=onemin.KLineAmount(scc,startdate,enddate,cycle);