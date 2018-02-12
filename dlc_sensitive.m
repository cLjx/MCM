clc;clear
%电离层的模型灵敏度分析
h0=788-457;
w=1179-759;
h=3004-2358;

close = 300;
II=imread('dlc1.jpg');
I=II(:,:,2);
[x y]=size(I);
Out=[];
for j=1:x
    for i=1:y
        if II(j,i,1)<=100 && II(j,i,2)<=100 && II(j,i,3)<=100
            Out(j)=i-close;
            break;
        end
    end
end
min=888;max=3179;
% plot(Out(min:max));
% ylim([0 2200]);
for i=1:max-min+1
    rou(i)=Out(max+1-i);
end
% figure
% plot(rou)
for inindex=1:100
Delta=pi/3;
NNN=inindex*10;
mh=h0/h*100;%最低面电离层的高度，单位km
MUF=[30 13.4];%单位MHz 
md=mh/sin(Delta)*2;
mf=.75*MUF(1)*10^6;
L0=32.45+20*log10(md)+20*log10(mf/10^6);
HHH=200;
sigman=0;mz0=HHH-mh;%正常高度325km 干扰高度360km(下面还有处)
me=1.602*10^-19;mc=3*10^8;
mm=9.106*10^-31;mw=2*pi*mf;
ma_=60*pi*me^2*mc/mm/(mw^2+mc^2);% N sqrt(yuxl r)
int_h=HHH;msitan=pi/2;
ljx=[];
for i=1:NNN-1
    int_h=int_h-mz0/NNN;
%     msitan=msitan-Delta/NNN;
    mzn_=10^(rou(round((int_h-mh)/100*h))/w+8);
    mzn=sqrt(1-80.8*mzn_./(mf.^2));
    msitan=1*sin(pi/2-Delta)/mzn;
    ma=ma_*mzn_/mzn;
    ml=mz0/NNN/sqrt(1-msitan^2);
    sigman=sigman+ma*ml;
    ljx(i)=sigman;
end
Li(inindex)=-10*log10(exp(-1*sigman));
inindexs(inindex)=NNN;
end
plot(inindexs,Li)