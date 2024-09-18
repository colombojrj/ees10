clc, clear all;

data = load("./testeDegPIDNormal.mat");
thetaReal = data.ans(3, :);
esforcoControle = data.ans(2, :);
tReal = data.ans(1, :);

indices = tReal >= 23;

tReal = tReal(indices) - 23;
thetaReal = thetaReal(indices); % - 0.6568;
esforcoControle = esforcoControle(indices);

set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultColorbarTickLabelInterpreter', 'latex');
set(groot, 'defaultLegendInterpreter', 'latex');

figure;
plot(tReal, thetaReal);
title("$\theta$ Real");
xlabel("Tempo (s)");
ylabel("$\theta$ (rad)");
grid on;
% yline(0.6568, "Label", "0.6568 rad", "LineStyle", "--", "FontSize", 10, "Interpreter", "latex");
% legend("");
hold off;

figure;
plot(tReal, esforcoControle);
title("Esfor\c{c}o de Controle");
xlabel("Tempo (s)");
ylabel("Pot\^encia aplicada (\%)");
grid on;
% yline(25, "Label", "25\%", "LineStyle", "--", "FontSize", 10, "Interpreter", "latex");
grid on;
hold off;