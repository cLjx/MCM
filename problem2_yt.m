clc;clear
%��������Ǹ����ֲ���Ϳ����������yita
%�����ƽ̹�ĵ�������


Delta=pi/3;
n1=1;yita1=120*pi;
cthetai=cos(pi/2-Delta);

vv=.5;yv=80;
tempC=(1+vv*(sqrt(yv)-1))^2

mvs=1;%����
n2_=1*(1-mvs)+5*mvs;
yita2_=sqrt(1/tempC)*120*pi;
cthetat_=cos(sqrt(1-n1^2/n2_^2*(sin(pi/2-Delta))^2));
Lreal=-20*log10(abs(yita2_*cthetai-yita1*cthetat_)/(yita2_*cthetai+yita1*cthetat_));
Lreal


