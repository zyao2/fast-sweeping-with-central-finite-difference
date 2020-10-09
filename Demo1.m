
clear all
close all
n = 1000;
Velocity = ones(n); % constant velocity
h=1;

isy=1;isx=1; %source location

% ture solution
for k1=1:n
    for k2=1:n
        TT_true(k1,k2)=sqrt((k1-isy)^2+(k2-isx)^2)*h*Velocity(1,1);
    end
end


%inital time map
T0 = zeros(n)+99999;
T0(isy,isx) = 0;

%near source
for i=-5:5
    k1=i+isy;
    if(k1<1 || k1>n)
        continue;
    end
    aa=(k1-isy)*h;
    aa=aa*aa;
    for j=-5:5
        k2=j+isx;
        if(k2<1 ||k2>n)
            continue;
        end
        bb=(k2-isx)*h;
        bb=bb*bb;
        dis=sqrt(aa+bb);
        T0(k1,k2)=dis*Velocity(k1,k2);
    end
end



tic;
TT_new=eikonal_time2d(Velocity,T0,h);
toc
tic;
TT_old=eikonal_time2d_old(Velocity,T0,h);
toc
%plot the difference. scale 50 is applied to (TT_true-TT_new)
imagesc(abs([(TT_true-TT_new)*50,TT_true-TT_old]))



