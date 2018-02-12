clc;clear
%计算最后的衰减 区域12
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
%--------------------------------------------------------------------------
realindex=0;
for inindex=30:0.1:60
realindex=realindex+1;
Delta=inindex/180*pi;
NNN=500;
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
Li=-10*log10(exp(-1*sigman));

Ps=10*log10(100*1000);
yita1=120*pi;
n1=1;cthetai=cos(pi/2-Delta);

n2=1.33;yita2=1/9*120*pi;
cthetat=cos(sqrt(1-n1^2/n2^2*(sin(pi/2-Delta))^2));
Lcalm=-20*log10(abs(yita2*cthetai-yita1*cthetat)/(yita2*cthetai+yita1*cthetat));
Po_calm=Ps-L0-Li-Lcalm;

mvs=0.1;%比例
n2_=1*(1-mvs)+1.33*mvs;lambda=0.6334;
yita2_=sqrt(83.8/240/mvs)*120*pi;
cthetat_=cos(sqrt(1-n1^2/n2_^2*(sin(pi/2-Delta))^2));
Lreal=-20*log10(abs(yita2_*cthetai-yita1*cthetat_)/(yita2_*cthetai+yita1*cthetat_))-10*log10(lambda);
Po_real= Ps-L0-Li-Lreal;

LLLall(realindex)=real(L0+Li);
LLLall_(realindex)=real(L0+Li*2+Lreal+20*log10(md));
LLLall_(realindex)-LLLall(realindex)

% if inindex==42
    LL42(realindex)=LLLall(realindex);
% end
% if inindex==60
    LL60(realindex)=LLLall_(realindex);
% end

mdsss(realindex)=md;

end
figure 
hold on
plot(LLLall,'b')
plot(LLLall_,'r')
axis([30 60 100 210])
legend('1','2')
grid on

%% area 12
clc
between60=[42*5:60*5];
between42=[31*5:49*5];
LL_LL=LL60(between60)-LL42(between42);
% LL_LL=LL60(42:60)-LL42(31:49);
% LL_LL=LL_LL*1000;
cosj=cos((mdsss(between60)-mdsss(between42)*2)*2*pi/(3*10^8/mf));

area12lose=-20*log10(1./(1+10.^(LL_LL/10).*cosj));
area12lose=real(area12lose);
figure
plot([1:size(area12lose,2)]/size(area12lose,2)*19+42,real(area12lose))
hold on
left=Ps-LLLall(between60)+152.5+9;
% size(left,2)-size(area12lose,2)
plot([1:size(area12lose,2)]/size(area12lose,2)*19+42,left,'r')
legend('损耗','剩余')
firstI=2;
for i=1:size(left,2)
    
    if area12lose(i)>left(i) && firstI==0
        getI(i)=i;
        firstI=2;
    end
    if area12lose(i)<left(i) && firstI==2
        getI(i)=i;
        firstI=0;
    end
    
end



