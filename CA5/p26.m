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

length(signal_containing_message_bit_rate_1)
length(signal_containing_message_bit_rate_5)

num_repeats = 100;
first_mistake_1 = zeros(1, num_repeats);
first_mistake_5 = zeros(1, num_repeats);
for j=1:num_repeats
    check_1 = 1; check_5 = 1;
    for s=0.05:0.05:3
        if (check_1)
            noise1 = s*randn(1,length(signal_containing_message_bit_rate_1));
            noisy_signal_bit_rate_1 = signal_containing_message_bit_rate_1 + noise1;
            decoded_message_rate_bit_1 = decoding_freq(noisy_signal_bit_rate_1, mapset, 1);
            if (strcmp(decoded_message_rate_bit_1, message) == 0)
                first_mistake_1(j) = s;
                check_1 = 0;
            end
        end
    
        if (check_5)
            noise5 = s*randn(1,length(signal_containing_message_bit_rate_5));
            noisy_signal_bit_rate_5 = signal_containing_message_bit_rate_5 + noise5;
            decoded_message_rate_bit_5 = decoding_freq(noisy_signal_bit_rate_5, mapset, 5);
            if (strcmp(decoded_message_rate_bit_5, message) == 0)
                first_mistake_5(j) = s;
                check_5 = 0;
            end
        end
    end
end

figure('Position', [400 400 1200 400]);

rows = 1; cols = 2; cnt = 1;
subplot(rows, cols, cnt);
histogram(first_mistake_1);
title('distribution of first mistakes using bit rate 1');
cnt = cnt + 1;
subplot(rows, cols, cnt);
histogram(first_mistake_5);
title('distribution of first mistakes using bit rate 5');
cnt = cnt + 1;
mean(first_mistake_1)
mean(first_mistake_5)