clc;clear
%第一问的跳数的问题
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

Delta=pi/12;
NNN=500;
mh=h0/h*100;%最低面电离层的高度，单位km
mh=150;
MUF=[30 13.4];%单位MHz 
md=mh/sin(Delta);
mf=.85*MUF(1)*10^6;
L0=32.45+20*log10(md)+20*log10(8*10^-3);
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
Li=-10*log10(exp(-1*sigman));

Ps=10*log10(100*1000);
yita1=120*pi;
n1=1;cthetai=cos(pi/2-Delta);

n2=1.33;yita2=1/9*120*pi;
cthetat=cos(sqrt(1-n1^2/n2^2*(sin(pi/2-Delta))^2));
Lcalm=-20*log10(abs(yita2*cthetai-yita1*cthetat)/(yita2*cthetai+yita1*cthetat));
ppp(1)=Ps;
Ps=Ps-L0;ppp(2)=Ps;
Ps=Ps-Li;ppp(3)=Ps;
Ps=Ps-20*log10(md);ppp(4)=Ps;
Ps=Ps-Lcalm;ppp(5)=Ps;

Ps=Ps-20*log10(md);ppp(6)=Ps;
Ps=Ps-Li;ppp(7)=Ps;
Ps=Ps-20*log10(md);ppp(8)=Ps;
Ps=Ps-Lcalm;ppp(9)=Ps;

Ps=Ps-20*log10(md);ppp(10)=Ps;
Ps=Ps-Li;ppp(11)=Ps;
Ps=Ps-20*log10(md);ppp(12)=Ps;
Ps=Ps-Lcalm;ppp(13)=Ps;
% ppp(2:end)=ppp(2:end);%附加损耗

ppp=real(ppp)

