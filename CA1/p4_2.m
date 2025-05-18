voice_file_path = './myVoice.wav';
[x, fs] = audioread(voice_file_path);
ts = 1 / fs;
num_samples = length(x);
duration = length(x) / fs;
t = ts:ts:duration;

audiowrite('x.wav', x, fs);

figure;
plot(t, x, 'Color', [0.5, 0, 1]);
title('Voice Signal');
xlabel('Time');
ylabel('Magnitude');
