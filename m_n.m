clear 
clc
m=10;
before=inf;
lose=zeros(1,100);
varr=zeros(1,100);
for mmm=1:100
fengji=8;
m=ceil(m*(1+.1));
pinpushu=m;
jiaodushu=m;

mytheta=15;
mytheta=mytheta/180*pi;
ljx=500;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ca=zeros(ljx,ljx);

% 3 2.438306 16.444115  4.053570
% 5 1.462983 9.866469   2.432142
% 7 1.044989 7.047480   1.737244
% 9 0.812770 5.481373   1.351190
% 11 0.664988 4.484760  1.105519
% 13 0.562683 3.794799  0.935439
% 15 0.487659 3.288826  0.810714
% 17 0.430288 2.901905  0.715336

wavewmin = [2.438306 1.462983 1.044989 0.812770 0.664988 0.562683 0.487659 0.430288];
wavewmax = [16.444115 9.866469 7.047480 5.481373 4.484760 3.794799 3.288826 2.90190];
wavewp=[4.053570 2.432142 1.737244 1.351190 1.105519 0.935439 0.810714 0.715336];

%-----------------------------------------------------
u=[3,5,7,9,11,13,15,17];
%---------------------------------------------------

if fengji>8
    fengji=8;
end
if fengji<1
    fengji=1;
end
fi=fengji;
wmin=wavewmin(fi);
wmax=wavewmax(fi);
wp=wavewp(fi);
ui=u(fi);
M=pinpushu;
N=jiaodushu;
wavewn=(wmax-wmin)/M;
thetawn=pi/N;
dx=1;
dy=1;
x=[0:dx:ljx];
y=[0:dy:ljx];
[x,y]=meshgrid(x,y);
z=zeros(size(x));
for wi=1:M
    for ki=1:N
        theta=-pi/2+(ki-1)*thetawn;
         epsin=rand*2*pi;
         w=wmin+(wi-1)*wavewn+wavewn/2;
         swi=0.81*exp(-7400/(w*ui+eps).^4)*2*(cos(theta)).^2/(pi*(w.^5+eps));
        an=sqrt(2*swi*wavewn*theta);
       z1=w*w*x*cos(theta)/9.8+w*w*y*sin(theta)/9.8+epsin;
       z=an*cos(z1)+z;
    end
end
% subplot(1,2,1)
% surfl(x,y,real(z));
% set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
% shading interp;
% lightangle(-45,30);
% set(findobj(gca,'type','surface'),'FaceLighting','phong','AmbientStrength',.3,'DiffuseStrength',.8,...
%     'SpecularStrength',.9,'SpecularExponent',200)

index=0;
indexx=zeros(1,ljx-1);
indexy=zeros(1,ljx-1);

for i=2:ljx
    for j=2:ljx
        myalpha=atan((z(j+1,i)-z(j,i))/1);
        if mytheta-2*myalpha<=0
            index=index+1;
%             plot3(i,j,z(j,i),'.','Color','r','MarkerSize',6)
            ca(i,j)=1;
        end
        myalpha=atan((z(i+1,j)-z(i,j))/1);
        if mytheta-2*myalpha<=0
            index=index+1;
%             plot3(i,j,z(j,i),'.','Color','r','MarkerSize',6)
            ca(i,j)=1;
        end
    end
end
% lose=index
losePercent=index/(ljx-1)/(ljx-1);
mmm
lose(mmm)=losePercent;
%% ca
% figure
% hold off
% % subplot(1,2,2)
% imagesc(ca);
% Map = [0,0,205;255 0 0]/255;colormap(Map);
% set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
now=var(z(:)');
if abs(now-before)<0.01
    break;
end
varr(mmm)=abs(now-before);
abs(now-before)
before=now;
end
plot(lose,'Color','b');
hold on
plot(now,'Color','r')
m
