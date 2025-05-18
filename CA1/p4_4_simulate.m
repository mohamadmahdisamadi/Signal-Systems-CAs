voice_file_path = './voice.wav';
[x, fs] = audioread(voice_file_path);
speed = 0.7;

y = p4_4(x, speed);
sound(y, fs);