t = 0:0.01:1;
z1 = sin(2 * pi * t);
z2 = cos(2 * pi * t);

figure;
subplot(1, 2, 1);
plot(t, z1, '--b');
title('Sin Plot')
xlabel('time');
ylabel('amplitude');
grid on;

subplot(1, 2, 2);
plot(t, z2, 'r');
title('Cos Plot');
xlabel('time');
ylabel('amplitude');
grid on;
