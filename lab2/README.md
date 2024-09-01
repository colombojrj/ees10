# Lab2

O objetivo desse encontro é:

- introdução ao lugar geométrico das raízes

### Explicação

Foi decidido que o modelo do aeropêndulo é:

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha} $$

com $\alpha$, $\beta$ e $\gamma$ parâmetros a serem determinados experimentalmente (lab1).

Suponha que você vai fechar uma malha com um controlador proporcional. Para cada valor de $K$ existem dois polos de malha fechada. Se você plotá-los (em um gráfico com eixos real e imaginário), terá uma figura que descreve o comportamento em malha fechada (MF) do sistema. Essa figura recebe o nome de Lugar Geométrico das Raízes (LGR).

## O que eu preciso fazer no lab?

Basicamente você vai levantar experimentalmente o LGR do aeropêndulo e comparar com o resultado esperado (modelo).

1. Com o modelo, aplique o critério de Routh-Hurwitz para determinar o maior ganho $K$ que garante estabilidade do sistema
2. Selecione (pelo menos) 10 ganhos $K$ para testá-los experimentalmente
    * Professor, eu apliquei o critério de Routh-Hurwitz e deu que qualquer $K$ acima de um valor dá bom. E agora, como eu escolho os 10 valores de $K$?
    * Oriosvaldo, tem um atuador no sistema, certo?
    * Ããã tem sim
    * E qual é o maior valor de controle que pode ser aplicado nele?
    * Ããã eu acho que é 100%
    * Então, realize simulações para determinar o maior valor de $K$ tal que o controle máximo seja de 100% uai
4. Teste-os
5. Para cada experimento determine $\xi$ e $\omega_n$, para então calcular polos de malha fechada (faça o mesmo para o modelo)
6. Gere uma figura com os polos de MF com os dados obtidos via modelo e via experimental
7. Conclua: o seu modelo é bom? Se não for bom, terá de refazer o modelo (e por consequência, repetir esse procedimento todo =)
