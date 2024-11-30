% Simulation of Amplitude Modulation (AM)

% Simulation Parameters
fc = 2.5e3;       % Carrier frequency (2.5 kHz)
m_index = 0.875;  % Modulation index
t0 = 0.025;       % Time parameter

% Time vector
t = 0:1e-5:0.1;   % Time vector with fine resolution

% Message signal definition
m = zeros(size(t));
m(t >= 0 & t < t0/4) = 2;
m(t >= t0/4 & t < 3*t0/4) = -1;

% Carrier signal
carrier = sin(2*pi*fc*t);

% Amplitude Modulated Signal
am_signal = (1 + m_index * m) .* carrier;

% Envelope Detection (No Noise)
envelope = abs(hilbert(am_signal));

% Signal Power and Noise Calculation
signal_power = mean(am_signal.^2);
noise_power_1 = signal_power / 10;   % 1/10 of signal power
noise_power_2 = signal_power / 50;  % 1/50 of signal power

% Generate Two Noises
noise_1 = sqrt(noise_power_1) * randn(size(t)); % 첫 번째 노이즈
noise_2 = sqrt(noise_power_2) * randn(size(t)); % 두 번째 노이즈

% Combine Noises and Add to Signal
combined_noise = noise_1 + noise_2;            % 두 노이즈를 합산
am_signal_noisy = am_signal + combined_noise;  % 노이즈가 추가된 AM 신호

% Envelope Detection for Noisy Signal
envelope_noisy = abs(hilbert(am_signal_noisy));

% ============================
% Plotting Results
% ============================

figure;

% 1. Original Message Signal
subplot(3, 1, 1);
plot(t, m, 'LineWidth', 1.5);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 2. Amplitude Modulated Signal
subplot(3, 1, 2);
plot(t, am_signal, 'LineWidth', 1.5);
title('Amplitude Modulated Signal (No Noise)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 3. Envelope of Noisy AM Signal
subplot(3, 1, 3);
plot(t, envelope_noisy, 'r', 'LineWidth', 1.5); hold on;
plot(t, envelope, 'b--', 'LineWidth', 1.5); 
title('Envelope of AM Signal with Combined Noise');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Noisy Envelope', 'Original Envelope');
grid on;
