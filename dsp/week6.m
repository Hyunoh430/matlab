clc; clear; close all;

%% 공통 설정
N = 1e5;         % 비트 수
Rb = 1e3;        % 비트율
Fs = 10e3;       % 샘플링 주파수
sps = Fs/Rb;     % 샘플 당 샘플 수

%% BPSK 신호 생성
bits_bpsk = randi([0 1], 1, N);
symbols_bpsk = 2*bits_bpsk - 1;  % 0->-1, 1->+1
upsampled_bpsk = upsample(symbols_bpsk, sps);
pulse = ones(1, sps);            % NRZ pulse
tx_bpsk = conv(upsampled_bpsk, pulse, 'same');

%% QPSK 신호 생성
bits_qpsk = randi([0 1], 1, N);
symbols_I = 2*bits_qpsk(1:2:end) - 1;
symbols_Q = 2*bits_qpsk(2:2:end) - 1;
symbols_qpsk = (symbols_I + 1j*symbols_Q) / sqrt(2);
upsampled_qpsk = upsample(symbols_qpsk, sps);
tx_qpsk = conv(upsampled_qpsk, pulse, 'same');

%% PSD 계산 및 시각화
[psd_bpsk, f1] = pwelch(tx_bpsk, [], [], [], Fs, 'centered');
[psd_qpsk, f2] = pwelch(tx_qpsk, [], [], [], Fs, 'centered');

figure;
plot(f1/Fs, 10*log10(psd_bpsk), 'LineWidth', 1.5); hold on;
plot(f2/Fs, 10*log10(psd_qpsk), 'LineWidth', 1.5);
legend('BPSK', 'QPSK'); grid on;
xlabel('Normalized Frequency'); ylabel('PSD (dB)');
title('BPSK vs QPSK PSD (same bit rate)');
