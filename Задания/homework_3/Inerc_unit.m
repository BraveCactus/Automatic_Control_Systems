clear all;
close all;

K = 2;
T = 10;
inert = tf(K,[T 1]);
fig1 = figure();
step(inert);
title("Передаточная характеристика инерционного звена")
grid on
fig2 = figure();
impulse(inert);
title("Импульсная характеристика инерционного звена")
grid on
[m,wout]=freqs(K,[T 1]);
wout1 = wout(round(length(wout))/2:end);
figure
semilogx(wout,mag2db(abs(m)))
title("АЧХ инерционного звена")
hold on
plot([min(wout) max(wout)],[20*log10(K) 20*log10(K)],'r--'); 
hold on
semilogx(wout1,20*log10(K)-20*log10(T*wout1),"--r");
ylabel("Амплитуда,Дб")
xlabel("Частота, рад/с")
grid on
figure
semilogx(wout,rad2deg(angle(m)))
title("ФЧХ инерционного звена")
ylabel("Фаза, град")
xlabel("Частота, рад/с")
grid on
fig3 = figure;
nyquist(inert)
title("Годограф инерционного звена")
grid on