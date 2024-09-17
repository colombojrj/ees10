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

% Função de transferência do sistema
GS = (gamma) / (s^2 + s * beta + alpha+Kp*gamma);

gt = ilaplace(GS, s, t);

function y = respostaModelo(params, tReal)
    alpha = params(1);
    beta = params(2);
    gamma = params(3);
    K = 18;

    syms s t;
    GS = K*gamma / (s^2 + s * beta + alpha+K*gamma);
    gt = ilaplace(GS, s, t);
    y = double(subs(gt, t, tReal));
end

paramsIniciais = [19.0225, ...
                  1.4867, ...
                  0.5026]; % alpha, beta, gamma

funObjetivo = @(params) sum((thetaReal - respostaModelo(params, tReal)).^2);
opcoes = optimset('Display', 'iter', 'MaxIter', 60);
paramsOtimizados = fminsearch(funObjetivo, paramsIniciais, opcoes);

% Exibe os parâmetros otimizados
alphaOtimo = paramsOtimizados(1);
betaOtimo = paramsOtimizados(2);
gammaOtimo = paramsOtimizados(3);

disp('Parâmetros otimizados:');
disp(['alpha = ', num2str(alphaOtimo)]);
disp(['beta = ', num2str(betaOtimo)]);
disp(['gamma = ', num2str(gammaOtimo)]);
% disp(['am = ', num2str(amOtimo)]);

TF = tf(Kp*gammaOtimo, [1 betaOtimo alphaOtimo+Kp*gammaOtimo]);

[thetaModel, tModel] = step(TF, tReal);

% Plota a resposta real e a resposta do modelo otimizado
figure;
plot(tReal, thetaReal, tModel, 5 * thetaModel);
legend('Resposta Real', 'Resposta Modelo Otimizado');
xlabel('Tempo');
ylabel('Resposta');
title('Comparação entre Resposta Real e Modelo Otimizado');
grid on;