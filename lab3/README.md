
# Lab3

## Formulário

Modelo linear do aeropêndulo em torno de ($\bar{u}, \bar{\theta}$):

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha} \frac{1}{\frac{1}{p_m}s + 1} $$

**Atenção** para o polo localizado em $s = -p_m$. Ele representa a dinâmica do motor. Ele vai te atrapalhar bastante. Mas também vai ajudar na taxa de sucesso na bancada.

## Objetivos

O objetivo desse encontro é:

- projeto de PID usando Lugar Geométrico das Raízes
- obtenção de modelo para outros pontos de operação

## Pré-Lab

### O grupo deve apresentar esse pré-lab antes de iniciar o experimento

Projete controladores (sugestão: PIDs) de modo que a resposta a um degrau (em malha fechada) tenha as seguintes características:

- $t_e \leq 3$ s
- $M_p \leq 5$ %
- erro de regime menor que 5%

Cada grupo deve alocar os polos de malha fechada em uma determinada posição e não podem haver posições repetidas. Faça o projeto para o modelo obtido. Veja esse vídeo sobre [ajuste de ganhos](https://www.youtube.com/watch?v=YiUjAV1bhKs).

### Dicas

- Você não é obrigado a usar um PID completo, ele pode ser apenas um PD ou então um [PID + pinduricalhos](https://www.google.com.br/books/edition/PID_Controllers/FsyhngEACAAJ?hl=pt-BR&sa=X&ved=2ahUKEwis1tS_86GIAxX2rpUCHfDFFkoQiqUDegQIAxAC)
- Você pode fazer uso de pré-filtro
- Não use polos ou zeros maiores que $s = -30$
- Observe o sinal de controle, se for maior que 60%, então provavelmente não vai funcionar na bancada
- Utilize a ferramenta [rltool](https://www.mathworks.com/help/control/ug/root-locus-design.html) (ou a [sisotool](https://www.mathworks.com/help/control/ref/controlsystemdesigner-app.html)) para fazer os projetos
- Utilize o LGR para fazer os projetos
- Implemente o PID (no Simulink) com o bloco [PID](https://www.mathworks.com/help/simulink/slref/pidcontroller.html)

## No laboratório

### O que eu preciso fazer?

1. Provar que a sua lei de controle funciona;
2. Escolher mais 3 pontos de operação e realizar experimentos para identificar os respectivos modelos.

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
(c- ea) & (b-da) \end{array} \right]  
\left[ \begin{array}{c}  
x_1(t) \\ x_2(t)  
\end{array} \right]+  
a u(t)  
$$

Note $x_1(t)$ e $x_2(t)$ representam o estado interno do PID.

## Vídeo explicativo

Esse vídeo foi feito para um roteiro antigo. Embora algumas coisas foram movimentadas para outros laboratórios, vale a pena assistir para aprender a usar o rltool/sisotool.

[![Watch the video](https://img.freepik.com/vetores-premium/pagina-de-perfil-do-player-de-video-do-youtube-canal-do-blogger-modelo-de-interface-do-usuario-ux-do-site_73903-324.jpg)](https://youtu.be/U5Lesf2R3bE)
