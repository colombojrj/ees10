
# Lab1

O objetivo desse encontro é aprender a:

- em Simulink e em C++, implementar e resolver (numericamente) equações diferenciais
- em Simulink, implementar lógica if-else
- em Simulink, gerar sinais úteis para controle (rampa seguinda de degrau seguido de rampa, etc)
- em C++, carregar arquivos de dados Matlab
- em C++, multiplicação matricial básica
- em C++, criar arquivos Matlab

## O que eu preciso fazer?

Você precisa:

- assistir o vídeo abaixo
- estudar o código lab1/main.cpp
- conseguir compilar e executar o código lab1/main.cpp

### Tarefinha

Depois que você conseguir reproduzir o conteúdo mostrado no vídeo, implemente a EDO usando C++:

$$\dot{x}(t) = A x(t) + B u(t)$$

com $A \in \mathbb{R}^{n_x \times n_x}$ e $B \in \mathbb{R}^{n_u \times 1}$. Em outras palavras, adapte o programa lab1/main.cpp de modo que seja possível resolver numericamente esse conjunto de EDOs de primeira ordem.

É uma boa ideia fazer com que $A$ e $B$ possam ser carregados via arquivos matlab. Realizar essa implementação irá poupar muito tempo no (breve) futuro.

Você deve testar a sua implementação escrevendo um programa para aplicar um degrau à seguinte função de transferência:

$$ G(s) = \frac{Y(s)}{U(s)} = \frac{3}{s^2 + 2s + 3} $$

que no domínio do tempo pode ser escrita como sendo

$$ \dot{x}(t) = \left[ \begin{array}{cc} -2 & -3 \newline 1 & 0 \end{array} \right] x(t) + \left[ \begin{array}{cc} 1 \newline 0\end{array} \right] u(t) $$

$$ y(t) = \left[ \begin{array}{cc} 0 & 3 \end{array} \right] x(t) $$

Bons estudos!

## Vídeo tutorial

[![Watch the video](https://img.freepik.com/vetores-premium/pagina-de-perfil-do-player-de-video-do-youtube-canal-do-blogger-modelo-de-interface-do-usuario-ux-do-site_73903-324.jpg)](https://youtu.be/z2Qju1A9ORg)

