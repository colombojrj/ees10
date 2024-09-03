## Tabela com polos de malha fechada para diferentes ganhos $K$

Dado um modelo de segunda ordem com os seguintes parâmetros:
- $\alpha = 19.0225 $
- $\beta = 1.4867 $
- $\gamma = 0.5026 $

Os quais foram modelados a partir dos dados do último experimento, testou-se a eficácia de um controlador proporcional no projeto. A função de transferência em malha fechada $H(s)$ ficou, então:

$$H(s)=\dfrac{K_pG(s)}{1+K_pG(s)} = \dfrac{K_p\gamma}{s^2+\beta s+(\alpha+K_p\gamma)}$$

Para facilitarmos a obtenção de valores plausíveis para $K_p$, foi aplicado o critério de Routh-Hurwitz. Na realidade, o critério acabou não sendo tão útil assim, visto que nos limitamos apenas aos $K_p$'s pertencentes à $\mathbb{R}$.


### Simulação

Raízes encontradas para K's variados (na prática, simulamos os mesmos valores testados experimentalmente) dada a modelagem do sistema definida na prática anterior.

$$H(s)=\dfrac{K_pG(s)}{1+K_pG(s)} = \dfrac{K_p\gamma}{s^2+\beta s+(\alpha+K_p\gamma)}$$

Encontrando os polos:

| K  |        Polos de $$    |
|:--:|:---------------------:|
| 18 | $-0.7434 \pm 5.2456i$ |
| 19 | $-0.7434 \pm 5.2933i$ |
| 20 | $-0.7434 \pm 5.3405i$ |
| 21 | $-0.7434 \pm 5.3874i$ |
| 22 | $-0.7434 \pm 5.4338i$ |
| 23 | $-0.7434 \pm 5.4799i$ |
| 24 | $-0.7434 \pm 5.5255i$ |
| 25 | $-0.7434 \pm 5.5708i$ |
| 26 | $-0.7434 \pm 5.6158i$ |
| 27 | $-0.7434 \pm 5.6603i$ |
| 28 | $-0.7434 \pm 5.7045i$ |

### Parte experimental

Na prática, nos limitamos a testar alguns $K_p$'s em faixas razoáveis, que acabaram sendo de 18 a 28. Verificamos, ainda, que para $K_p$'s acima de 28, o sistema oscilou de forma indefinida.

| K  | $\alpha$ | $\beta$ | $\gamma$ |        Raízes         |
|:--:|:--------:|:-------:|:--------:|:---------------------:|
| 18 |          |         |          | $?$                   |
| 19 |          |         |          | $?$                   |
| 20 |          |         |          | $?$                   |
| 21 |          |         |          | $?$                   |
| 22 |          |         |          | $?$                   |
| 23 |          |         |          | $?$                   |
| 24 |          |         |          | $?$                   |
| 25 |          |         |          | $?$                   |
| 26 |          |         |          | $?$                   |
| 27 |          |         |          | $?$                   |
| 28 |          |         |          | $?$                   |

## Gráfico com os polos de malha fechada plotados

## Atualizações no modelo

Foi necessário atualizar o modelo, adicionando um polo adicional, referente à dinâmica do motor, o polo $p_m$. Este polo não havia sido considerado anteriormente, e teve seu valor encontrado de forma heurística.

A nova função de transferência $G(s)$ fica como:

$$G(s)=\frac{\gamma}{s^2+\beta s+\alpha} \cdot \frac{1}{1+s/p_m}$$

<!---
Perguntar pra rapazeada
-->