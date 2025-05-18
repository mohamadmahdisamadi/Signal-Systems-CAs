close all;
clc;
clearvars;

fs = 50;
ts = 1/fs;
t = -1:ts:1-ts;
x = cos(10*pi*t);

figure('Position', [500 500 1000 400]);
rows = 1; cols = 3; cnt = 1;
subplot(rows, cols, cnt);
plot(t,x);
xlim([-1, 1]);
xlabel('Time (s)');
ylabel('x(t)');
title('x(t) = cos(10\pit)');
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(t,x);
xlim([-0.2, 0.2]);
xlabel('Time (s)');
ylabel('x(t)');
title('x(t) = cos(10\pit) in a tighter time interval');
cnt = cnt + 1;

ft = fftshift(fft(x));
ft = ft / max(abs(ft));
f = -(fs/2):(fs/100):(fs/2)-(fs/100);

subplot(rows, cols, cnt);
plot(f, abs(ft));
xlim([-7, 7]);
ylim([0, 1.2]);
xlabel('Frequency (Hz)');
ylabel('F{x(t)}');
title('Fourier Transform of cos(10\pit)');