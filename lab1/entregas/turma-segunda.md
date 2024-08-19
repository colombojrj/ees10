# Primeira entrega: parâmetros do modelo
## Modelagem Matemática
O levantamento de dados de estado estacionário mostrou um melhor ajuste linear em $\theta$, de modo que adotamos a EDO

$$ \ddot{\theta}(t) + \beta \dot{\theta}(t) + \alpha \theta(t) = \gamma u(t), $$

sendo $\theta(t)$ o ângulo da haste. Para verificar se o modelo é adequado, fez-se a análise do problema em seu estado estacionário (equilíbrio), ou seja, quando as derivadas em $\theta$ se anulam:

$$ \overline{\theta} = \frac{\gamma}{\alpha} \overline{u}.  $$

Ou seja, para garantir que a dinâmica é coerente, temos que analisar se a relação do ângulo de equilíbrio($\overline\theta$) é diretamente proporcional ao sinal fornecido ($u$), aqui medido em porcentagem da potência máxima, por conveniência.

## Dados obtidos

Os dados de ângulo de equilíbrio por sinal fornecido

| Sinal Fornecido($u$) | Ângulo de Equilíbrio ($\overline\theta$) | Ângulo de Equilíbrio ($\overline\theta$) |
| :------------------: | :--------------------------------------: | :--------------------------------------: |
|          5%          |                6,4 °                     |              0.1117 rad                  |
|         10%          |               13,9 °                     |              0.2426 rad                  |
|         15%          |               22,2 °                     |              0.3875 rad                  |
|         20%          |               29,5 °                     |              0.5149 rad                  |
|         25%          |               38,1 °                     |              0.6824 rad                  |

Com isso, foi realizado um gráfico do seno do angulo, com u solicitado.

![Ajuste com seno](./res/seno.jpg)

Um resultado satisfatório para a análise.

Porém, analisando o gráfico do ângulo medido em radianos, com o sinal solicitado, foi visto que:

![Ajuste com θ](./res/theta.jpg)

Ou seja, apesar dos resultados satisfatórios, com o seno do ângulo, podemos aproximar a EDP como sendo linear, sem grandes perdas de resultado.


## Hipótese Da linearidade
Assumindo a linearidade da EDP, podemos avaliar a função de transferência, através de simplificações matemáticas, como:

$$ G(s) = \frac{\Theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha} $$

Na forma padrão

$$G(s)=\frac{\gamma}{s^2 + 2\xi\omega_n + \omega_n^2} $$

temos

$$\beta = 2\xi\omega_n \quad \text{e} \quad \alpha = \omega_n^2$$

Com isso, podemos avaliar os termos desta função com os conhecimentos obtidos em sala:

$$M=\exp(\frac{-\pi\xi}{\sqrt{1-\xi^2}}) \implies\boxed{ \xi=\sqrt{\frac{\ln(M)^2}{\pi^2-\ln(M)^2}}} $$

e

$$t_p=\frac{\pi}{\omega_n \sqrt{1-\xi^2}} \implies \boxed{\omega_n=\frac{\pi}{t_p \sqrt{1-\xi^2}}}$$

Com $t_p$ sendo o tempo de subida, e $M$ sendo o overshoot.

Para cada valor de u, tem-se os resultados:

| **Entrada** | **Equilíbrio (rad)** | **Sobressinal (rad)** | **Overshoot** | **$\omega_n$** | **$\xi$** | **$\alpha$** | **$\beta$** |
|:-----------:|:--------------------:|:---------------------:|:-------------:|:--------------:|:---------:|:------------:|:-----------:|
| 5%          | 0.112                | 0.133                 | 18.7%         | 5.31           | 0.47      | 28.24        | 5.00        |
| 10%         | 0.242                | 0.343                 | 42.0%         | 4.69           | 0.27      | 21.99        | 2.50        |
| 15%         | 0.388                | 0.584                 | 50.6%         | 4.56           | 0.21      | 20.79        | 1.93        |
| 20%         | 0.516                | 0.785                 | 52.3%         | 4.58           | 0.20      | 21.00        | 1.85        |
| 25%         | 0.666                | 1.039                 | 56.1%         | 4.35           | 0.18      | 18.89        | 1.57        |

Para o $\gamma$, tomaremos o $\alpha$ médio $\overline{\alpha} = 22.18$ e, pelo coeficiente linear do ajuste em radianos.

$$ \gamma = \overline{\alpha} \cdot 0.00283 = 0.0628 $$

