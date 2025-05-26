clc; clear; close all;

%% 1. 신호 데이터 로드
load('data.mat');  % 포함 변수: x, x_noisy, Fs, h
timeAxis = (0:length(x)-1) / Fs;

%% 2. Overlap-Save 필터링 설정
filterLen = length(h);   % FIR 필터 길이
fftLen = 2048;           % FFT 수행 길이 (필터보다 커야 함)
blockLen = fftLen - filterLen + 1;  % 처리 블록 길이

% 필터의 주파수 응답 계산
H_f = fft(h, fftLen);

% 입력 신호 앞에 제로패딩 (초기화 조건)
input_ext = [zeros(1, filterLen - 1), x_noisy(:)'];  % 반드시 행벡터
numSegments = ceil((length(input_ext) - (filterLen - 1)) / blockLen);
filtered_output = [];

%% 3. Overlap-Save FFT 처리 루프
for seg = 1:numSegments
    seg_start = (seg - 1) * blockLen + 1;
    seg_end = seg_start + fftLen - 1;
    
    if seg_end > length(input_ext)
        segment_data = [input_ext(seg_start:end), zeros(1, seg_end - length(input_ext))];
    else
        segment_data = input_ext(seg_start : seg_end);
    end
    
    % FFT 변환 및 주파수 영역 필터링
    X_seg = fft(segment_data);
    Y_seg = X_seg .* H_f;
    y_time = ifft(Y_seg);
    
    % 유효 샘플 추출 및 누적
    valid_output = real(y_time(filterLen:end));
    filtered_output = [filtered_output, valid_output];
end

%% 4. 출력 길이 조정 (입력과 동일하게)
filtered_output = filtered_output(1:length(x_noisy));

%% 5. 파형 시각화
figure;
subplot(3,1,1); plot(timeAxis, x); title('Clean Signal'); xlabel('Time (s)');
subplot(3,1,2); plot(timeAxis, x_noisy); title('Noisy Signal (2kHz Added)'); xlabel('Time (s)');
subplot(3,1,3); plot(timeAxis, filtered_output); title('Filtered Output (Overlap-Save)'); xlabel('Time (s)');

%% 6. 오디오 재생
sound(x, Fs); pause(6);
sound(x_noisy, Fs); pause(6);
sound(filtered_output, Fs);
