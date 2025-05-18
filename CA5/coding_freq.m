function signal_containing_message = coding_freq(message, mapset, bit_rate)
    fs = 100;
    signal_containing_message = [];

    numof_chars = length(mapset);
    numof_each_char_bit = ceil(log2(numof_chars));
    message_len = strlength(message);
    binary_message_len = message_len * numof_each_char_bit;
    binary_message = blanks(binary_message_len);
    min_freq = 5; max_freq = 44;

    for i=1:message_len
        ch = message(i);
        for j=1:numof_chars
            if ch == mapset{1,j}
                coded_bits = mapset{2, j};
                for k=1:numof_each_char_bit
                    binary_message(numof_each_char_bit*(i-1)+k) = coded_bits(k);
                end
            end
        end
    end

    for i=1:bit_rate:binary_message_len
        bit_rate_consecutive_bits = binary_message(i : i + bit_rate - 1);
        dec = bin2dec(bit_rate_consecutive_bits);
        freq = (dec * (round((max_freq - min_freq) / ((2^bit_rate) - 1)))) + min_freq;
        t = (i/bit_rate) : (1/fs) : (i/bit_rate) + 1 - (1/fs);
        new_signal = sin(2 * pi * freq * (t-(i/bit_rate)));
        signal_containing_message = [signal_containing_message new_signal];
    end
end