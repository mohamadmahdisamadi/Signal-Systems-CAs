function [valid, coded_message] = coding_amp(message, rate, mapset, ignore_not_founds)
    valid = 1;
    coded_message = [];
    message_len = length(message);
    fs = 100;
    
    found_all_chars = 1;
    for i=1:message_len
        found_char = 0;
        for j=1:length(mapset)
            if strcmp(message(i), mapset(1, j)) == 1
                found_char = 1;
                coded_message = cat(2, coded_message, mapset(2, j));
            end
        end
        if ~found_char
            fprintf("did not find %c in the mapset\n", message(i));
            if ignore_not_founds
                coded_message = cat(2, coded_message, '11110');
            end
            found_all_chars = 0;
        end
    end
    if ~found_all_chars
        if ~ignore_not_founds
            valid = 0;
            return;
        end
    end

    coded_message = cell2mat(coded_message);
    coded_message_len = length(coded_message);

    for l = 1 : rate : coded_message_len
        % l and r are start and end indices of current segment
        % min is to prevent exceeding size of the message
        r = min(l + rate - 1, coded_message_len);
        segmented_message{floor((l-1)/rate) + 1} = coded_message(l:r);
    end

    coded_message = segmented_message ;
    binary_codes = cell(1, 2^rate);
    decimal_numbers = 0:2^rate - 1;
    binary_numbers = dec2bin(decimal_numbers, rate);

    for i = 1:length(decimal_numbers)
        binary_codes{i} = binary_numbers(i, :);
    end

    coefficients = linspace(0, 1, 2^rate);
    numof_bits = ceil((message_len*ceil(log2(length(mapset))))/rate);
    t=zeros(numof_bits, fs);

    for i=1:numof_bits
        t(i,:)=linspace(i-1, i, fs);
    end

    encoded_message_coef = [];
    found_all_bits = 1;
    for i=1:numof_bits
        found_bit = 0;
        for j=1:2^rate
            if strcmp(coded_message(1,i), binary_codes(1,j)) == 1
                found_bit = 1;
                encoded_message_coef = horzcat(encoded_message_coef, coefficients(1, j));
            end
        end
        if ~found_bit
            fprintf("did not find %s in bits\n", char(coded_message(1, i)));
            found_all_bits = 0;
        end
    end
    if ~found_all_bits
        return;
    end

    coded_message=zeros(numof_bits, fs);
    for i=1:numof_bits
            coded_message(i,:)=encoded_message_coef(1,i).*sin(2*pi*t(i,:)); 
    end

    for startindex=1:numof_bits
        plot(t(startindex,:),coded_message(startindex,:),'c');
        hold on;
    end
    title(["Sample Rate " , int2str(rate)]);
end

