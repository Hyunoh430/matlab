% BPSK Simulation with Theoretical BER Comparison

% Parameters
bitnum = 1000000; % Number of bits to simulate
Eb = 1; % Energy per bit
EbNo_dB = 0:0.5:10; % Eb/No range in dB

% Preallocate arrays
ber_sim = zeros(size(EbNo_dB));
ber_theory = zeros(size(EbNo_dB));

% Generate random bits
bits = randi([0 1], 1, bitnum);

% BPSK modulation
s = 2*bits - 1;

% Simulation loop
for i = 1:length(EbNo_dB)
    % Calculate noise variance
    No = Eb / (10^(EbNo_dB(i)/10));
    n0 = No/2;
    
    % Generate noise
    n = sqrt(n0) * randn(size(s));
    
    % Received signal
    r = s + n;
    
    % Decision
    bits_received = (r > 0);
    
    % Calculate BER
    ber_sim(i) = sum(bits ~= bits_received) / bitnum;
    
    % Theoretical BER
    ber_theory(i) = 0.5 * erfc(sqrt(10^(EbNo_dB(i)/10)));
end

% Plotting
figure;
semilogy(EbNo_dB, ber_sim,  'DisplayName', 'Simulation');
hold on;
semilogy(EbNo_dB, ber_theory, 'DisplayName', 'Theory');
grid on;
xlabel('Eb/No (dB)');
ylabel('Bit Error Rate');
title('BPSK BER Performance');
legend('Location', 'southwest');
ylim([1e-5 1]);