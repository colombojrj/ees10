# Lab6

## Ponto de operação

Nesse lab vamos trabalhar com o ponto de operação $\bar{\theta} = 30$º. Faz-se necessário calcular o $\bar{u}$ necessário para que o aeropêndulo opere nesse ponto.

## Equipe de laboratório 13h30-15h10

Poste aqui o diagrama de Bode para esse ponto de operação. Informe também qual foi a frequência de ressonância e o pico de ganho.

## Equipe de laboratório 15h30-17h10

Poste aqui o diagrama de Bode para esse ponto de operação. Informe também qual foi a frequência de ressonância e o pico de ganho.

## Objetivos

- levantar o diagrama de Bode
- pico de ressonância

## Pré-Lab

### O grupo deve apresentar esse pré-lab antes de iniciar o experimento

#### Exercício 1

Responda:

1. O que é pico de ressonância?
2. Em qual tipo de sistema é comum encontrar pico de ressonância? É possível que um sistema tenha mais de um pico de ressonância?
3. Quais medidas são necessária para se levantar o gráfico de Bode?
4. Como se calcula o ganho a ser plotado no gráfico de Bode?
5. Como se calcula a fase a ser plotada no gráfico de Bode?

#### Exercício 2

Desenhe um diagrama Simulink para levantar o gráfico de Bode. Como sugestão de sinal de controle:

$$
u(t)  =  \left\{
  \begin{array}{lr}
 0, & \text{se } t < 10 \\
 r_1(t), & \text{se } t < 20 \\
 \bar{u} + A \sin(2 \pi f t), & \text{se } t < 30 \\
 r_2(t), & \text{se } t < 60 \\
 0, & \text{se } t \ge  70
  \end{array}
\right.
$$

Note que é necessário calcular a amplitude $A$ do seno de entrada. Se essa amplitude for muito pequena, efeitos como o atrito seco irão atrapalhar muito. Se for muito grande, então o efeito não-linear da geometria do aeropêndulo irá introduzir termos no seno. Uma sugestão é simular o modelo não-linear do aeropêndulo e determinar um valor aproximado para essa amplitude.

#### Exercício 3

Você já possui a função de transferência do aeropêndulo para esse ponto de operação. Faça o seguinte: determine 28 frequências que serão testadas para levantar o módulo do ganho e fase do sistema.

## No laboratório

### O que eu preciso fazer?

Levantar experimentalmente os pontos para a curva de Bode.

## Vídeo explicativo

Por se tratar de um experimento simples, esse lab não tem vídeo explicativo.

