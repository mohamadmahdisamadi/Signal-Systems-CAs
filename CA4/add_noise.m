function noisy_signal = add_noise(signal, std)
    coded_size = size(signal);
    fs = 100;
    
    encoded_message_size = size(signal);

    noise = std * randn(encoded_message_size(1), encoded_message_size(2));

    noisy_signal = signal + noise;
    time = zeros(coded_size(1), fs);

    for i = 1:coded_size(1)
        time(i, :) = linspace(i - 1, i, fs);
    end

    figure('Position', [100, 100, 1500, 700]);
    subplot(1, 2, 1);
    for k = 1:coded_size(1)
        plot(time(k, :), signal(k, :), 'b');
        hold on;
    end
    title("Encoded signal without noise");

    subplot(1, 2, 2);
    for k = 1:coded_size(1)
        plot(time(k, :), noisy_signal(k, :), 'r');
        hold on;
    end
    title("Encoded signal with noise");
end
