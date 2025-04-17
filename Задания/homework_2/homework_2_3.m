clear all
close all

%% Решение с помощью dsolve
ySol1 = dsolve('3*D2y + 24*Dy + 96*y = 0', 'y(0) = 1', 'Dy(0)=2');

disp('Решение dsolve:');
disp(ySol1);

%% Операторный метод с residue (численный)
% Коэффициенты уравнения: 3y'' + 24y' + 96y = 0
% Характеристическое уравнение: 3s^2 + 24s + 96 = 0

% Преобразование Лапласа:
% 3(s^2Y(s) - sy0 - yp0) + 24(sY(s) - y0) + 96Y(s) = 0
% => Y(s) = (3s + 24)/(3s^2 + 24s + 96)

num = [3 24];    % Числитель (3s + 24)
den = [3 24 96]; % Знаменатель (3s^2 + 24s + 96)

% Разложение на простые дроби
[r, p, k] = residue(num, den);

% Обратное преобразование Лапласа
t = linspace(0, 10, 1000);
y_residue = zeros(size(t));

for i = 1:length(r)
    y_residue = y_residue + r(i)*exp(p(i)*t);
end

figure();
plot(t, y_residue, 'b',LineWidth=2);
hold on;

%Рисуем аналитическое решение, полученное "вручную"
t = linspace(0, 10, 100);
yAnSol = exp(-4*t).*(cos(4*t) + sin(4*t));

plot(t, yAnSol, 'r', LineWidth=2)

grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 3y" + 24y'' + 96y = 0');
legend('matlab', 'вручную');
hold off;

