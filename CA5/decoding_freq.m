function decoded_message = decoding_freq(coded_signal, mapset, bit_rate)
    fs = 100; N = 100;
    min_freq = 5; max_freq = 44;
    diff_freq = max_freq - min_freq;
    num_freqs = 2^bit_rate;
    numof_expected_bits = ceil(length(coded_signal) / fs) * bit_rate;
    binary_message = blanks(numof_expected_bits);
    numof_each_char_bit = ceil(log2(length(mapset)));
    decoded_message = blanks(ceil(numof_expected_bits / numof_each_char_bit));
    midlle_freqs = blanks(num_freqs-1);
    freq_dis = round(diff_freq / (num_freqs - 1));
    for k=1:num_freqs-1
        midlle_freqs(k) = min_freq + (k-1)*freq_dis + floor(freq_dis / 2); 
    end
   
    freq = (-fs / 2) : (fs / N) : (fs / 2) - (fs / N);
    for i = 0 : (length(coded_signal) / fs) - 1
        signal_part = coded_signal((i * fs) + 1:((i + 1) * fs));
        ft = abs( fftshift ( fft (signal_part) ) );
        [~, max_idx] = max(ft);
        selected_freq = abs( freq (max_idx) );
        for t=1:length(midlle_freqs)
            if selected_freq <= midlle_freqs(t)
                selected_freq = midlle_freqs(t) - (floor((freq_dis) / 2));
                break;
            elseif t == length(midlle_freqs)
                selected_freq = max_freq;
            end
        end
        b = dec2bin( ( (selected_freq - min_freq) / freq_dis), bit_rate);
        for j=1:length(b)
            binary_message(bit_rate*i + j) = b(j);
        end
    end

    for i = 1 : numof_expected_bits / numof_each_char_bit
        l = (i-1) *numof_each_char_bit + 1;
        r = i *numof_each_char_bit;
        message_to_check = binary_message(l:r);
        message_to_check = mapset{1,bin2dec(message_to_check)+1};
        decoded_message(i) = message_to_check;
    end 
end
