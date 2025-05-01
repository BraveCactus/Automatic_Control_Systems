clear all;
close all;

%Однородное уравнение
ySol1 = dsolve('3*D2y + 24*Dy + 35*y = 0', 'y(0) = 1', 'Dy(0)=2');

disp('Решение дифференциального уравнения:');
disp(ySol1); 

%Переводим решение в символьный вид
yFunc1 = matlabFunction(ySol1);

t1 = linspace(0, 10, 100); 

%Создаем массив значений функции решения
yValues1 = yFunc1(t1);

figure();
plot(t1, yValues1, 'b', 'LineWidth', 2);
hold on;

%Рисуем аналитическое решение, полученное "вручную"
t = linspace(0, 10, 100);
yAnSolv = -exp(-6*t) + 2*exp(-2*t);

plot(t, yAnSolv, 'r', 'LineWidth', 2);

grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 3y"" + 24y'' + 35y = 0');
legend('dsolve', 'вручную');
hold off;

%Неоднородное уравнение
ySol2 = dsolve('2*D2y + 24*Dy + 72*y = exp(-2*t)', 'y(0) = 2', 'Dy(0)=3');

disp('Решение дифференциального уравнения:');
disp(ySol2); 

%Переводим решение в символьный вид
yFunc2 = matlabFunction(ySol2);

t2 = linspace(0, 10, 100); 

%Создаем массив значений функции решения
yValues2 = yFunc2(t2);

figure();
plot(t2, yValues2, 'b', 'LineWidth', 2);
hold on;

%Рисуем аналитическое решение, полученное "вручную"
t = linspace(0, 10, 100);
yAnSolv = ((63/32) - (237/80).*t) .* exp(-6*t) + (1/32)*exp(-2*t);

plot(t, yAnSolv, 'r', 'LineWidth', 2);

grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 2y"" + 24y'' + 72y = e^{-2t}');
legend('dsolve', 'вручную');
hold off;
