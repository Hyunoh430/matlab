EbN0_dB = -30:1:10;
EbN0_linear = 10.^(EbN0_dB/10);

ber_qpsk = 0.5 * erfc(sqrt(EbN0_linear));
ber_bpsk = 0.5 * erfc(sqrt(EbN0_linear));
ber_antipodal = 0.5 * erfc(sqrt(EbN0_linear));

figure;
semilogy(EbN0_linear, ber_antipodal, 'b-', 'LineWidth', 2, 'DisplayName', 'Antipodal');
hold on;
semilogy(EbN0_linear, ber_bpsk, 'r-', 'LineWidth', 2, 'DisplayName', 'BPSK');
semilogy(EbN0_linear, ber_qpsk, 'y-', 'LineWidth', 2, 'DisplayName', 'QPSK');
grid on;
xlabel('Eb/N0');
ylabel('BER');
title('BER Performance Comparison');
legend('Location', 'southwest');
xlim([10^-3, 10^1]);
ylim([10^-5, 0.5]);
xticks([10^-3, 10^-2, 10^-1, 10^0, 10^1]);
xticklabels({'10^{-3}', '10^{-2}', '10^{-1}', '10^0', '10^1'});

text(1.5, 0.35, 'QPSK 1 symbol = 2 bits', 'FontSize', 10);
text(1.5, 0.3, 'BPSK 1 symbol = 1 bit', 'FontSize', 10);