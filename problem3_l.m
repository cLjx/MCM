clc;clear
%计算距离了

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
minm=888;maxm=3179;
% plot(Out(min:max));
% ylim([0 2200]);
for i=1:maxm-minm+1
    rou(i)=Out(maxm+1-i);
end
%--------------------------------------------------------------------------
for inindex=1:89
Delta=inindex/180*pi;
NNN=800;
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
%做轨迹图
xLocationx=[];yLocationy=[];
for i=1:NNN-1
    int_h=int_h-mz0/NNN;
%     msitan=msitan-Delta/NNN;
    mzn_=10^(rou(round((int_h-mh)/100*h))/w+8);
    mzn=sqrt(1-80.8*mzn_./(mf.^2));%电离层折射率变化
    msitan=1*sin(pi/2-Delta)/mzn;% sin (theta n)
%     ma=ma_*mzn_/mzn;
    ml=mz0/NNN/sqrt(1-msitan^2)*msitan;
%     sigman=sigman+ma*ml;
    ljx(i)=ml;
    yLocationy(i)=mz0/NNN*i+mh;
%     if msitan>=0.1
%         i/NNN
%         break;
%     end
end
Li(inindex)=real(sum(ljx))*2+mh*cos(Delta);
ljx__=ljx(end:-1:1);
% plot((1:NNN-1)/NNN*HHH+mh,ljx__-min(ljx)+1)
end
% Li=Li*2+mh*cos(Delta);
figure
plot([15:75],Li(15:75))
min(Li(30:60))
max(Li(30:60))
for i=30:60
    if Li(i)-208.7247*2<2
        ljx1=i
        break;
    end
end



