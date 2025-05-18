clc;
clearvars;
close all;

chars ='abcdefghijklmnopqrstuvwxyz .,;!"';
mapset = create_mapset(chars);
message = 'spread your wings and fly away... fly away... far away';
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

decoded_message = decoding_amp(coded_signal, rate, mapset);
disp(decoded_message)