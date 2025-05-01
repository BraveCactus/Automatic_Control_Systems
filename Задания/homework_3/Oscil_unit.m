clear all;
close all;

K = 18;
d = 0.1;
T = 10;
koleb = tf(K,[T 2*d*T 1]);
[m,wout]=freqs(K,[T 2*d*T 1]);
wout1 = wout(round(length(wout))/2:end);

figure
step(koleb);
title("Передаточная х-ка колебательного звена")
grid on

figure
impulse(koleb);
title("Импульсная х-ка колебательного звена")
grid on

figure
semilogx(wout,mag2db(abs(m)))
title("АЧХ колебательного звена")
hold on
plot([min(wout) max(wout)],[20*log10(K) 20*log10(K)],'r--'); 
hold on
semilogx(wout,20*log10(K)-20*log10(2*d*T*wout),"--r");
semilogx(wout,20*log10(K)-20*log10(T.^2*wout.^2) ,"--r");
ylabel("Амплитуда,Дб")
xlabel("Частота, рад/с")
grid on
figure
semilogx(wout,rad2deg(angle(m)))
title("ФЧХ колебательного звена")
ylabel("Фаза, град")
xlabel("Частота, рад/с")
grid on
Koeff_tr = evalfr(koleb, 0);
figure
nyquist(koleb)
title("Годограф колебательного звена")
grid on