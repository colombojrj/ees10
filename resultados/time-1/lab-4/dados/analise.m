clear all
load('resultados_gerais.mat')

% Visualizando as curvas
% plot(ref,'DisplayName','ref');hold on;plot(dados_renan_2,'DisplayName','dados_renan_2');plot(dados_renan_1,'DisplayName','dados_renan_1');plot(dados_peres_2,'DisplayName','dados_peres_2');plot(dados_peres_1,'DisplayName','dados_peres_1');plot(dados_pedros,'DisplayName','dados_pedros');plot(dados_emanuel_2,'DisplayName','dados_emanuel_2');plot(dados_emanuel_1,'DisplayName','dados_emanuel_1');hold off;

erro_total_emanuel_1 = norm(dados_emanuel_1 - ref);
erro_total_emanuel_2 = norm(dados_emanuel_2 - ref);

erro_total_renan_1 = norm(dados_renan_1-ref);
erro_total_renan_2 = norm(dados_renan_2-ref);

erro_total_peres_1 = norm(dados_peres_1 - ref);
erro_total_peres_2 = norm(dados_peres_2 - ref);

erro_total_pedros = norm(dados_pedros - ref);

% A partir disto, teríamos que os dados do grupo do Guilherme Peres seriam
% os melhores, porém analisaremos o sobressinal, que é maior que 10%
% portanto não satisfaz requisito.

[valor_maximo_peres, indice_peres] = max(dados_peres_2 - ref);
max_sobressinal_peres = valor_maximo_peres/ref(indice_peres);

[valor_maximo_renan, indice_renan] = max(dados_renan_2 - ref);
max_sobressinal_renan = valor_maximo_renan/ref(indice_renan);

[valor_maximo_emanuel, indice_emanuel] = max(dados_emanuel_2 - ref);
max_sobressinal_emanuel = valor_maximo_emanuel/ref(indice_emanuel);

[valor_maximo_pedros, indice_pedros] = max(dados_pedros - ref);
max_sobressinal_pedros = valor_maximo_pedros/ref(indice_pedros);

% Ainda que possua o menor sobressinal, qualitativamente o modelo dos dados
% em "dados_emanuel_2" não funcionam bem qualitativamente no último degrau aplicado, de
% forma que não pode ser o sistema adotado.

% comparativo entre o conjunto de controladores do dados_emanuel_2 e
% dados_pedros, nota-se que, embora o modelo que gera os dados_pedros nao 
% seja o melhor no geral, é o melhor modelo em todo o sistema, com menor
% sobressinal e mais proximidade com a entrada aplicada.
plot(ref,'DisplayName','ref');hold on;plot(dados_emanuel_2,'DisplayName','dados_emanuel_2');plot(dados_pedros,'DisplayName','dados_pedros');hold off;
