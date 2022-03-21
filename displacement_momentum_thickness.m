clear; close all; clc;

blasius;

a = trapz(eta, 1-fprime);
fprintf('Displacement thickness δ*/x=%.4f/√Rex \n',a);

b = trapz(eta, fprime.*(1-fprime));
fprintf('Momemtum thickness θ/x=%.4f/√Rex \n',b);
