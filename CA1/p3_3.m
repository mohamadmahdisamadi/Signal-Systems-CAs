ts = 1e-9; % time step
t = ts:ts:1e-5; % time axis
fs = 1e9; % frequency
T = 1e-5; % period
tau = 1e-6; % pulse width or duration of a single radar pulse

num_samples = int32(T / ts);
num_pulses = (tau / T) * num_samples;

signal = create_output_signal();
pulse = ones(1, num_pulses);
[distance, correlation] = find_distance(signal, pulse);
display(distance);

figure;
plot(t(1:length(correlation)), correlation, 'c', 'LineWidth', 5);
title('Correlation');
xlabel('Time');
ylabel('Magnitude');
grid off;