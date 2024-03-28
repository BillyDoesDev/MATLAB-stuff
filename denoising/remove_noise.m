clc; clear all; close all;

[y, fs] = audioread('dirty.wav');
dt = 1 / fs;
t = 0 : dt : (length(y) - 1) / fs;
f = transpose(y);


% Compute the Fast Fourier Transform
n = length(t);
fhat = fft(f, n);
PSD = fhat .* conj(fhat) / n;       % Power spectrum (power per freq)
freq = 1 / (dt * n) * (0 : n);      % Create x-axis of frequencies in Hz
L = 1 : floor(n / 2);               % Only plot the first half of freqs


% filter out noise
indices = PSD > 100;        % Find all freqs with large power
PSDclean = PSD .* indices;  
fhat = indices .* fhat;     
ffilt = ifft(fhat);         % Inverse FFT for filtered time signal


% write the clean audio signal to file
audiowrite('clean.wav', ffilt, fs);


% PLOTS
section = 800;

subplot(3,1,1)
plt = plot(t(:, 1:section), f(:, 1:section), 'k', 'LineWidth',1.5);
legend('Noisy');
title('Input Audio File Data', 'fontsize', 20);
xlabel('time (seconds)', 'fontsize', 17);
ylabel('amplitude', 'fontsize', 17);
grid on;

subplot(3,1,2)
plt = plot(freq(L)(:, 1:end/15), PSD(L)(:, 1:end/15), 'r', 'LineWidth',1.5); hold on
plt = plot(freq(L)(:, 1:end/15), PSDclean(L)(:, 1:end/15), '-b', 'LineWidth', 1.2);
legend('Noisy', 'Filtered');
title('Fourier Transform on the Input Signal', 'fontsize', 20);
xlabel('frequency (Hertz)', 'fontsize', 17);
ylabel('power per frequency', 'fontsize', 17);
grid on;

subplot(3,1,3)
plt = plot(t(:, 1:section), f(:, 1:section), 'r', 'LineWidth',1); hold on
plt = plot(t(:, 1:section), ffilt(:, 1:section), 'b', 'LineWidth',2);
legend('Clean', 'Filtered');
title('Recovered Clean Audio', 'fontsize', 20);
xlabel('time (seconds)', 'fontsize', 17);
ylabel('amplitude', 'fontsize', 17);
grid on;


drawnow
waitfor(plt)
