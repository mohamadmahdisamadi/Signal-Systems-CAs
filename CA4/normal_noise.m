clc;
clearvars;
close all;

figure;

for i=1:4
    subplot(2, 2, i);
    noise = randn(1, 10^(i+3));
    mu= mean(noise);
    std = sqrt(var(noise));
    num_samples = num2str(10^(i+3));
    disp(['Mean of Gaussian noise with ', num_samples, ' samples: ', num2str(mu)]);
    disp(['Standard deviation of Gaussian noise with ', num_samples, ' samples: ', num2str(std)]);
    
    histogram(noise);
    title(['Norm Noise with ', num_samples, ' samples']);
end
