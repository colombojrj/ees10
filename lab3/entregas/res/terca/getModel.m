dataT = cell(1, 8);
dataTheta = cell(1, 8);

% Carrega todos os arquivos de dados
for i = 1:8
    filename = sprintf("./data/%d.mat", i * 5);
    temp = load(filename);
    dataT{i} = temp.ans(1, :);
    dataTheta{i} = temp.ans(2,:);
end

figure;
hold on;
for i = 1:8
    plot(dataT{i}, dataTheta{i});
end
hold off;

thetaSS = zeros(1, 7);
pot = linspace(5, 35, 7);

% Calcula os valores de estado estacionário
for i = 1:7
    thetaSS(i) = mean(dataTheta{i}(end - 1000:end))
end

coefAngular = pot'\thetaSS'

figure;
plot(pot, pot * coefAngular, pot, thetaSS);
xlabel('Porcentagem de pot\^encia', 'Interpreter','latex');
ylabel('$\theta_{ss}$ ($rad$)', 'Interpreter','latex');
leg = legend({'Regress\~ao linear', 'Planta'});
set(leg, 'Interpreter', 'latex');
grid on;

% Pega os cinco primeiros picos de cada conjunto de dados
peaks = zeros(5, 8);
locs = zeros(5, 8);
for i = 1:8
    [pksTemp, locsTemp] = findpeaks(dataTheta{i}(5020:end), dataT{i}(5020:end));
    peaks(:, i) = pksTemp(1:5);
    locs(:, i) = locsTemp(1:5);
end

% Calcula os coeficientes de amortecimento
Mp = (peaks(1, 1:7) - thetaSS) ./ thetaSS;
K = -log(Mp) / pi;
coefAmortecimento = K./sqrt(1 + K.^2);

% Calcula as frequências naturais
wn = pi ./ (sqrt(1-coefAmortecimento.^2) .* (locs(1, 1:7)-16));

% Calcula as constantes alpha, beta e gamma do sistema para cada potência
beta = 2*coefAmortecimento.*wn;
alpha = wn.^2;
gamma = coefAngular.*alpha;

k = 6;
G = tf(gamma(k), [1 beta(k) alpha(k)])
[thetaModel, tModel] = step(G, (dataT{k}(5335:end) - 16));

figure;
hold on;
plot(dataT{k}(5335:end) - dataT{k}(5335), dataTheta{k}(5335:end));
plot(tModel, pot(k)*thetaModel);
yline(thetaSS(k));
grid on;
hold off;