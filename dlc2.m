clc;clear
%电离层高度抠图那里的情况
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
plot(Out(min:max));
ylim([0 2200]);



clear I II;
II=imread('dlc1_1.jpg');
I=II(:,:,2);
[x y]=size(I);
Out1=[];
for j=1:x
    for i=1:y
        if II(j,i,1)<=100 && II(j,i,2)<=100 && II(j,i,3)<=100
            Out1(j)=i-close;
            break;
        end
    end
end
hold on
plot(Out1(min:max));
