clear all;
close all;

%Однородное уравнение
ySol1 = dsolve('3*D2y + 24*Dy + 35*y = 0', 'y(0) = 1', 'Dy(0)=2');

disp('Решение дифференциального уравнения:');
disp(ySol1); 

yFunc1 = matlabFunction(ySol1);

t1 = linspace(0, 10, 100); 

yValues1 = yFunc1(t1);

figure();
plot(t1, yValues1, 'b', 'LineWidth', 2);
grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 3y"" + 24y'' + 35y = 0');

%Неоднородное уравнение
ySol2 = dsolve('2*D2y + 24*Dy + 72*y = exp(-2*t)', 'y(0) = 2', 'Dy(0)=3');

disp('Решение дифференциального уравнения:');
disp(ySol2); 

yFunc2 = matlabFunction(ySol2);

t2 = linspace(0, 10, 100); 

yValues2 = yFunc2(t2);

figure();
plot(t2, yValues2, 'b', 'LineWidth', 2);
grid on;
xlabel('Время t');
ylabel('Решение y(t)');
title('Решение дифференциального уравнения 3y"" + 24y'' + 35y = 0');

