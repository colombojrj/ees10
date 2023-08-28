clc, clear all

load 'data_u40deg'

t = linspace(0, (size(u, 1) - 1) * Ts, size(u, 1))';
plot(t, y)
grid
