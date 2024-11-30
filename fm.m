% Parameters
fc = 2.5e3;     % Carrier frequency (Hz)
kf = 100;       % Increased frequency deviation constant
t0 = 0.025;     % Time parameter
dt = 1e-5;      % Time step
t = 0:dt:0.1;   % Time vector
fs = 1/dt;      % Sampling frequency

% Message signal
m = zeros(size(t));
m(t >= 0 & t < t0/4) = 2;
m(t >= t0/4 & t < 3*t0/4) = -1;

% Frequency deviation
freqdev = kf * max(abs(m)); % Deviation proportional to max message amplitude

% FM Modulation
fm_signal = fmmod(m, fc, fs, freqdev);

% Add AWGN (noise)
signal_power = mean(fm_signal.^2);
noise_power1 = signal_power / 10;   % Noise power level 1
noise_power2 = signal_power / 50;  % Noise power level 2
noisy_fm_signal = fm_signal + sqrt(noise_power1) * randn(size(fm_signal)) + ...
                               sqrt(noise_power2) * randn(size(fm_signal));

% FM Demodulation
bandpass_fm_signal = bandpass(noisy_fm_signal, [fc-500, fc+500], fs);
demod_signal = fmdemod(bandpass_fm_signal, fc, fs, freqdev);


% Improved Low-pass filtering
filtered_demod_signal = lowpass(demod_signal, 100, fs); % Lower cutoff frequency

% Normalize the demodulated signal
filtered_demod_signal = filtered_demod_signal / max(abs(filtered_demod_signal)) * max(abs(m));

% ===========================
% Visualization for FM Modulation and Demodulation
% ===========================

% Time-Domain FM Signal Plot
figure('Position', [100, 100, 800, 600]);

% Frequency Modulated Signal
subplot(3, 1, 1);
plot(t, fm_signal, 'b', 'LineWidth', 1.5);
title('Frequency Modulated Signal (FM)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency-Domain Spectrum of Message and FM Signals
message_spectrum_full = fftshift(abs(fft(m) / length(m)));
modulated_spectrum_full = fftshift(abs(fft(fm_signal) / length(fm_signal)));

% Frequency axis for full spectrum (-fs/2 to fs/2)
full_freq_axis = linspace(-fs/2, fs/2, length(m));

subplot(3, 1, 2);
plot(full_freq_axis, message_spectrum_full, 'r', 'LineWidth', 1.5); hold on;
plot(full_freq_axis, modulated_spectrum_full, 'b', 'LineWidth', 1.5);
title('Spectra of Message and Modulated Signals (Full Frequency Range)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend('Message Signal Spectrum', 'FM Signal Spectrum');
grid on;

% Time-Domain Comparison: Demodulated vs Original Message Signal
subplot(3, 1, 3);
plot(t, filtered_demod_signal, 'r', 'LineWidth', 1.5); hold on;
plot(t, m, 'b--', 'LineWidth', 1.5);
title('Demodulated Signal vs Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Demodulated Signal', 'Original Message Signal');
grid on;

