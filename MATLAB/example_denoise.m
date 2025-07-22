% AA REU Workshop Tutorial Code
% De-noising

clear; clc; close all;

%% Setup the data:

dt = 0.001; t = 0:dt:1-dt; f1 = 50; f2 = 120;

u_orig = sin(2*pi*f1*t) + sin(2*pi*f2*t); u_noise = 2.5*randn(size(t)); % gaussian noise
u = u_orig + u_noise;

figure;
plot(t, u_orig, "k-"); hold on; plot(t, u, "r-"); xlim([0, 0.25]);
xlabel("$t$ [sec]"); ylabel("Signal $u$ [Pa]");

%% Check the PSD:

N = length(t);
u_hat = fft(u, N);
power = u_hat.*conj(u_hat)/N; % could also do abs()

df = 1/(N*dt); % frequency resolution
freq = (-N/2:N/2-1)*df; % frequency axis

figure;
plot(freq, fftshift(power)/df); % fftshift is important! divide by df for density.
xlabel("$f$ [Hz]"); ylabel("PSD [Pa$^2$/Hz]");

%% Filter:
filter_idx = power/df > 100;

power_filtered = power .* filter_idx;
u_hat_filtered = u_hat .* filter_idx;

u_filtered = ifft(u_hat_filtered);

figure;
plot(t, u_orig, "k--"); hold on; plot(t, u_filtered, "b-"); xlim([0, 0.25]);
xlabel("$t$ [sec]"); ylabel("Signal $u$ [Pa]");





