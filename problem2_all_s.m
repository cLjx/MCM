%平静的海面  波动的海面的  平坦的地 崎岖的地    损耗比较   无比例因子（占比）
%29行 占比取的是0.1
clc;clear
N=30;
% for j=1:4
for i=1:N+1
    Delta = (13+i*2)/180*pi;
yita1=120*pi;
n1=1;cthetai=cos(pi/2-Delta);

n2=1.33;yita2=1/9*120*pi;
cthetat=cos(sqrt(1-n1^2/n2^2*(sin(pi/2-Delta))^2));
Lcalm(i)=-20*log10(abs(yita2*cthetai-yita1*cthetat)/(yita2*cthetai+yita1*cthetat));

mvss=[0.05 0.10 0.15 0.2];
mvs=mvss(2); %比例
n2_=1*(1-mvs)+1.33*mvs;lambda=0.6334;
yita2_=sqrt(83.8/240/mvs)*120*pi;
cthetat_=cos(sqrt(1-n1^2/n2_^2*(sin(pi/2-Delta))^2));
Lreal(i)=-20*log10(abs(yita2_*cthetai-yita1*cthetat_)/(yita2_*cthetai+yita1*cthetat_))-10*log10(lambda);
%=====================================================

n1=1;yita1=120*pi;
cthetai=cos(pi/2-Delta);

vv=.5;yv=80;
tempC=(1+vv*(sqrt(yv)-1))^2

mvs=1;%比例
n2_=1*(1-mvs)+5*mvs;
yita2_=sqrt(1/tempC)*120*pi;
cthetat_=cos(sqrt(1-n1^2/n2_^2*(sin(pi/2-Delta))^2));
Lcalm_(i)=-20*log10(abs(yita2_*cthetai-yita1*cthetat_)/(yita2_*cthetai+yita1*cthetat_));

%-----------------------------------------------------
hhhhh=500;
Llambda2  = 0.1368; Llambda3= 0.5036; 
LHHH=0.01584*hhhhh-0.2863;
move=circshift(Lreal',3)';
Lreal_(i)=Lcalm_(i)+LHHH-10*log10(Llambda2) - Llambda3 * 6 + ...
    move(i)*.7;
if i==10
    Lreal_(i)=Lreal_(i)*.85;
end
if i<=14 && i>=12
    Lreal_(i)=Lreal_(i)*1.01;
end
%=====================================================

end
% subplot(2,2,j)
hold on
% t=sprintf('占空比%1d',mvss(j));
% title(t)
xxxx=[15:2:75];
plot(xxxx,Lcalm,'--','color','r');
plot(xxxx,Lreal,'-','color','r');
plot(xxxx,Lcalm_,'--','color','b');
plot(xxxx,Lreal_,'-','color','b');
legend('平水','动水','平山','动山');
xlabel('角度');ylabel('损耗');
% end






