% QPSK Simulation using erfc for theoretical BER
% Parameters
symbolnum = 1000000; % Number of symbols
Es = 1; % Energy per symbol (Es = 2Eb for QPSK)

% Generate Eb/N0 values (linear scale from 10^-3 to 10^1)
EbN0_linear = logspace(-3, 1, 20); % 20 points from 10^-3 to 10^1

% Preallocate array for BER
ber_sim = zeros(size(EbN0_linear));

% Generate random bits and map to QPSK symbols
bits = randi([0 1], 1, 2*symbolnum);
symbols = (1-2*bits(1:2:end)) + 1j*(1-2*bits(2:2:end));
symbols = symbols * sqrt(Es/2); % Normalize symbol energy

% Simulation loop
for i = 1:length(EbN0_linear)
    % Calculate noise variance (N0 = Es/(2*EbN0) for QPSK)
    N0 = Es / (2 * EbN0_linear(i));
    
    % Generate complex noise
    noise = sqrt(N0/2) * (randn(size(symbols)) + 1j*randn(size(symbols)));
    
    % Received signal
    R = symbols + noise;
    
    % Decision
    bits_received = [real(R) < 0; imag(R) < 0];
    bits_received = bits_received(:)';
    
    % Calculate BER
    ber_sim(i) = sum(bits ~= bits_received) / (2*symbolnum);
end

% Theoretical BER for QPSK using erfc
ber_theory = 0.5 * erfc(sqrt(EbN0_linear));

% Plotting
figure;
loglog(EbN0_linear, ber_sim, 'b.', 'MarkerSize', 10, 'DisplayName', 'Simulation');
hold on;
loglog(EbN0_linear, ber_theory, 'r-', 'LineWidth', 2, 'DisplayName', 'Theory');
grid on;
xlabel('Eb/N0 (linear)');
ylabel('Bit Error Rate');
title('QPSK BER Performance');
legend('Location', 'southwest');
xlim([1e-3, 1e1]);
ylim([1e-5, 1]);
xticks(10.^(-3:1:1));
yticks(10.^(-5:1:0));