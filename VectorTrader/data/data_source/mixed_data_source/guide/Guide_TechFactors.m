NET.addAssembly([pwd,'FactorsLib2.dll']);
factors=FactorsLib2.Factors; % ʵ����
%��Ҫ������ָ�꺯����C#��ȫ��Ϊ�Ǿ�̬��������˱���ʵ���������ã�����ֱ�ӽ������ã�ֱ����FactorsLib2.Factors.MACD�ᱨ��

%% ���㼼��ָ�����Ȼ�ȡ�������ݣ�open,high,low,close,vol������ʽΪm��n��ά����mΪʱ�����У�nΪ��Ʊ����
% ����
    % ������MACDָ�꣬�Ȼ�ȡ�������ݣ�
    closestruct=FactorsLib2.Factors.DayClose({'000001','000002'},730600,736875,1,-1); close=double(closestruct.value);
    % �ٷ���MACD������(��һ��������ʾ������ͣ���ѡ��'value','sdo','signal','all',�ֱ��ʾ����ֵ�������ٻ�ֵ���ź�ֵ��ȫ�������)
    sd=factors.MACD('signal',close);
    % �����
        value=double(sd.value); %����ֵ��3ά����ǰ2ά��Ӧ�����close��m��n����3ά���ȵ���Ҫ�����ֵ�ĸ�����������ź�ֵ����3ά���Ⱦ�Ϊ1��
        info=cell(sd.info); %����������������ֵ��Ϣ

%% ȫ��36������ָ�꺯��
sd2=factors.AD('signal',high,low,close,vol);
sd3=factors.CHO('signal',high,low,close,vol);
sd4=factors.ARBR('signal',open,high,low,close);
sd5=factors.ADTM('signal',open,high,low);
sd6=factors.MFI('signal',high,low,close,vol);
sd7=factors.ENV('signal',close);
sd8=factors.EMV('signal',high,low,vol);
sd9=factors.DMI('signal',high,low,close);
sd10=factors.DMA('signal',close);
sd11=factors.DKX('signal',open,high,low,close);
sd12=factors.CR('signal',high,low,close);
sd13=factors.CMO('signal',close);
sd14=factors.BIAS('signal',close);
sd15=factors.MA('signal',close);
sd16=factors.EMA('signal',close);
sd17=factors.MTM('signal',close);
sd18=factors.CCI('signal',high,low,close);
sd19=factors.BOLL('signal',close);
sd20=factors.KDJ('signal',high,low,close);
sd21=factors.MACD('signal',close);
sd22=factors.AMV('signal',open,close,vol);
sd23=factors.SKDJ('signal',high,low,close);
sd24=factors.RVI('signal',close);
sd25=factors.VMA('signal',open,high,low,close);
sd26=factors.VPT('signal',close,vol);
sd27=factors.WVAD('signal',open,high,low,close,vol);
sd28=factors.WMS('signal',open,high,low);
sd29=factors.WAD('signal',open,high,low);
sd30=factors.WMA('signal',close);
sd31=factors.VMACD('signal',vol);
sd32=factors.TRIX('signal',close);
sd33=factors.ROC('signal',close);
sd34=factors.PVI('signal',close,vol);
sd35=factors.PSY('signal',close);
sd36=factors.OSC('signal',close);
sd37=factors.NVI('signal',close,vol);