# Lab1

O objetivo desse encontro é:

- familiarizar-se com a programação da placa de aquisição de dados OpenDAC com o Simulink
- familiarizar-se com o sistema aeropendulo
- estudar a validade do modelo não-linear apresentado por [(Enikov, 2012)](https://doi.org/10.1109/TE.2012.2195496) por meio da curva estática obtida experimentalmente 

## O sistema disponível no laboratório

No trabalho desenvolvido por [(Enikov, 2012)](https://doi.org/10.1109/TE.2012.2195496), o aeropendulo utilizou um motor CC. O acionamento do motor CC é muito fácil, como já foi visto no semestre passado. No entanto, o sistema disponível no nosso laboratório utiliza um motor BLDC+ESC, que exige um procedimento de partida.

O nosso ESC é um dispositivo eletrônico que aceita como comando um sinal de PWM com frequência de 400 Hz e tempo alto entre 1000 μs (que significa potência 0, isto é, parado) e 2000 μs (que significa potência máxima, isto é, velocidade máxima).

### O famoso bloco OpenDAC e o Simulink

Para utilizar a placa de aquisição de dados, deve-se fazer o seguinte:

 1. Crie uma pasta de trabalho
 2. Baixar o arquivo [dacSfunction.mexw64](https://gitlab.com/opendac/dac/dac-driver/uploads/90d6ca1549c1205d14d922a41ccdb0d3/dacSfunction.mexw64) para dentro da pasta de trabalho
 3. Baixar o arquivo Simulink que tem o [bloco OpenDAC](https://gitlab.com/-/project/47728518/uploads/b45bdd64845783da13fdd3725ff7cc41/simulink_block_r2015a.mdl) (se você já tem um diagrama Simulink, pode copiar e colar o bloco desse arquivo) para dentro da pasta de trabalho
 4. De dentro do MATLAB, navegue até a pasta de trabalho, caso contrário **NÃO VAI FUNCIONAR** (não pode só abrir o arquivo Simulink)
 5. Agora você pode abrir o arquivo Simulink
 6. As configurações do Simulink são: 
 - [ ] Solver options - Type: Fixed Step
 - [ ] *Solver* -  ODE4 (Runge Kutta)
 - [ ] *Fixed-step size*: 0.001
 - [ ] Habilite *Automatically handle rate transition for data transfer*
 - [ ] O *Stop time* deve ser ajustado conforme a necessidade

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/configuracoes-simulink.png
"Configurações do Simulink")

### Procedimento de partida

Estude a montagem elétrica disponível no [diagrama elétrico](https://raw.githubusercontent.com/colombojrj/ees10/main/diagrama_eletrico.pdf). Antes de seguir, ajuste a fonte de tensão para produzir 12 V (**e certifique-se que a saída está habilitada**).

O procedimento de partida que pode ser automatizado é descrito a seguir:

1. Habilitar a chave eletrônica: escreva 1 no pino PC15 (energizar o ESC)
2. Esperar 0,5 segundos para a eletrônica do ESC inicializar
3. Aplicar PWM com $t_{on}$ de 2000 μs
4. Esperar 2 segundos
5. Aplicar PWM com ton de 0 μs
6. Esperar 4 segundos
7. Aplicar PWM com $t_{on}$ de 1040 μs
8. Esperar 3,5 segundos
9. Aplicar $t_{on}$ = 0 μs até o final do experimento

O sinal de partida é mostrado graficamente na figura abaixo:

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/sinal_partida.png
"Sinal de partida")

> [!NOTE]
> Utilize o bloco [*Signal Editor*](https://www.mathworks.com/help/simulink/slref/signaleditorblock.html) para construir o sinal de partida.  Crie dois sinais nesse bloco. Um deles é o $partida(t)$, aplicado diretamente na planta durante a fase de inicialização. Essa fase tem duração de 10 segundos. Depois, o outro sinal $u(t)$ é o sinal de controle.

Vale lembrar que não aplicamos $u(t)$ no hardware. Ele aceita apenas *duty cycle* $0 \leq d(t) \leq 1$. Para facilitar a nossa vida, selecionaremos uma função que mapeia um sinal de controle $0 \leq u(t) \leq 100$ para $1040 \leq t_{on}(t) \leq 2000$ e então convertemos $t_{on}(t)$ para $d(t)$:

$$ t_{on}(t) = 1040 + \frac{960}{100} u(t) $$

$$ d(t) = \frac{400}{10^6} t_{on}(t) $$

Uma possível solução que combina os sinais de controle e partida é apresentada na figura abaixo:

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/solucao_dac1.png
"Solução em Simulink")

### Leitura do sinal de posição angular

O encoder é o sensor utilizado para medir a posição angular da haste do aeropêndulo. Quando configurado na resolução máxima, o encoder produz 8000 bordas a cada 360 graus. Logo, o ganho é $360 / 8000$ para converter para graus ou $2\pi / 8000$ para produzir radianos.

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/solucao_dac2.png
"Solução para leitura do sinal do encoder")

Depois do procedimento de partida, provavelmente o encoder não marca zero. Porém, utilizaremos essa posição angular como zero. Para isso, deve-se amostrar o sinal do encoder, guardá-lo e subtrair da sua respetiva leitura. Uma possível solução é mostrada na figura acima.

> [!TIP]
> Organize o seu diagrama Simulink de modo que fique parecido com o mostrado abaixo:

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/simulink_signal_builder.png
"Solução em Simulink")

## Modelo do sistema aeropendulo

![alt text](https://raw.githubusercontent.com/colombojrj/ees10/main/lab1/material/forcas-aeropendulo.png
"Diagrama de forças do aeropendulo")

Devido a similiridade entre os sistemas, talvez a EDO que descreve a dinâmica não-linear do aeropêndulo seja a mesma utilizada por [(Enikov, 2012)](https://doi.org/10.1109/TE.2012.2195496):

$$ \ddot{\theta}(t) = -\alpha \sin(\theta(t)) - \beta \dot{\theta}(t) + \gamma u(t) $$

sendo $\theta(t)$ o ângulo da haste. Se isso for verdade, então, no equilíbrio, isto é, $\ddot{\theta}(t) = \dot{\theta}(t) = 0$, a seguinte relação (linear) é válida:

$$ \sin(\bar{\theta}) = \frac{\gamma}{\alpha} \bar{u}  $$

1. Como podemos verificar a validade dessa relação experimentalmente? Isto é, qual (ou quais) experimentos devemos fazer essa verificação. 
2. Caso ela não seja válida, qual relação é?

> [!IMPORTANT] 
> Se for necessário medir o valor em regime permanente para uma entrada constante, utilize uma rampa suave para atingir o valor de controle desejado. Aplicar um degrau direto no aeropendulo pode ser perigoso. Além disso, utilize sinais de controle de até 40%.

Caso a relação não seja válida, então, a função de transferência obtida aplicando o método da linearização de Taylor em torno do ponto de operação $(\bar{u}, \bar{\theta})$ é:

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha \cos(\bar{\theta})} $$

Isso sugere um sistema de segunda ordem. Como vocês poderiam identificar, experimentalmente, os valores de $\alpha$, $\beta$ e $\gamma$? Qual o procedimento experimental a ser utilizado aqui?

Em casa, realize simulações e gere gráficos que mostrem que o modelo obtido é válido. Poste um resumo do trabalho realizado na pasta "entregas".
