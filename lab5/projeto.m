clc, clear, close all

alpha = 20.70;
beta =  1.27;
gamma = 0.53;

Gmotor = tf(1, [1/5 1]);
G1 = tf(gamma, [1 beta alpha*cosd(15)])    * Gmotor;
G2 = tf(gamma, [1 beta alpha*cosd(37.5)])  * Gmotor;
G3 = tf(gamma, [1 beta alpha*cosd(55)])    * Gmotor;
G4 = tf(gamma, [1 beta alpha*cosd(70)])    * Gmotor;

Kf1 = 1 / dcgain(G1);
Kf2 = 1 / dcgain(G2);
Kf3 = 1 / dcgain(G3);
Kf4 = 1 / dcgain(G4);

C1 = tf(175 * conv([1 0.3], [1 2.0]), conv([1 12], [1 12]));
C2 = tf(170 * conv([1 0.3], [1 2.3]), conv([1 12], [1 12]));
C3 = tf(165 * conv([1 0.3], [1 2.8]), conv([1 12], [1 12]));
C4 = tf(165 * conv([1 1.0], [1 3.4]), conv([1 12], [1 12]));
