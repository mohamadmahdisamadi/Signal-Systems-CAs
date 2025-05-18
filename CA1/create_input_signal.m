function signal=create_input_signal()
    ts = 1e-9; % time step
    t = ts:ts:1e-5; % time axis
    fs = 1e9; % frequency
    T = 1e-5; % period
    tau = 1e-6; % pulse width or duration of a single radar pulse
    alpha = 1; % value of the pulse signal

    num_samples = int32(T / ts);
    num_pulses = (tau / T) * num_samples;
    
    pulse = alpha * ones(1, num_pulses);
    rest_of_signal = zeros(1, num_samples - num_pulses);
    signal = cat(2, pulse, rest_of_signal);