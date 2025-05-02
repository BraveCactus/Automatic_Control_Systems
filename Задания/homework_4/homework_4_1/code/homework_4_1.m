clear all;
close all;

%Параметры
Tm = 0.0146;
Cm = 0.265;
Ce = 0.265;
L = 0.0042;
R = 0.933;
Te = L/R;
beta = Cm*Ce/R;
U = 270;
M = 2.0461;

% передаточная функция 1
W1 = tf(1/Ce, [Te*Tm Tm 1]);
figure(1);
step(W1);
grid on;
title("Переходная функция W1");

%Передаточная функция 2
W2 = tf(-1/beta, [Te*Tm Tm 1]);
figure(2);
step(W2);
grid on;
title("Переходная функция W2")

%Суперпозиция передаточных функций
W = W1 + W2;
figure(3);
step(W);
grid on;
title("Переходная функция W");