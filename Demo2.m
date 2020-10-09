
clear all
close all
n = 1000;
Velocity = zeros(n); % constant velocity
v0=3;
vz=0.1;
for i=1:n
    v=v0+(i-1)*vz;
    Velocity(i,:)=v;
end
Velocity=1./Velocity;
h=1;

isy=1;isx=1; %source location

%inital time map
T0 = zeros(n)+99999;
T0(isy,isx) = 0;

%near source
for i=-5:5
    k1=i+isy;
    if(k1<1)
        continue;
    end
    aa=(k1-1)*h;
    aa=aa*aa;
    for j=-5:5
        k2=j+isx;
        if(k2<1)
            continue;
        end
        bb=(k2-1)*h;
        bb=bb*bb;
        dis=sqrt(aa+bb);
        T0(k1,k2)=dis*Velocity(k1,k2);
    end
end



tic;
TT_new=eikonal_time2d(Velocity,T0,h);
toc
tic;

figure;contour(TT_new,50)

