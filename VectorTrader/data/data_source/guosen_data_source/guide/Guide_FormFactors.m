NET.addAssembly([pwd,'FactorsLib2.dll']);
factors=FactorsLib2.Factors; % ʵ����
%��Ҫ����ָ̬�꺯����C#��ȫ��Ϊ�Ǿ�̬��������˱���ʵ���������ã�����ֱ�ӽ�������

%% ������ָ̬���������������ݣ�open,high,low,close,vol������ʽΪm��n��ά����mΪʱ�����У�nΪ��Ʊ����
% �����������ͣ�
sharestruct=FactorsLib2.Factors.ShareStru('��ͨA��',scc,startdate,enddate,1); % ���������Ȼ�ղ�ȫ����ͨ�ɱ�
share=double(sharestruct.value);
closestruct=FactorsLib2.Factors.DayClose(scc,startdate,enddate,-2,-1); % ���������Ȼ�յ�����ȫ����������
close=double(closestruct.value);

%% ȫ����ָ̬�꺯��
data=double(factors.JinZhenTanDi(open,low,close)); % ����̽��
data=double(factors.KongZhongJiaYou(open,low,close)); % ���м���
data=double(factors.XiangTiTuPo(high,low,close)); % ����ͻ��
data=double(factors.YiYangSiXian(high,low,close)); % һ������
data=double(factors.QingTingDianShui(low,close)); % ���ѵ�ˮ
data=double(factors.DuoFangPao(open,high,low,close)); % �෽��
data=double(factors.HongSanBing(open,close)); % ������
data=double(factors.YangBaoYin(open,close)); % ������
data=double(factors.FangLiangTuPo(high,vol,share)); % ����ͻ��
% �����άm��n����