function signal=create_output_signal()
    ts = 1e-9; % time step
    t = ts:ts:1e-5; % time axis
    fs = 1e9; % frequency
    T = 1e-5; % period
    tau = 1e-6; % pulse width or duration of a single radar pulse
    alpha = 0.5; % value of the pulse signal
    
    R = 450;
    C = 3e8;
    td = 2 * R / C;
    
    num_samples = int32(T / ts);
    
    num_zeros_1 = int32(td / ts);
    
    num_pulses = (tau / T) * num_samples;
    
    pulse = alpha * ones(1, num_pulses);
    
    num_zeros_2 = num_samples - num_zeros_1 - num_pulses;
    
    signal = cat(2, zeros(1, num_zeros_1), pulse, zeros(1, num_zeros_2));