close all;
clc;
clearvars;

fs = 100;
ts = 1/fs;

t = 0:ts:1-ts;
x = cos((30*pi*t)+(pi/4));

figure('Position', [500 500 1200 400]);
rows = 1; cols = 3; cnt = 1;
subplot(rows, cols, cnt);
plot(t, x);
ylim([-1.1 1.1]);
xlabel('Time (s)');
ylabel('x(t)');
title('x(t) = cos(30\pit + \pi/4)');
cnt = cnt + 1;

ft_notscaled = fftshift(fft(x));
ft = ft_notscaled / max(abs(ft_notscaled));

f = -(fs/2):(fs/100):(fs/2)-(fs/100);
subplot(rows, cols, cnt);
plot(f, abs(ft));
xlim([-20 20]);
ylim([0 1.1]);
xlabel('Frequency (Hz)');
ylabel('Fourier Transform of x(t)');
title('Absolute Value of FT');
cnt = cnt + 1;

to1 = 1e-6;
ft_notscaled(abs(ft_notscaled)<to1) = 0;
theta = angle(ft_notscaled);
subplot(rows, cols, cnt);
plot(f,theta/pi);
xlim([-20 20]);
ylim([-0.3 0.3]);
xlabel('Frequency (Hz)');
ylabel('Fourier Transform of x(t)');
title('Phase of FT');
cnt = cnt + 1;