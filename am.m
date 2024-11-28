% Simulation of Amplitude Modulation (AM)
% Mobile & Space Comm Lab Simulation #1

% Simulation Parameters
fc = 2.5e3;       % Carrier frequency (2.5 kHz)
m_index = 0.875;  % Modulation index
t0 = 0.025;       % Time parameter

% Time vector
t = 0:1e-5:0.1;   % Time vector with fine resolution

% Message signal definition
m = zeros(size(t));
m(t >= 0 & t < 2*t0) = 1;
m(t >= 2*t0 & t < 4*t0) = 4;

% Carrier signal
carrier = sin(2*pi*fc*t);

% Amplitude Modulated Signal
am_signal = (1 + m_index * m) .* carrier;

% Envelope Detection
envelope = abs(hilbert(am_signal));

% Plotting
figure;

% Original Message Signal
subplot(3,1,1);
plot(t, m);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Amplitude Modulated Signal
subplot(3,1,2);
plot(t, am_signal);
title('Amplitude Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Envelope of AM Signal
subplot(3,1,3);
plot(t, envelope);
title('Envelope of AM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Signal Power and Noise Simulation
signal_power = mean(am_signal.^2);
noise_power_1 = signal_power / 10;   % 1/10 of signal power
noise_power_2 = signal_power / 50;   % 1/50 of signal power

% Adding Additive White Gaussian Noise (AWGN)
noise_1 = sqrt(noise_power_1) * randn(size(t));
noise_2 = sqrt(noise_power_2) * randn(size(t));

am_signal_noisy_1 = am_signal + noise_1;
am_signal_noisy_2 = am_signal + noise_2;

% Optional: You can add further processing or analysis of noisy signals here