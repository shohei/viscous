clear; close all; clc;

% シューティング法による境界層方程式の解法

eta_max = 7;
eta = linspace(0,eta_max,100);

c_initials = linspace(0.3,0.4,1000); %解は0.3のあたりにある

fprime_ends = [];
for idx=1:length(c_initials)
  c_initial = c_initials(idx);
  [eta2,x] = ode23s(@myode, eta, [0, 0, c_initial]);
  f = x(:,1);
  fprime = x(:,2);
  fprimeprime = x(:,3);
  if abs(fprime(end)-1)<0.001
      fprintf("Optimal c init: %.6f, f'(inf):%.6f\n",c_initial, fprime(end));
      break;
  end
%    fprime_ends(idx) = fprime(end);
end

% plot(c_initials, fprime_ends);

vs = [];
for idx=1:length(eta)
 eta_ = eta(idx); 
 f_ = f(idx);
 fprime_ = fprime(idx);
 v = 0.5*(eta_*fprime_ - f_);
 vs(idx) = v;
end

figure();
plot(fprime, eta);
hold on;
plot(vs,eta,'--');
title('ブラジウスの解');
xlabel('$u/U_{\infty}, v/U_{\infty}$','interpreter','latex');
ylabel('$\eta$','interpreter','latex');
legend('$$\frac{u}{U_{\infty}}=f^\prime(\eta)$$','$$\frac{v}{U_{\infty}}\sqrt{\frac{\rho U_{\infty} x}{\mu}}=\frac{1}{2}(\eta f^\prime-f)$$','interpreter','latex');
grid;
big;

Ctau_coef = fprimeprime(1)*2;
fprintf('摩擦抵抗係数 Cτ: %.4f/√Re \n',Ctau_coef);


function f = myode (eta,x)
a = x(1);
b = x(2);
c = x(3);
f = [b;
    c;
    -a*c/2];
end

