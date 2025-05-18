function y=p4_3(x, speed)
    num_samples = length(x);
    y = zeros(1, num_samples);

    if speed == 2
        num_output_samples = floor((num_samples + 1) / 2);
        y = zeros(1, num_output_samples);
        for i=1:num_output_samples
            y(i) = x(2 * i);
        end
    
    elseif speed == 0.5
        num_output_samples = num_samples * 2 - 1;
        y = zeros(1, num_output_samples);
        for i=1:num_samples-1
            y(2*i - 1) = x(i);
            y(2*i) = (x(i) + x(i + 1)) / 2;
        end
        y(2*num_samples - 1) = x(num_samples);
    else
        fprintf('Please Set Speed as 2 or 0.5\n');
        return;
    end
end