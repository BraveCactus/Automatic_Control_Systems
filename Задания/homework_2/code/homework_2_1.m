function [] = new()
    interval_number = input('Введите количество интервалов: ');

    begin_arr = zeros(1, interval_number);
    end_arr = zeros(1, interval_number);
    degree_arr = zeros(1, interval_number);
    coef_arr = cell(1, interval_number);

    for i = 1:interval_number
        disp(['Введите данные для интервала ', num2str(i)]);

        begin_arr(i) = input(['Начало временного интервала ', num2str(i), ': ']);
        end_arr(i) = input(['Конец временного интервала ', num2str(i), ': ']);
        degree_arr(i) = input(['Степень полинома для интервала ', num2str(i), ': ']);

        coef_arr{i} = zeros(1, degree_arr(i) + 1);
        for j = 1:degree_arr(i) + 1
            coef_arr{i}(j) = input(['Коэффициент g', num2str(j-1), ' для интервала ', num2str(i), ': ']);
        end
    end

    t = linspace(min(begin_arr), max(end_arr), 1000);
    g_values = zeros(size(t));

    for k = 1:interval_number
        mask = (t >= begin_arr(k)) & (t <= end_arr(k));
        g_values(mask) = compute_poly(t(mask), begin_arr(k), degree_arr(k), coef_arr{k});
    end

    plot(t, g_values);
    xlabel('Время t');
    ylabel('Значение g(t)');
    title('График функции g(t)');
    grid on;
end

function result = compute_poly(t, begin_point, degree, coefficients)
    result = coefficients(1);
    for i = 2:degree+1
        result = result + coefficients(i) * power((t - begin_point), (i-1));
    end
end