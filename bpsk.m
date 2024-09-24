% Corrected BPSK Simulation with Linear Eb/N0
% Parameters
bitnum = 1000000; % Increase number of bits for better accuracy
Eb = 1; % Energy per bit

% Generate Eb/N0 values (linear scale from 10^-3 to 10^1)
EbN0_linear = logspace(-3, 1, 20); % 20 points from 10^-3 to 10^1

% Preallocate array for BER
ber_sim = zeros(size(EbN0_linear));

% Generate random bits
bits = randi([0 1], 1, bitnum);

% BPSK modulation
s = sqrt(Eb) * (2*bits - 1);

% Simulation loop
for i = 1:length(EbN0_linear)
    % Calculate noise variance
    n0 = Eb / EbN0_linear(i);
    
    % Generate noise
    noise = sqrt(n0/2) * randn(size(s));
    
    % Received signal
    R = s + noise;
    
    % Decision
    bits_received = (R > 0);
    
    % Calculate BER
    ber_sim(i) = sum(bits ~= bits_received) / bitnum;
end

% Theoretical BER
ber_theory = 0.5 * erfc(sqrt(EbN0_linear));

% Plotting
figure;
loglog(EbN0_linear, ber_sim, 'MarkerSize', 10, 'DisplayName', 'Simulation');
hold on;
loglog(EbN0_linear, ber_theory,  'LineWidth', 1, 'DisplayName', 'Theory');
grid on;
xlabel('Eb/N0 (linear)');
ylabel('Bit Error Rate');
title('BPSK BER Performance');
legend('Location', 'southwest');
xlim([1e-3, 1e1]);
ylim([1e-5, 1]);
xticks(10.^(-3:1:1));
yticks(10.^(-5:1:0));