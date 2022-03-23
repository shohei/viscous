clear; close all; clc;

Illingworth_Stewartson_transformation;

eta = linspace(0, 20, 50);
fprimeprime_tmps = linspace(0.45,0.48,1000);
errors = [];
for idx=1:length(fprimeprime_tmps)
    fprimeprime_tmp = fprimeprime_tmps(idx);
    [eta2, x] = ode45(@myode, eta, [0,0,fprimeprime_tmp]);
    fprime = x(:,2);
    fprime_inf = fprime(end);
    errors(end+1) = abs(fprime_inf-1);
    if abs(fprime_inf-1)<0.0001
        fprintf("found optimal f''(0): %.4f\n",fprimeprime_tmp);
        break;
    end
end

% plot(fprime, eta2);
% grid;

figure();
hold on;
Mes = [0,1,2,3,4,5];
% Mes = [1,2,3,4,5];
eta_comps = [];
for idx=1:length(Mes)
    Me = Mes(idx);
    Tw_Te = 1;
    u_Ue = fprime;
    gamma = 1.4;
    T_Te = 1+(gamma-1)/2*Me^2.*(1-u_Ue.^2);
    plot(T_Te, eta2);
    eta_comp = [];
    for jdx=1:length(eta2)
      eta_partial = [0;eta2(1:jdx)];
      T_Te_partial = [0;T_Te(1:jdx)];
      1/sqrt(2)*trapz(eta_partial, T_Te_partial);
      eta_comp(end+1) = 1/sqrt(2)*trapz(eta_partial, T_Te_partial);
    end    
    eta_comps(end+1,:) = eta_comp;
end
grid;
legend(arrayfun(@(x) sprintf('M=%.1f',x), Mes, 'UniformOutput', false));
ylim([0,10]);
big;

figure();
hold on;
for idx=1:length(eta_comps)
  eta_comp = eta_comps(idx);
  plot(fprime, eta_comps);  
end
ylim([0,10]);
legend(arrayfun(@(x) sprintf('M=%.1f',x), Mes, 'UniformOutput', false));
grid;
big;

function df = myode(eta, x)
f = x(1);
fprime = x(2);
fprimeprime = x(3);
df = [fprime;
    fprimeprime;
    -f*fprimeprime];
end