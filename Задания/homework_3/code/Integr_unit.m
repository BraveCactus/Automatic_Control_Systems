clear all;
close all;

integr = tf(1,[0.5 0]);
fig1 = figure();
step(integr);
title("Передаточная характеристика интегрирующего звена")
grid on
fig2 = figure();
impulse(integr);
title("Импульсная характеристика интегрирующего звена")
grid on
fig3 = figure();
bode(integr)
title("Логарифмическая частотная характеристика")
grid on
fig4 = figure;
nyquist(integr)
title("Годограф интегрирующего звена")
grid on