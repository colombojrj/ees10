tRealAll = [];
thetaRealAll = [];

data = load("./step35_5.mat");
thetaReal = data.ans(3, :);
tReal = data.ans(1, :);

indices = tReal >= 23;
tReal = tReal(indices) - 23;
thetaReal = thetaReal(indices) - 0.9247;

syms s t;

% Parâmetros do sistema
alpha = sym('alpha');
beta = sym('beta');
gamma = sym('gamma');
am = sym('am');
k = 0.026419745076286;

% Função de transferência do sistema
GS = (gamma) / ((am * s + 1) * (s^2 + s * beta + alpha));

gt = ilaplace(GS, s, t);

function y = respostaModelo(params, tReal)
    alpha = params(1);
    beta = params(2);
    gamma = params(3);
    am = params(4);

    syms s t;
    GS = (5 / s) * (gamma) / ((am * s + 1) * (s^2 + s * beta + alpha));
    gt = ilaplace(GS, s, t);
    y = double(subs(gt, t, tReal));
end

paramsIniciais = [29.76, ...
                2.47, ...
                0.75, ...
                0.10]; % alpha, beta, am
funObjetivo = @(params) sum((thetaReal - respostaModelo(params, tReal)).^2);
opcoes = optimset('Display', 'iter', 'MaxIter', 100);
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

TF = tf(gammaOtimo, [1 betaOtimo alphaOtimo]) * tf(1, [amOtimo 1]);
[thetaModel, tModel] = step(TF, tReal);

% Plota a resposta real e a resposta do modelo otimizado
% figure;
% plot(tReal, thetaReal, tModel, 35 * thetaModel);
% legend('Resposta Real', 'Resposta Modelo Otimizado');
% xlabel('Tempo');
% ylabel('Resposta');
% title('Comparação entre Resposta Real e Modelo Otimizado');
% grid on;