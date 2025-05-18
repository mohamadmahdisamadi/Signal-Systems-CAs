close all;
clc;
clearvars;

all_chars = 'abcdefghijklmnopqrstuvwxyz .,!;"';
mapset = create_mapset(all_chars);

message = 'signal';
fs = 100;
sigma = 0.01;

signal_containing_message_bit_rate_1 = coding_freq(message, mapset, 1);
noise1 = sigma*randn(1,length(signal_containing_message_bit_rate_1));
signal_containing_message_bit_rate_1 = signal_containing_message_bit_rate_1 + noise1;
t1 = 0:(1/fs):(length(signal_containing_message_bit_rate_1)/fs)-(1/fs);

signal_containing_message_bit_rate_5 = coding_freq(message, mapset, 5);
noise5 = sigma*randn(1,length(signal_containing_message_bit_rate_5));
signal_containing_message_bit_rate_5 = signal_containing_message_bit_rate_5 + noise5;
t5 = 0:(1/fs):(length(signal_containing_message_bit_rate_5)/fs)-(1/fs);

decoded_message_rate_bit_1 = decoding_freq(signal_containing_message_bit_rate_1, mapset, 1);
decoded_message_rate_bit_5 = decoding_freq(signal_containing_message_bit_rate_5, mapset, 5);
decoded_message_rate_bit_1
decoded_message_rate_bit_5

