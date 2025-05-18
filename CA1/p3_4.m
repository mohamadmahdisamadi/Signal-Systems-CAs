%[noise_powers, losses] = simulate_noises();

figure;
plot(noise_powers, 10 * ones(1, length(losses)), 'm', 'LineWidth', 3);
hold on;
plot(noise_powers, losses, 'c', 'LineWidth', 2);
title('Loss over Different Noise Powers')
xlabel('Noise Power');
ylabel('Loss')
grid off;