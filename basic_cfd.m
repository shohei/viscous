% clear; close all; clc;

L = 50e-2; %m
d = 7e-3; %m

% dx = 10e-2;
dy = 10e-2;
nx = 20;
ny = 20;
dx = L/nx;
dy = d/ny;

mu = 1.83e-5; %Pa
rho = 1.29; %kg/m3
Uinf = 20; %m/s

u = zeros(nx,ny);
v = zeros(nx,ny);
u(1,:) = Uinf; %入り口のX速度はUinf
u(:,1) = 0; %壁面のX速度はゼロ
v(:,1) = 0; %壁面のY速度はゼロ
u(:,ny) = Uinf; %上面のX速度はUinf

for i=1:nx-1
    for j=2:ny-1
        delta = dx/u(i,j)*...
                               (mu/rho*(u(i,j+1)-2*u(i,j)+u(i,j-1))/dy^2 -...
                                v(i,j)*(u(i,j+1)-u(i,j-1))/(2*dy));
        u(i+1,j) = u(i,j) + delta;

        for J=1:j-1
          v(i+1,j) = v(i+1,j) + dy/2*(-(u(i+1,J)-u(i,J))/dx - (u(i+1,J+1)-u(i,J+1))/dx);
        end
%         delta
%     i
%     j
%     u
%     pause(.1);
%     clc;
    end
end
v(:,ny) = v(:,ny-1); %境界条件の処理


u_first = u(1,:);
u_second = u(floor(nx*0.25),:);
u_third = u(floor(nx*0.5),:);
u_forth = u(floor(nx*0.75),:);
u_fifth = u(nx,:);

subplot(151);
plot(u_first, linspace(0,d,ny)*1000);
title('x=0%');
xlabel('X方向速度 u[m/s]');
ylabel('位置 [mm]');

subplot(152);
plot(u_second, linspace(0,d,ny)*1000);
title('x=25%');
xlabel('X方向速度 u[m/s]');
ylabel('位置 [mm]');

subplot(153);
plot(u_third, linspace(0,d,ny)*1000);
title('x=50%');
xlabel('X方向速度 u[m/s]');
ylabel('位置 [mm]');

subplot(154);
plot(u_forth, linspace(0,d,ny)*1000);
title('x=75%');
xlabel('X方向速度 u[m/s]');
ylabel('位置 [mm]');

subplot(155);
plot(u_fifth, linspace(0,d,ny)*1000);
title('x=100%');
xlabel('X方向速度 u[m/s]');
ylabel('位置 [mm]');

figure(2);

v_first = v(1,:);
v_second = v(floor(ny*0.25),:);
v_third = v(floor(ny*0.5),:);
v_forth = v(floor(ny*0.75),:);
v_fifth = v(ny,:);

subplot(151);
plot(v_first, linspace(0,d,ny)*1000);
title('x=0%');
xlabel('Y方向速度 v[m/s]');
ylabel('位置 [mm]');

subplot(152);
plot(v_second, linspace(0,d,ny)*1000);
title('x=25%');
xlabel('Y方向速度 v[m/s]');
ylabel('位置 [mm]');

subplot(153);
plot(v_third, linspace(0,d,ny)*1000);
title('x=50%');
xlabel('Y方向速度 v[m/s]');
ylabel('位置 [mm]');

subplot(154);
plot(v_forth, linspace(0,d,ny)*1000);
title('x=75%');
xlabel('Y方向速度 v[m/s]');
ylabel('位置 [mm]');

subplot(155);
plot(v_fifth, linspace(0,d,ny)*1000);
title('x=100%');
xlabel('Y方向速度 v[m/s]');
ylabel('位置 [mm]');


figure();
plot(u_fifth/Uinf, linspace(0,d,ny)*1000);
hold on;
plot(fprime, eta);
xlabel('u/Uinf');
ylabel('位置 [mm]');



big;
