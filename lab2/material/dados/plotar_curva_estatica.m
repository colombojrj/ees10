clc, clear all

uss = [10.000 15.00 20.000 25.000 30.000];
yss = [ 0.253  0.39  0.515  0.655  0.785];

% Plotar o gráfico e navegar para
% "Tools" -> "Basic Fitting"
% plot(uss, yss)
% grid
% xlabel('uss')
% ylabel('yss')
display('uss -> yss')
display('yss = 0.027*uss - 0.0012')

% plot(yss, uss)
% grid
% xlabel('yss')
% ylabel('uss')
display('yss -> uss')
display('uss = 37.61*yss + 0.4558')

