% Combined BPSK and QPSK Simulation with Linear Eb/N0
% Parameters
bitnum = 10000000; % Large number of bits for accuracy
Eb = 1; % Energy per bit

% Generate Eb/N0 values (linear scale from 10^-3 to 10^1)
EbN0_linear = logspace(-3, 1, 20);

% Preallocate arrays for BER
ber_sim_bpsk = zeros(size(EbN0_linear));
ber_sim_qpsk = zeros(size(EbN0_linear));

% Generate random bits
rng(1); % Set random seed for reproducibility
bits = randi([0 1], 1, bitnum);

% BPSK modulation
s_bpsk = sqrt(Eb) * (2*bits - 1);

% QPSK modulation (treating two BPSK streams)
bits_I = bits(1:2:end);
bits_Q = bits(2:2:end);
s_qpsk_I = sqrt(Eb) * (2*bits_I - 1);
s_qpsk_Q = sqrt(Eb) * (2*bits_Q - 1);
s_qpsk = (s_qpsk_I + 1i*s_qpsk_Q) / sqrt(2);

% Simulation loop
for i = 1:length(EbN0_linear)
    % Calculate noise variance
    N0 = Eb / EbN0_linear(i);
    noise_variance = N0 / 2;
    
    % BPSK Simulation
    noise_bpsk = sqrt(noise_variance) * randn(size(s_bpsk));
    R_bpsk = s_bpsk + noise_bpsk;
    bits_received_bpsk = real(R_bpsk) > 0;
    ber_sim_bpsk(i) = sum(bits ~= bits_received_bpsk) / bitnum;
    
    % QPSK Simulation
    noise_qpsk_I = sqrt(noise_variance) * randn(size(s_qpsk_I));
    noise_qpsk_Q = sqrt(noise_variance) * randn(size(s_qpsk_Q));
    R_qpsk_I = s_qpsk_I + noise_qpsk_I;
    R_qpsk_Q = s_qpsk_Q + noise_qpsk_Q;
    bits_received_I = real(R_qpsk_I) > 0;
    bits_received_Q = real(R_qpsk_Q) > 0;
    bits_received_qpsk = [bits_received_I; bits_received_Q];
    bits_received_qpsk = bits_received_qpsk(:)';
    ber_sim_qpsk(i) = sum(bits ~= bits_received_qpsk) / bitnum;
end

% Theoretical BER (same for BPSK and QPSK)
ber_theory = 0.5 * erfc(sqrt(EbN0_linear));

% Plotting
figure;
semilogy(10*log10(EbN0_linear), ber_sim_bpsk, 'MarkerSize', 6, 'LineWidth', 1.5, 'DisplayName', 'BPSK Simulation');
hold on;
semilogy(10*log10(EbN0_linear), ber_sim_qpsk, 'MarkerSize', 6, 'LineWidth', 1.5, 'DisplayName', 'QPSK Simulation');
semilogy(10*log10(EbN0_linear), ber_theory, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Theory');
grid on;
xlabel('Eb/N0 (dB)');
ylabel('Bit Error Rate');
title('BPSK vs QPSK BER Performance');
legend('Location', 'southwest');
xlim([10*log10(min(EbN0_linear)), 10*log10(max(EbN0_linear))]);
ylim([1e-5, 1]);
xticks(-30:5:10);
yticks(10.^(-5:1:0));