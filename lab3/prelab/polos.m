clear, clc, close all

% Parâmetros
a = 20.8;
b = 1.24;

x = []; y = [];
for thetabar = 0:0.1:180
    raizes = roots([1 b a*cos(deg2rad(thetabar))]);
    x = [x ; real(raizes)];
    y = [y ; imag(raizes)];
end

plot(x, y, 'o')
grid
