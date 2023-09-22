# Lab4

## Formulário

Modelo não-linear do aeropêndulo:

$$ \ddot{\theta}(t) = -\alpha \sin(\theta(t)) -\beta \dot{\theta}(t) + \gamma u(t) $$

Modelo linear do aeropêndulo em torno de ($\bar{u}, \bar{\theta}$):

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha \cos(\bar{\theta})} \frac{1}{\frac{1}{5}s + 1} $$

**Atenção** para o polo localizado em $s = -5$. Ele representa a dinâmica do motor. Ele vai te atrapalhar bastante. Mas também vai ajudar na taxa de sucesso na bancada.

## Equipe de laboratório 13h30-15h10

Poste aqui a função de transferência dos seus controladores.

## Equipe de laboratório 15h30-17h10

# Projeto Escolhido (Ainda não está pronto)

O projeto escolhido foi o correspondente ao grupo dos alunos *Arthur, Filipe e Matheus*. 

![Gráfico do Projeto Escolhido](../resultados/time-2/lab-4/images/Arthur_Filipe_Matheus%20-%20Curva%20Comparativa.jpg)

A análise dos resultados do experimento para o Time 2 mostram que o grupo dos alunos Arthur, Filipe e Matheus foi aquele que apresentou melhor ação do controlador sobre a planta. Pôde-se afirmar isso na medida em que foi nesse grupo em que a resposta da entrada foi melhor seguida pelo sistema (controlador + planta). Observa-se isso não apenas nos platôs e rampas que existem mas também nos momentos de descontinuidade onde se vê explicitamente a ação da parte derivativa do controlador PID. Isso se deve pois, como ha uma descontinuidade não removível, é naturalmente esperado um “pico”, o que se observa relativamente bem. Em todos os 3 casos de análise, observou-se um sinal aparentemente estranho na entrada o qual não acompanha o sinal comandado mas que se deve a dinâmica inicial de operação. No caso do grupo do Lucas, houve uma boa ação do controlador também mas que se apresentou menos eficiente no último platô do sinal de entrada. No caso do grupo do Douglas até a primeira metade houve uma resposta condizente na medida que o sinal de saída acompanhou bem o sinal de entrada. Entretanto, na segunda metade houve uma grande oscilação que se deveu, de acordo com o grupo, a uma situação de operação que levou o sistema a uma região de instabilidade. *Obs: as imagens comparativas da referência e da saída estão na pasta de resultados; Não se levou em conta o resultado do grupo dos alunos Luiz, Ricardo e Victória, como combinado com o professor com o grupo.*

## Resultado dos Grupos (Funções de Transferência e Kp, Ki e Kd para cada ângulo)

### Arthur, Filipe e Matheus

  PID 15°: Kd = 3.6848; Ki = 64.6507; Kp = 2.7273

  $$ T_{15}(s) = \frac{58s^2 + 105.6s + 969.8}{s^2 + 15s} $$

  PID 37.5°: Kd = 4.1028; Ki = 53.24; Kp = 4.4387

  $$ T_{37.5}(s) = \frac{66s^2 + 120.1s + 798.6}{s^2 + 15s} $$

  PID 55°: Kd = 4.411; Ki = 45.12; Kp = 6.7129

  $$ T_{55}(s) = \frac{117s^2 + 212.9s + 1128}{s^2 + 25s} $$

  PID 70°: Kd = 2.3625; Ki = 23.036; Kp = 4.7502

  $$ T_{70}(s) = \frac{52s^2 + 118s + 460.7}{s^2 + 20s} $$

  PID 85°: Kd = 2.9032; Ki = 6.08; Kp = 5.936
  
  $$ T_{85}(s) = \frac{64s^2 + 124.8s + 121.6}{s^2 + 20s} $$

### Douglas, Pedro, Felipe

PID 15°: Kd = 4.3880; Ki = 76.8200; Kp = 5.2992

  $$ T_{15}(s) = \frac{115s^2 + 209.3s + 1920}{s^2 + 25s} $$

  PID 37.5°: Kd = 4.4236; Ki = 65.8000; Kp = 6.9090

  $$ T_{37.5}(s) = \frac{117.5s^2 + 238.5s + 1645}{s^2 + 25s} $$

  PID 55°: Kd = 5.2196; Ki = 55.9740; Kp = 12.0110

  $$ T_{55}(s) = \frac{142.5s^2 + 356.2s + 1399}{s^2 + 25s} $$

  PID 70°: Kd = 5.2896; Ki = 40.0040; Kp = 13.7590

  $$ T_{70}(s) = \frac{146s^2 + 384s + 1000}{s^2 + 25s} $$

  PID 85°: Kd = 3.4676; Ki = 5.9148; Kp = 6.3106
  
  $$ T_{85}(s) = \frac{93s^2 + 163.7s + 147.9}{s^2 + 25s} $$

### Gabriel, Guilherme Fagundes, Lucas

PID 15°: Kd = 3.5991; Ki = 63.5796; Kp = 3.7088

  $$ T_{15}(s) = 75.69\frac{s^2 + 1.82s + 16.8}{s^2 + 20s} $$

  PID 37.5°: Kd = 3.7853; Ki = 54.6586; Kp = 5.8738

  $$ T_{37.5}(s) = 81.58\frac{s^2 + 2.11s + 13.4}{s^2 + 20s} $$

  PID 55°: Kd = 3.7137; Ki = 40.6212; Kp = 6.4714

  $$ T_{55}(s) = 84.46\frac{s^2 + 2.09s + 10.1}{s^2 + 21s} $$

  PID 70°: Kd = 3.4276; Ki = 24.4376; Kp = 6.2495

  $$ T_{70}(s) = 78.23\frac{s^2 + 1.99s + 6.56}{s^2 + 21s} $$

  PID 85°: Kd = 3.0012; Ki = 6.8418; Kp = 6.3838
  
  $$ T_{85}(s) = 69.41\frac{s^2 + 2.03s + 2.07}{s^2 + 21s} $$

### Luiz, Ricardo, Victoria

Conforme combinado com o professor, esse grupo terá os dados e o gráfico atribuídos mais tarde.



## Objetivos

O objetivo desse encontro é:

- projeto de PID usando Lugar Geométrico das Raízes
- identificar modelo de sistemas instáveis em malha aberta

## Pré-Lab

### O grupo deve apresentar esse pré-lab antes de iniciar o experimento

Projete controladores (sugestão: PIDs) de modo que a resposta a um degrau (em malha fechada) tenha as seguintes características:

 - $t_e \leq 2$ s
 - $M_p \leq 10$ %
 - erro de regime menor que 5%

Cada grupo deve alocar os polos de malha fechada em uma determinada posição. Não pode haver posições repetidas. Eu aloquei em $s = -2,3 \pm j1$. Considere os seguintes pontos de operação:

1. 15º - obrigatório
2. 37,5º - obrigatório
3. 55º - obrigatório
4. 70º - obrigatório
5. 85º - obrigatório
6. 100º - desafio
7. 117,5º - desafio
8. 145º - desafio

Veja esse vídeo sobre [ajuste de ganhos](https://www.youtube.com/watch?v=YiUjAV1bhKs). Depois que o seu grupo tiver projetado os controladores, implemente a lei de controle que combina todos os controladores projetados. Teste com o modelo não-linear do aeropêndulo. Uma possível solução encontra-se na pasta lab4/projeto. A sua lei de controle precisa sobreviver ao sinal de referência disponível naquela pasta!

### Dicas

- Você não é obrigado a usar um PID completo, ele pode ser apenas um PD ou então um PID + pinduricalhos
- Você pode fazer uso de pré-filtro
- Não use polos ou zeros maiores que $s = -30$
- Selecionar um único par complexo conjugado de polos dominantes de malha fechada para todos os projetos (do grupo) é uma boa ideia
- Observe o sinal de controle, se for maior que 80%, provavelmente não vai funcionar na bancada
- Utilize a ferramenta rltool para fazer os projetos
- Utilize o LGR para fazer os projetos

## No laboratório

### O que eu preciso fazer?

Provar que a sua lei de controle funciona.

## Obtendo os ganhos do PID

Uma possível função de transferência de um PID é

$$
 \left.\begin{aligned}
        G(s) = \frac{U(s)}{E(s)} &= K_p + \frac{K_i}{s} + \frac{sNK_d}{s+N} \\
        &= \frac{(K_p+NK_d)s^2 + (NK_p + K_i)s + NK_i}{s(s+N)} 
       \end{aligned}
 \right.
$$

Normalmente, ao projetar o PID usando o LGR, você acaba obtendo uma função de transferência como:

$$
G(s) = \frac{as^2 + bs + c}{s(s+N)}
$$

Os ganhos $K_p$, $K_i$ e $K_d$ podem ser obtidos resolvendo o seguinte sistema linear:

$$
\left[ \begin{array}{ccc}
1 & 0 & N \\
N & 1 & 0 \\
0 & N & 0
\end{array} \right]
\left[ \begin{array}{c}
K_p \\
K_i \\
K_d
\end{array} \right] =
\left[ \begin{array}{c}
a \\
b \\
c
\end{array} \right]
$$

## Implementando o PID em código

Existem **muitas** formas de se implementar um PID. Como precisamos combinar vários PIDs, será muito vantajoso escrever as EDOs que representam o PID e então combiná-las com uma interpolação, por exemplo. Supondo que o PID está na forma

$$
G(s) = \frac{as^2 + bs + c}{s(s+N)}
$$

Então as EDOs são:

$$
\left[ \begin{array}{c}
\dot{x}_1(t) \\
\dot{x}_2(t)
\end{array} \right]=
\left[ \begin{array}{cc}
0 & 1 \\ -e & -d
\end{array} \right]
\left[ \begin{array}{c}
x_1(t) \\ x_2(t)
\end{array} \right]+
\left[ \begin{array}{c}
0 \\ 1
\end{array} \right] u(t)
$$
$$
y(t) =
\left[ \begin{array}{cc}
(c- ea) & (b-da) 
\end{array} \right]
\left[ \begin{array}{c}
x_1(t) \\ x_2(t)
\end{array} \right]+
a u(t)
$$

Note $x_1(t)$ e $x_2(t)$ representam o estado interno do PID.

## Vídeo explicativo

[![Watch the video](https://img.freepik.com/vetores-premium/pagina-de-perfil-do-player-de-video-do-youtube-canal-do-blogger-modelo-de-interface-do-usuario-ux-do-site_73903-324.jpg)](https://youtu.be/U5Lesf2R3bE)
