function[key]=wave()
beta1=[input('ÇëÊäÈëÔâÓö½Ç£º')];
V1=[input('ÇëÊäÈëº½ËÙ£¨½Ú£©£º')];
beta=beta1*pi/180;
V=V1*1852/3600;
g=9.8;
A=0.0081;
B=10;
N=25;

for t=1:1:200
    a1=0;
    for w=0.4:0.05:1.6
        kt=1-0.0833*w+0.0032*w^2-0.0000044*w^6;
        kb=1+0.0049*w-0.0124*w^4+0.0005*w^6;
        we=w+w^2*V*cos(beta)/g;
        et=sqrt(A/(2*N*B))*cos(we*t);
        aeo=kt*kb*w^2*et/g;
        a1p=aeo*sin(beta)*sin(we*t);
        a1=a1+a1p;
    end
    y(t)=a1;
end
t=1:1:200;
key=[t;y(t)];
save wave key;
plot(t,y);