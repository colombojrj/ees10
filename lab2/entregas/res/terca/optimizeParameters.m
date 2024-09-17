clc, clear all;
tRealAll = [];
thetaRealAll = [];

Kp = 18;
data = load("./data/K18.mat");
thetaReal = data.ans(3, :);
tReal = data.ans(1, :);

indices = tReal >= 23; %& tReal <= 25.5;
tReal = tReal(indices) - 23;
thetaReal = thetaReal(indices) - 0.6568;

syms s t;

% Parâmetros do sistema
alpha = sym('alpha');
beta = sym('beta');
gamma = sym('gamma');
am = sym('am');

% Função de transferência do sistema
GS = (gamma) / ((am * s + 1) * (s^2 + s * beta + alpha));
HS = Kp*GS / (1 + Kp*GS);

% gt = ilaplace(GS, s, t);
ht = ilaplace(HS, s, t);

function y = respostaModelo(params, tReal)
    alpha = params(1);
    beta = params(2);
    gamma = params(3);
    am = params(4);
    K = 18;

    syms s t;
    GS = gamma / ((am * s + 1) * (s^2 + s * beta + alpha));
    HS = (5 / s) * K*GS / (1 + K*GS);
    % gt = ilaplace(GS, s, t);
    ht = ilaplace(HS, s, t);
    y = double(subs(ht, t, tReal));
end

paramsIniciais = [19.0225, ...
                  1.4867, ...
                  0.5026, ...
                  0]; % alpha, beta, gamma, am

funObjetivo = @(params) sum((thetaReal - respostaModelo(params, tReal)).^2);
opcoes = optimset('Display', 'iter', 'MaxIter', 60);
paramsOtimizados = fminsearch(funObjetivo, paramsIniciais, opcoes);

% Exibe os parâmetros otimizados
alphaOtimo = paramsOtimizados(1);
betaOtimo = paramsOtimizados(2);
gammaOtimo = paramsOtimizados(3);
amOtimo = paramsOtimizados(4);

disp('Parâmetros otimizados:');
disp(['alpha = ', num2str(alphaOtimo)]);
disp(['beta = ', num2str(betaOtimo)]);
disp(['gamma = ', num2str(gammaOtimo)]);
disp(['am = ', num2str(amOtimo)]);

TF1 = tf(gammaOtimo, [1 betaOtimo alphaOtimo]);
TF2 = tf(1, [amOtimo 1]) * TF1;
TF = Kp*TF2 / (1 + Kp*TF2);

[thetaModel, tModel] = step(TF, tReal);

% Plota a resposta real e a resposta do modelo otimizado
figure;
plot(tReal, thetaReal, tModel, 5 * thetaModel);
legend('Resposta Real', 'Resposta Modelo Otimizado');
xlabel('Tempo');
ylabel('Resposta');
title('Comparação entre Resposta Real e Modelo Otimizado');
grid on;