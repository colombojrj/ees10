# Lab3

## Equipe de laboratório 13h30-15h10 (Time 1)

Adicione aqui os parâmetros $\alpha$, $\beta$, $\gamma$ e a equação da curva estática. Adicionalmente, coloque também as funções de transferência para os pontos de operação ($\bar{\theta}=20$º, $\bar{u}=$?), ($\bar{\theta}=40$º, $\bar{u}=$?), ($\bar{\theta}=75$º, $\bar{u}=$?) e ($\bar{\theta}=95$º, $\bar{u}=$?). Sugestão: crie subseções para organizar.

### Resultados

Abaixo, serão descritos apenas os resultados finais obtidos. O detalhamento desses resultados pode ser acessado [aqui](../resultados/time-1/lab-3/README.md).

#### Parâmetros

| $\alpha$ | $\beta$ | $\gamma$ |
|:-------:|:-------:|:-------:|
| 23,24 | 1,96 | 0,56 |
#### Curva estática

$u_{ss} = 34.81 y_{ss} + 0.883$

#### Funções de transferência para diferentes pontos de operação

##### Ponto de operação ($\bar{\theta}=20$º, $\bar{u}=11.34\%$):

$G(s) = \frac{\Delta \theta(s)}{\Delta U(s)} = \frac{0.64}{s^2 + 2.56 s + 20.40}$


##### Ponto de operação ($\bar{\theta}=40$º, $\bar{u}=23.51\%$):

$G(s) = \frac{\Delta \theta(s)}{\Delta U(s)} = \frac{0.47}{s^2 + 1.36 s + 18.97}$

## Equipe de laboratório 15h30-17h10 (Time 2)

Adicione aqui os parâmetros $\alpha$, $\beta$, $\gamma$ e a equação da curva estática. Adicionalmente, coloque também as funções de transferência para os pontos de operação ($\bar{\theta}=20$º, $\bar{u}=$?), ($\bar{\theta}=40$º, $\bar{u}=$?), ($\bar{\theta}=75$º, $\bar{u}=$?) e ($\bar{\theta}=95$º, $\bar{u}=$?). Sugestão: crie subseções para organizar.

## Objetivos

O objetivo desse encontro é:

- obter os parâmetros $\alpha$, $\beta$ e $\gamma$ do modelo dinâmico do aeropêndulo a partir de um ensaio a degrau
- desenhar o lugar geométrico das raízes

## Pré-Lab

### Deve-se apresentar esse pré-lab antes de iniciar o experimento e o grupo deve apresentar os resultados obtidos

Suponha que $\alpha = 20,8$, $\beta = 1,24$ e $\gamma = 0,47$ (*spoiler alert*: esses foram os coeficientes que eu obti). Estude os polos de

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha \cos(\bar{\theta})} $$

em função de $\cos(\bar{\theta})$. Em seguida responda:

1. Qual análise foi feita? O que se pode aprender dessa análise?
2. Qual é o menor ângulo crítico tal que a parte imaginária dos polos se torna zero? Apresente os cálculos.
3. Escreva um script matlab para plotar um gráfico com os polos de $G(s)$ em função de $\cos(\bar{\theta})$. Não vale usar o comando rlocus, implemente um laço *for* para varrer a faixa de $\bar{\theta} \in \{0, 0.1, ..., 180.0\}$ e utilize o comando *plot*. Sugestão: utilize o comando *root* para determinar as raízes.
4. Suponha que você deseja fechar uma malha de controle nesse sistema utilizando apenas um controlador proporcional $K_p$. Qual a faixa de $K_p$ que garante a estabilidade do sistema?

## No laboratório

### O que eu preciso fazer?

Realize ensaios aplicando um degrau (com amplitude conhecida: sugestão 10% e 15%) para determinar os parâmetros $\alpha$, $\beta$ e $\gamma$ do modelo do aeropêndulo. Estude o comportamento nos pontos de operação $\bar{\theta} = 20$º e $\bar{\theta} = 40$º. **Realize pelo menos três ensaios para cada ponto de operação**.

### Como eu faço isso?

Provavelmente, a maneira mais fácil de fazer isso é reutilizar o código do lab2. Simplesmente crie um sinal $u(t)$ no matlab que implementa o ensaio que você precisa fazer. Esse sinal provavelmente terá algumas etapas:

1. Conduzir o aeropêndulo até os arredores do ponto de operação ($\bar{u} = ?$, $\bar{\theta} = 20$º): sugestão, utilize a curva estática para calcular $\bar{u}$. Em seguida, gere uma rampa suave partindo de $u = 0$ e terminando em $u = \bar{u}$.
2. Permanecer em $\bar{u}$ por alguns segundos (sugestão 5 segundos), mas pode ser que esse valor precise ser maior
3. Aplicar um degrau com amplitude conhecida $A$, de modo que o controle "global" é $u = \bar{u} + A$
4. Mantenha $u = \bar{u} + A$ até o final do transitório
5. Realizar 3 ensaios e depois, fazer $\bar{\theta} = 40$º e realizar mais 3 ensaios

### Professor eu fiquei com dúvidas

Utilize os arquivos da pasta dados e também o arquivo gabarito.xopp para verificar como eu resolvi esse problema. Cabe salientar que não é necessariamente a melhor maneira de se resolver o problema, mas pelo menos um ponto de partida.
