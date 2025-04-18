clear all
close all

%% Однородное уравнение
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
t = linspace(0, 5, 100);
y_residue = zeros(size(t));

for i = 1:length(r)
    y_residue = y_residue + r(i)*exp(p(i)*t);
end

figure();
plot(t, y_residue, 'b',LineWidth=2);
hold on;

%Рисуем аналитическое решение, полученное "вручную"
t = linspace(0, 5, 100);
yAnSol = exp(-4*t).*(cos(4*t) + sin(4*t));

plot(t, yAnSol, 'r--', LineWidth=2)

grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 3y" + 24y'' + 96y = 0');
legend('matlab', 'вручную');
hold off;


%% Неоднородное уравнение
%% Преобразование Лапласа с использованием ilaplace
syms y(t)
syms p F
% Уравнение в пространстве Лапласа
eqn_laplace = p^3*F - p^2*3 - p*5 - (-66) + 7*(p^2*F - p*3 - 5) + 12*(p*F - 3) == 5/(p+3);

% Решаем относительно F
F_sol = solve(eqn_laplace, F);

% Обратное преобразование Лапласа
y_sol_ilaplace = ilaplace(F_sol);

t_vals = linspace(0, 5, 100);
% Преобразуем символьное решение в числовой массив
y_laplace = double(subs(y_sol_ilaplace, t, t_vals));

% Строим графики
figure();
%Рисует график решения, полученного с моиощью matlab 
plot(t_vals, y_laplace, 'b', 'LineWidth', 2);
hold on;

%Рисуем аналитическое решение, полученное "вручную"
t = linspace(0, 5, 100);
yAnSol = (5/9) + ((148/9) + (5/3)*t).*exp(-3*t) - 14*exp(-4*t);

plot(t, yAnSol, 'r--', LineWidth=2)

xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения');
legend('matlab', 'вручную');
hold off;

