NET.addAssembly([pwd,'FactorsLib2.dll']);

%% ��ȡȫ����Լ����ȡ�г����룬��Ʊ����
ccode=cell(FactorsLib2.FutureData.getCode()); %��ȡ��ʷȫ����Լ����
ccode=cell(FactorsLib2.FutureData.getCode(1)); %��ȡ���ڽ���״̬��Լ����
cmarket=cell(FactorsLib2.FutureData.getMarket(ccode)); %��ȡ�����Լ�Ľ��������루CFFEX-�й������ڻ�������, CZCE-֣����Ʒ������, DCE-������Ʒ������, SHFE-�Ϻ��ڻ���������
cname=cell(FactorsLib2.FutureData.getName(scode)); %��ȡ�����Լ�ļ��
sccode=cell(FactorsLib2.FutureData.getStandardContractCode(N,startdate,enddate)); %��ȡ�����Լ�ı�׼��Լ����
listedprice=double(FactorsLib2.FutureData.getListedPrice(codes));%��ȡ�����Լ�Ĺ��ƻ�׼��
dateinfo=cell(FactorsLib2.FutureData.getDateInfo(codes));%��ȡ�����Լ��������Ϣ(Ĭ����� ����ʼ������,�������,��󽻸��ա�)
dateinfo=cell(FactorsLib2.FutureData.getDateInfo(codes,'��󽻸���'));%��ȡ�����Լ��������Ϣ
dateinfo=cell(FactorsLib2.FutureData.getDateInfo(codes,'��ʼ������,�������'));%��ȡ�����Լ��������Ϣ