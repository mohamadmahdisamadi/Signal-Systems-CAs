voice_file_path = './myVoice.wav';
[x, fs] = audioread(voice_file_path);
fprintf('There are %d Samples in the Discrete Signal\n', length(x));
fprintf('The Frequency of the Signal is %d\n', fs);
fprintf('Duration of the Voice File is %f Seconds\n', length(x) / fs);
sound(x, fs);
