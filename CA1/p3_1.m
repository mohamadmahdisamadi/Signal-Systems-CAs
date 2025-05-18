ts = 1e-9; % time step
t = ts:ts:1e-5; % time axis
fs = 1e9; % frequency
T = 1e-5; % period
tau = 1e-6; % pulse width or duration of a single radar pulse
alpha = 1; % value of the pulse signal
signal = create_input_signal();
figure;
plot(t, signal, 'c', 'LineWidth', 3);
title('Input Signal of the System');
xlabel('Time');
ylabel('magnitude');
grid off;