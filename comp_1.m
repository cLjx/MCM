%平静的海面和波动的海面的损耗比较
clc;clear
N=30;
for j=1:4
for i=1:N+1
    Delta = (13+i*2)/180*pi;
yita1=120*pi;
n1=1;cthetai=cos(pi/2-Delta);

n2=1.33;yita2=1/9*120*pi;
cthetat=cos(sqrt(1-n1^2/n2^2*(sin(pi/2-Delta))^2));
Lcalm(i)=-20*log10(abs(yita2*cthetai-yita1*cthetat)/(yita2*cthetai+yita1*cthetat));

mvss=[0.05 0.10 0.15 0.2];
mvs=mvss(j); %比例
n2_=1*(1-mvs)+1.33*mvs;lambda=0.6334;
yita2_=sqrt(83.8/240/mvs)*120*pi;
cthetat_=cos(sqrt(1-n1^2/n2_^2*(sin(pi/2-Delta))^2));
Lreal(i)=-20*log10(abs(yita2_*cthetai-yita1*cthetat_)/(yita2_*cthetai+yita1*cthetat_))-10*log10(lambda);
end
subplot(2,2,j)
hold on
t=sprintf('占空比%1d',mvss(j));
title(t)
plot([15:2:75],Lcalm,'b');
plot([15:2:75],Lreal,'r');
legend('平静','波动');
xlabel('角度');ylabel('损耗');
end






