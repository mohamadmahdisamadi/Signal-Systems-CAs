clc;
clearvars;
close all;

chars ='abcdefghijklmnopqrstuvwxyz .,;!"';
mapset = create_mapset(chars);
message = 'signal';
rate = 3;

if rem(length(message) * ceil(log2(length(chars))), rate) ~= 0
    fprintf("size of binary coded message is not divisble by the rate\n");
    return;
end

ignore_not_founds = 1;
[valid, coded_signal] = coding_amp(message, rate, mapset, ignore_not_founds);
if ~valid
    fprintf("invalid input\n");
    return;
end
std = 0.0028;
for i=1:3
    noisy_signal = add_noise(coded_signal, std);
    decoded_message = decoding_amp(noisy_signal, rate, mapset);
    disp(['added normal noise (rate=', num2str(rate), ') (std=',num2str(std), '):', decoded_message])
    std = std*10;
end


