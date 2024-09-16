clc, clear all;

data = load("./step35_5.mat");
thetaReal = data.ans(3, :);
tReal = data.ans(1, :);

indices = tReal >= 23;
tReal = tReal(indices) - 23;
thetaReal = thetaReal(indices) - 0.9247;

alpha = 16.2091
beta = 2.0818
gamma = 0.46471
am = 0.045157

tf1 = tf(gamma, [1 beta alpha]);
tf2 = tf(1, [am 1]);
tf = tf1 * tf2;

[thetaModel, tModel] = step(tf, tReal);

figure;
hold on;
plot(tReal, thetaReal);
plot(tModel, 5 * thetaModel);
grid on;
hold off;