# Lab2

O objetivo desse encontro é:

- introdução ao lugar geométrico das raízes

### Explicação

Foi decidido que o modelo do aeropêndulo é:

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha \cos(\bar{\theta})} $$

com $\alpha$, $\beta$ e $\gamma$ parâmetros a serem determinados experimentalmente (lab1).

Suponha que você vai fechar uma malha com um controlador proporcional. Para cada valor de $K$ existem dois polos de malha fechada. Se você plotá-los (em um gráfico com eixos real e imaginário), terá uma figura que descreve o comportamento em malha fechada (MF) do sistema. Essa figura recebe o nome de Lugar Geométrico das Raízes (LGR).

Bons estudos!

## O que eu preciso fazer no lab?

Basicamente você vai levantar experimentalmente o LGR do aeropêndulo e comparar com o resultado esperado (modelo).

1. Com o modelo, aplique o critério de Routh-Hurwitz para determinar o maior ganho $K$ que garante estabilidade do sistema
2. Selecione (pelo menos) 10 ganhos $K$ para testá-los experimentalmente
3. Teste-os
4. Para cada experimento determine $\xi$ e $\omega_n$, para então calcular polos de malha fechada (faça o mesmo para o modelo)
5. Gere uma figura com os polos de MF com os dados obtidos via modelo e via experimental
6. Conclua: o seu modelo é bom? Se não for bom, terá de refazer o modelo
