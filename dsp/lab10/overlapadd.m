clc; clear; close all;

%% 1. 오디오 신호 불러오기
load('data.mat');  % x: clean signal, x_noisy: noisy signal, h: filter, Fs: sampling frequency
time = (0:length(x)-1) / Fs;

%% 2. FFT 기반 Overlap-Add 필터링 설정
blockSize = 512;          % 한 블록당 샘플 수
filterLength = length(h); % FIR 필터 길이
fftSize = blockSize + filterLength - 1; % FFT 계산에 사용할 길이

%% 3. 필터의 주파수 응답 계산
H_freq = fft(h, fftSize);           % 필터를 주파수 영역으로 변환
inputSignal = x_noisy;              % 필터링 대상 신호
outputSignal = zeros(1, length(inputSignal) + filterLength - 1); % 결과 저장용 배열

totalBlocks = ceil(length(inputSignal) / blockSize);  % 총 블록 개수

for blk = 1:totalBlocks
    idx_start = (blk-1) * blockSize + 1;
    idx_end = min(blk * blockSize, length(inputSignal));
    
    blk_data = inputSignal(idx_start:idx_end);  % 블록 단위 신호 추출
    
    % 제로 패딩 후 FFT 수행
    blk_padded = [blk_data, zeros(1, fftSize - length(blk_data))];
    X_blk = fft(blk_padded);
    Y_blk = X_blk .* H_freq;
    y_blk_time = ifft(Y_blk);
    
    % Overlap-Add 적용
    out_start = (blk-1) * blockSize + 1;
    out_end = out_start + fftSize - 1;
    
    if out_end > length(outputSignal)
        y_blk_time = y_blk_time(1:length(outputSignal) - out_start + 1);
        out_end = length(outputSignal);
    end
    
    outputSignal(out_start:out_end) = outputSignal(out_start:out_end) + real(y_blk_time);
end

%% 4. 원래 신호 길이에 맞게 자르기
outputSignal = outputSignal(1:length(inputSignal));

%% 5. 결과 시각화
figure;
subplot(3,1,1); plot(time, x); title('Original Speech'); xlabel('Time (s)');
subplot(3,1,2); plot(time, x_noisy); title('With 2kHz Tone'); xlabel('Time (s)');
subplot(3,1,3); plot(time, real(outputSignal)); title('Filtered Signal'); xlabel('Time (s)');

%% 6. 오디오 청취
sound(x, Fs);            % 원래 신호
pause(6);
sound(x_noisy, Fs);      % 잡음 포함 신호
pause(6);
sound(real(outputSignal), Fs);  % 필터링된 신호
