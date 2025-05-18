ts = 1e-9; % time step
t = ts:ts:1e-5; % time axis
fs = 1e9; % frequency
T = 1e-5; % period
tau = 1e-6; % pulse width or duration of a single radar pulse
alpha = 0.5; % value of the pulse signal

signal = create_output_signal();
figure;
plot(t, signal, 'c', 'LineWidth', 5);
title('Output Signal of the System');
xlabel('Time');
ylabel('Magnitude');
grid off;