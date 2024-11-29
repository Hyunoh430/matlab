% Frequency Modulation (FM) Simulation
% Parameters
fc = 2.5e3;     % Carrier frequency (2.5 kHz)
kf = 50;        % Frequency deviation constant
t0 = 0.025;     % Time parameter
bw = 120;       % Bandwidth of message signal main lobe (120 Hz)

% Time vector
dt = 1e-5;
t = 0:dt:0.1;   % Time vector with fine resolution

% Message signal definition
m = zeros(size(t));
m(t >= 0 & t < t0/4) = 2;
m(t >= t0/4 & t < 3*t0/4) = -1;

% Carrier signal
carrier_freq = fc;

% Frequency Modulated Signal
phase_integral = 2*pi*carrier_freq*t + 2*pi*kf*cumsum(m)*dt;
fm_signal = cos(phase_integral);

% Calculate Signal Power
signal_power = mean(fm_signal.^2);

% Generate AWGN with two different noise power levels
noise_power1 = signal_power / 10;   % 1/10 of signal power
noise_power2 = signal_power / 50;   % 1/50 of signal power

% Create noisy FM signals
noise1 = sqrt(noise_power1) * randn(size(fm_signal));
noise2 = sqrt(noise_power2) * randn(size(fm_signal));

noisy_fm_signal1 = fm_signal + noise1;
noisy_fm_signal2 = fm_signal + noise2;

% Demodulation Function
function demod_signal = fm_demodulate(signal, fc, kf, dt)
    phase_derivative = diff(unwrap(angle(hilbert(signal))))/dt;
    demod_signal = (phase_derivative - 2*pi*fc) / (2*pi*kf);
end

% Demodulate signals
demod_signal = fm_demodulate(fm_signal, fc, kf, dt);

% Spectrum Analysis
N = length(t);
message_freq = linspace(0, 1/dt, N);
message_spectrum = abs(fft(m)/N);
message_spectrum = message_spectrum(1:N/2);
message_freq = message_freq(1:N/2);

modulated_spectrum = abs(fft(fm_signal)/N);
modulated_spectrum = modulated_spectrum(1:N/2);
modulated_freq = linspace(0, 1/dt, N/2);

% =========================
% Plotting for Assignments
% =========================

% 1. Plot the Frequency Modulated Signal
figure('Position', [100, 100, 800, 600]);

% Original Message Signal
subplot(3, 1, 1);
plot(t, m, 'LineWidth', 1.5);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency Modulated Signal
subplot(3, 1, 2);
plot(t, fm_signal, 'LineWidth', 1.5);
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Demodulated Signal vs Original Signal
subplot(3, 1, 3);
plot(t(1:length(demod_signal)), demod_signal, 'r', 'LineWidth', 1.5); hold on;
plot(t, m, 'b--', 'LineWidth', 1.5); % Overlay original message signal for comparison
title('Demodulated Signal vs Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Demodulated Signal', 'Original Message Signal');
grid on;

% 2. Plot the Spectra of the Message and the Modulated Signals
figure('Position', [100, 100, 800, 600]);

% Message Signal Spectrum
subplot(2, 1, 1);
plot(message_freq, message_spectrum, 'LineWidth', 1.5);
title('Message Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Modulated Signal Spectrum
subplot(2, 1, 2);
plot(modulated_freq, modulated_spectrum, 'LineWidth', 1.5);
title('Modulated Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
