close all;
clc;
clearvars;

T = 1;
fs = 20;
N = fs*T;
ts = 1/fs;

t = 0:ts:T-ts;
x1 = exp(1j*2*pi*5*t) + exp(1j*2*pi*8*t);
x2 = exp(1j*2*pi*5*t) + exp(1j*2*pi*5.1*t);

f = -(fs/2):(fs/N):(fs/2)-(fs/N);
fx1 = fftshift(fft(x1));
fx1 = fx1/max(abs(fx1));

fx2 = fftshift(fft(x2));
fx2 = fx2/max(abs(fx2));

figure
cnt = 1;
rows = 2; cols = 3;

subplot(rows, cols, cnt);
plot(t,x1);
xlabel('Time (s)');
ylabel('x1(t)');
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(f,abs(fx1));
xlabel('Frequency (Hz)');
ylabel('Abs F{x1(t)}');
xlim([-10 9]);
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(f, angle(fx1));
xlabel('Frequency (Hz)');
ylabel('Phase F{x1(t)}');
xlim([-10 9]);
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(t,x2);
xlabel('Time (s)');
ylabel('x2(t)');
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(f,abs(fx2));
xlabel('Frequency (Hz)');
ylabel('Abs F{x2(t)}');
xlim([-10 9])
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(f, angle(fx2));
xlabel('Frequency (Hz)');
ylabel('Phase F{x2(t)}');
xlim([-10 9])