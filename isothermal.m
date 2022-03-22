clear; close all; clc;

Mes = [0, 0.8, sqrt(5), 5];
u_Ue = linspace(0,1.0,20);
Tw_Te = 2.0;
gamma = 1.4;
figure();
hold on;
for idx=1:length(Mes)
    Me = Mes(idx);
    T_Te = Tw_Te + (1-Tw_Te).*u_Ue+(gamma-1)/2*Me^2.*u_Ue.*(1-u_Ue);
    plot(u_Ue, T_Te);
end
title('等温壁条件における境界層内の流速と温度分布');
xlabel('$$\frac{u}{U_{\infty}}$$','Interpreter','latex');
ylabel('$$\frac{T_w}{T_e}$$','Interpreter','latex');
legend(arrayfun(@(x) sprintf('Me=%.2f',x), Mes, 'UniformOutput', false));
grid;
big;




