close all;
clc;
clearvars;

all_chars = 'abcdefghijklmnopqrstuvwxyz .,!;"';
mapset = create_mapset(all_chars);

message = 'signal';
fs = 100;

signal_containing_message_bit_rate_1 = coding_freq(message, mapset, 1);
t1 = 0:(1/fs):(length(signal_containing_message_bit_rate_1)/fs)-(1/fs);
signal_containing_message_bit_rate_5 = coding_freq(message, mapset, 5);
t5 = 0:(1/fs):(length(signal_containing_message_bit_rate_5)/fs)-(1/fs);

figure('Position', [400 400 1200 400]);
rows = 1; cols = 2; cnt = 1;

subplot(rows, cols, cnt);
plot(t1, signal_containing_message_bit_rate_1);
title('signal containing message "signal" with rate bit 1');
cnt = cnt + 1;

subplot(rows, cols, cnt);
plot(t5, signal_containing_message_bit_rate_5);
title('signal containing message "signal" with rate bit 5');
cnt = cnt + 1;