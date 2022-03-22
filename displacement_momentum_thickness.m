clear; close all; clc;

blasius;

a = trapz(eta, 1-fprime);
figure();
area(eta, 1-fprime);
xlabel('$$\eta$$','Interpreter','latex');
ylabel('$$(1-\frac{u}{U_{\infty}}), U_{\infty}(1-\frac{u}{U_{\infty}})$$','Interpreter','latex');
fprintf('排除厚さ Displacement thickness δ*/x=%.4f/√Rex \n',a);

b = trapz(eta, fprime.*(1-fprime));
hold on;
area(eta, fprime.*(1-fprime));
fprintf('運動量厚さ Momemtum thickness θ/x=%.4f/√Rex \n',b);
legend('$$\left(1-\frac{u}{U_{\infty}}\right)$$', '$$U_{\infty}\left(1-\frac{u}{U_{\infty}}\right)$$','interpreter','latex');
title('排除厚さと運動量厚さの計算');

big;

