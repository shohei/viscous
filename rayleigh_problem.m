clear; close all; clc;

C = 1;
mu = 1;
rho = 1;
tmax = 5;
ymax = 1;
ts = [0.01, 0.1];

figure(1);
hold on;
figure(2);
hold on;

for idx=1:length(ts)
  t = ts(idx);
  y = linspace(0,ymax,50);
  dudy = C./sqrt(mu*t/rho).*exp(-y.^2./(4*mu*t)*rho);
  dudy = dudy(2:end);
  figure(1);
  plot(dudy,y(2:end));
  us = [];
  for idy=2:length(y)-1
    y_partial = y(1:idy);
    dudy_partial = dudy(1:idy);
      u = trapz(dudy_partial,y_partial);
%        u = trapz(y_partial, dudy_partial);??
    us(idy) = u;
  end
  figure(2);
  plot(us,y(2:end));
end

figure(1);
% legend('t=0.01','t=0.1');
legend(string(ts));
title('速度勾配の大きさ');
xlabel('$\partial u / \partial x $','interpreter','latex', 'FontWeight','bold')
ylabel('y','interpreter','latex');
grid;

figure(2);
% legend('t=0.01','t=0.1');
legend(string(ts));
title('流速');
xlabel('$u / U$','interpreter','latex', 'FontWeight','bold')
ylabel('y','interpreter','latex');
grid;

figure(3);
t = 0:60; %s
nu = 15.01e-6; %m2/s
delta = sqrt(pi*nu*t); %m
plot(t,delta*100); %cm
title('Scale of delta dragged by air [cm]');
xlabel('time [s]');
ylabel('delta [cm]');
grid;
big;

H = 84.852; %km
T = 83.5-2*H; %C
P = 3.956*(214.65/(T+273.15))^(-17.082); %Pa
rho = 0.0034837*P/(T+273.15); %kg/m3
mu = 1.83e-5; %Pa•s
velocity = sqrt(pi)/2*sqrt(mu/(1*rho)); %m/s
fprintf('高度84kmでの境界層進展速度: %.2f [cm/s]\n',velocity*100);

H = 1; %km
T = 15-6.5*H; %C
P = 101325*(288.15/(T+273.15))^(-5.256);
rho = 0.0034837*P/(T+273.15); %kg/m3
mu = 1.83e-5; %Pa•s
velocity = sqrt(pi)/2*sqrt(mu/(1*rho)); %m/s
fprintf('高度1kmでの境界層進展速度: %.2f [cm/s]\n',velocity*100);






