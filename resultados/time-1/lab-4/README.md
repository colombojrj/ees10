

## Análise do melhor conjunto de controladores
A fim de decidir qual dos conjuntos de controladores seria o melhor, utilizou-se a [rotina no matlab](../lab-4/dados/analise.m) e, por conta do melhor comportamento qualitativo, melhores sobressinais e comportamento quantitativo (erro quadrático total) semelhante aos demais, decidiu-se que o melhor controlador é o do grupo de Julio Amorim, Nando Ferreira, Pedro Augusto e Pedro Augusto. As funções de transferência e os respectivos ganhos podem ser vistos [aqui](#julio-amorim-nando-ferreira-pedro-augusto-e-pedro-augusto).

Convém comentar que o comportamento nos gráficos semelhante à aplicação de um degrau unitário no início do ensaio está presente em todos os controladores, o que não denota problema em um sistema específico mas em algo comum à todos.


## Funções de transferências e os respectivos Kp Ki Kd de cada um dos grupos

### Julio Amorim, Nando Ferreira, Pedro Augusto e Pedro Augusto
- PID 15°: Kd = 2.2657; Ki = 43.9760; Kp = 2.4856
  $$ T_{15}(s) = 47.8\,\frac{s^2 + 1.96s + 18.4}{s^2 + 20s} $$

- PID 37.5°: Kd = 2.5275; Ki = 35.9433; Kp = 3.4997
  $$ T_{37.5}(s) = 54.05\,\frac{s^2 + 1.96s + 13.3}{s^2 + 20s} $$

- PID 55°: Kd = 2.9952; Ki = 25.8296; Kp = 5.0766
  $$ T_{55}(s) = 64.98\,\frac{s^2 + 1.96s + 7.95}{s^2 + 20s} $$

- PID 70°: Kd = 9.2023; Ki = 20.5944; Kp = 18.8545
  $$ T_{70}(s) = 202.9\,\frac{s^2 + 1.96s + 2.03}{s^2 + 20s} $$

- PID 85°: Kd = 1.7946; Ki = 4.0164; Kp = 3.6770
  $$ T_{85}(s) = 39.57\,\frac{s^2 + 1.96s + 2.03}{s^2 + 20s} $$


### Guilherme Peres, Vinicius, Yan
- PID 15°: Kd = 3.0002; Ki = 70.19264; Kp = 3.33415
  $$ T_{15}(s) = 78.34\,\frac{s^2 + 1.96s + 22.4}{s^2 + 25s} $$


- PID 37.5°: Kd = 2.9368; Ki = 56.8192; Kp = 3.77971
  $$ T_{37.5}(s) = 77.2\,\frac{s^2 + 1.96s + 18.4}{s^2 + 25s} $$

- PID 55°: Kd = 3.00477; Ki = 42.38444; Kp = 4.55075
  $$ T_{55}(s) = 79.67\,\frac{s^2 + 1.96s + 13.3}{s^2 + 25s} $$

- PID 70°: Kd = 2.8635; Ki = 24.36516; Kp = 5.0324
  $$ T_{70}(s) = 76.62\,\frac{s^2 + 1.96s + 7.95}{s^2 + 25s} $$

- PID 85°: Kd = 2.9712; Ki = 6.4576; Kp = 6.0386
  $$ T_{85}(s) = 80.32\,\frac{s^2 + 1.96s + 2.01}{s^2 + 25s} $$


### Gustavo Ferraresi, Renan, Valério
- PID 15°: Kd = 2.7782; Ki = 64.9600; Kp = 2.4360
  $$ T_{15}(s) = \frac{58 s^2 + 113.7 s + 1299}{s^2 + 20s} $$

- PID 37.5°: Kd = 2.7018; Ki = 52.44; Kp = 2.9640
  $$ T_{37.5}(s) = \frac{57 s^2 + 111.7 s + 1049}{s^2 + 20s} $$

- PID 55°: Kd = 2.7079; Ki = 38.6483; Kp = 3.7418
  $$ T_{55}(s) = \frac{57.9 s^2 + 113.5 s + 773}{s^2 + 20s} $$

- PID 70°: Kd = 2.6733; Ki = 22.9970; Kp = 4.5341
  $$ T_{70}(s) = \frac{58 s^2 + 113.7 s + 459.9}{s^2 + 20s} $$

- PID 18°: Kd = 2.5851; Ki = 5.7570; Kp = 5.2982
  $$ T_{85}(s) = \frac{57 s^2 + 111.7 s + 115.1}{s^2 + 20s} $$



### Emanuel, Emily, Paulo Victor
- PID 15°: Kd = 3.3597; Ki = 64.8849; Kp = 1.0700
  $$ T_{15}(s) = \frac{68.26 s^2 + 86.29 s + 1298}{s^2 + 20s} $$

- PID 37.5°: Kd = 3.5688; Ki = 60.7695; Kp = 4.8163
  $$ T_{37.5}(s) = \frac{79.76 s^2 + 161.9 s + 1276}{s^2 + 21s} $$

- PID 55°: Kd = 3.2758; Ki = 40.6055; Kp = 4.7173
  $$ T_{55}(s) = \frac{73.51 s^2 + 139.7 s + 852.7}{s^2 + 21s} $$

- PID 70°: Kd = 3.1314; Ki = 24.4800; Kp = 5.3720
  $$ T_{70}(s) = \frac{68 s^2 + 131.9 s + 489.6}{s^2 + 20s} $$

- PID 18°: Kd = 2.164; Ki = 4.4524; Kp = 4.5498
  $$ T_{85}(s) = \frac{50 s^2 + 100 s + 93.5}{s^2 + 21s} $$