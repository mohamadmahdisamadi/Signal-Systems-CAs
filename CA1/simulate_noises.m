function [noise_powers, losses]=simulate_noises()
    ts = 1e-9; % time step
    T = 1e-5; % period
    tau = 1e-6; % pulse width or duration of a single radar pulse
    num_samples = int32(T / ts);   
    num_pulses = (tau / T) * num_samples;
    R = 450;
    
    signal = create_output_signal();
    len_s = length(signal);
    pulse = ones(1, num_pulses);
    
    num_repeats = 1000;
    noise_powers = 0.1:0.1:10;
    len_n = length(noise_powers);
    losses = zeros(1, len_n);
    
    for i=1:len_n
        loss = zeros(1, num_repeats);
        for j=1:num_repeats
            noise = noise_powers(i) * randn(1, len_s);
            noisy_signal = signal + noise;
            [distance, ~] = find_distance(noisy_signal, pulse);
            loss(j) = abs(R - distance);
        end
        losses(i) = mean(loss);
    end
    fprintf('%s', 'Finished Simulating!');
end
