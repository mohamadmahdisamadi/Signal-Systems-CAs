function decoded_message=decoding_amp(coded_message, rate, mapset)
    corr = [];
    len = size(coded_message);
    fs = 100;
    t=zeros(len(1),100);
    coded_binary_length = ceil(log2(length(mapset)));
    for i=1:len(1)
        t(i,:)=linspace(i-1, i, fs);
    end 
    for l=1:len(1)
        corr_with_sin = 0.01*sum((2*sin(2*pi*t(l,:))).*(coded_message(l,:)));
        corr = horzcat(corr, corr_with_sin);
        corr = double(corr);
    end
    coefficients= linspace(0, 1, 2^rate);
    binary_codes = cell(1, 2^rate);
    for i=1:2^rate
        binary_codes{i} = dec2bin(i-1, rate);
    end

    decoded_bits = [];  
    half_coeffs_diff = (coefficients(1, 2) - coefficients(1, 1)) / 2;
    for i=1:len(1)
        for idx=1:2^rate
            if (abs(corr(1, i) - coefficients(1, idx))) <= half_coeffs_diff
                decoded_bits = [decoded_bits binary_codes(1, idx)];
            end
        end
    end

    cat_bits = '';
    for i=1:length(decoded_bits)
        cur_rate_bits = cell2mat(decoded_bits(i));
        for j=1:rate
            cat_bits(end+1) = cur_rate_bits(j);
        end
    end

    cat_len = length(cat_bits);
    decoded_message = '';
    for i=1:coded_binary_length:cat_len
        binary_coded_char = cat_bits(i:i+coded_binary_length-1);
        for j=1:length(mapset)
            if binary_coded_char == cell2mat(mapset(2,j))
                decoded_message(end+1) = mapset{1, j};
            end
        end
    end
end