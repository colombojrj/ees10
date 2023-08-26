# Lab2

O objetivo desse encontro é:

- estudar a curva estática do sistema aeropêndulo
- familiarizar-se com a programação da placa de aquisição de dados OpenDAC em C++ e Simulink

## O que eu preciso fazer?

Você precisa:

- assistir o vídeo abaixo
- estudar o código lab2/main.cpp
- conseguir compilar e executar o código lab2/main.cpp

### Tarefinha

A EDO que descreve a dinâmica não-linear do aeropêndulo é 

$$ \ddot{\theta}(t) = -\alpha \sin(\theta(t)) - \beta \dot{\theta}(t) + \gamma u(t) $$

Prove que a função de transferência obtida aplicando o método da linearização de Taylor em torno do ponto de operação $(\bar{u}, \bar{\theta})$ é:

$$ G(s) = \frac{\theta(s)}{U(s)} = \frac{\gamma}{s^2 + \beta s + \alpha \cos(\bar{\theta})} $$

Bons estudos!

## Vídeo tutorial

[![Watch the video](https://img.freepik.com/vetores-premium/pagina-de-perfil-do-player-de-video-do-youtube-canal-do-blogger-modelo-de-interface-do-usuario-ux-do-site_73903-324.jpg)](https://youtu.be/1c_JSkU_FI8)

