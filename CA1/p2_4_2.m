x = 0:0.001:1;
a = 2;
b = 7;
y = a * x + b;
len = length(x);

noisy_y = zeros(1, len);
noise = 0.2 * randn(1, len);

for i=1:len
    noisy_y(i) = y(i) + noise(i);
end

figure;
subplot(1, 2, 1);
plot(x, y, '.m');
title('Clean Signal')
xlabel('x')
ylabel('y')

subplot(1, 2, 2);
plot(x, noisy_y, '.m');
title('Noisy Signal')
xlabel('x')
ylabel('y')

[a1, b1] = linear_regressor(x, y);
[a2, b2] = linear_regressor(x, noisy_y);
