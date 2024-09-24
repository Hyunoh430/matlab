% QPSK Simulation with Linear Eb/N0
% Parameters
bitnum = 1000000; % Number of bits (should be even for QPSK)
Es = 1; % Energy per symbol (2 bits per symbol in QPSK)
Eb = Es/2; % Energy per bit

% Generate Eb/N0 values (linear scale from 10^-3 to 10^1)
EbN0_linear = logspace(-3, 1, 20);

% Preallocate array for BER
ber_sim = zeros(size(EbN0_linear));

% Generate random bits
bits = randi([0 1], 1, bitnum);

% QPSK modulation
% Reshape bits into 2-bit symbols
I = 2*bits(1:2:end) - 1;
Q = 2*bits(2:2:end) - 1;
s = (I + 1i*Q) / sqrt(2);

% Simulation loop
for i = 1:length(EbN0_linear)
    % Calculate noise variance
    n0 = Eb / EbN0_linear(i);
    
    % Generate complex noise
    noise = sqrt(n0/2) * (randn(size(s)) + 1i*randn(size(s)));
    
    % Received signal
    R = s + noise;
    
    % Decision
    I_received = real(R) > 0;
    Q_received = imag(R) > 0;
    bits_received = [I_received; Q_received];
    bits_received = bits_received(:)';
    
    % Calculate BER
    ber_sim(i) = sum(bits ~= bits_received) / bitnum;
end

% Theoretical BER for QPSK (same as BPSK for same Eb/N0)
ber_theory = 0.5 * erfc(sqrt(EbN0_linear));

% Plotting
figure;
loglog(EbN0_linear, ber_sim, 'o-', 'MarkerSize', 6, 'LineWidth', 1.5, 'DisplayName', 'Simulation');
hold on;
loglog(EbN0_linear, ber_theory, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Theory');
grid on;
xlabel('Eb/N0 (linear)');
ylabel('Bit Error Rate');
title('QPSK BER Performance');
legend('Location', 'southwest');
xlim([1e-3, 1e1]);
ylim([1e-5, 1]);
xticks(10.^(-3:1:1));
yticks(10.^(-5:1:0));