%% ³ø·¿
clc;clear

hold on;
%% 
clc;clear
II=imread('dlc.jpg');
I=II(:,:,2);
[x y]=size(I);
for j=1:y
    for i=1:x
        if II(i,j,1)<=100 && II(i,j,2)<=100 && II(i,j,3)<=100
            I(x+1-i,j)=0;
        else
            I(x+1-i,j)=1;
        end
    end
end
% imagesc(I);
% Map = [0,0,0;1 1 1];colormap(Map);
clc;clear
II=imread('dddh.jpg');
I=II(:,:,2);
[x y]=size(I);
for j=1:y
    for i=1:x
        if II(i,j,1)<=100 && II(i,j,2)<=100 && II(i,j,3)<=100
            I(x+1-i,j)=0;
            [i j]
        else
            I(x+1-i,j)=1;
        end
    end
end
imagesc(I);
% Map = [0,0,0;1 1 1];colormap(Map);
h0=788-457
w=1179-759
h=3004-2358