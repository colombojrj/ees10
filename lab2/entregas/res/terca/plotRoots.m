realRoots = [
    -2.0605 + 4.7868i -2.0605 - 4.7868i,
    -2.1868 + 4.7129i -2.1868 - 4.7129i,
    -2.8358 + 4.2918i -2.8358 - 4.2918i,
    -1.0272 + 5.7175i -1.0272 - 5.7175i,
    -0.8594 + 5.4158i -0.8594 - 5.4158i,
    -0.8592 + 5.4173i -0.8592 - 5.4173i,
    -1.0250 + 6.2170i -1.0250 - 6.2170i,
    -0.7659 + 6.1196i -0.7659 - 6.1196i,
    -0.4395 + 6.1251i -0.4395 - 6.1251i,
    -1.1689 + 5.7024i -1.1689 - 5.7024i,
    -0.3296 + 6.2892i -0.3296 - 6.2892i
]

alpha = [
    36.4553 
    30.5073 
    24.02969
    16.2091 
]
beta = [
    0.9520
    1.0717
    1.5489
    2.0818
]
gamma = [
    1.0573
    0.8825
    0.6915
    0.4647
]
am = [
    0.18815 
    0.18181 
    0.13342 
    0.045157
]

figure;
% for i = 1:4
%     sys = tf(gamma(i), conv([1 beta(i) alpha(i)], [am(i) 1]));
%     rlocus(sys)
%     hold on;
% end
i = 3;
sys = tf(gamma(i), conv([1 beta(i) alpha(i)], [am(i) 1]));
rlocus(sys)
hold on

plot(real(realRoots), imag(realRoots), 'rx')
ylim([-7 9])
xlim([-10 2])
legend("$\theta0=25$","Raizes experimentais", 'Interpreter','latex', 'Location', 'northWest');
hold off;
