% 변수 설정
T0 = 12;  % 주기
tau = 3;  % 펄스 폭
t = -5:0.01:5;  % 시간 벡터

% 사각파 함수 정의
square_wave = @(t) 1 * (mod(t + T0/2, T0) >= T0/2 - tau/2 & mod(t + T0/2, T0) < T0/2 + tau/2);

% 푸리에 급수 계산 함수
function y = fourier_series(t, N, T0, tau)
    y = zeros(size(t));
    % DC 성분 추가
    y = y + tau / T0;  % DC 성분 a0
    for k = 1:N
        ak = (2 * tau / T0) * sinc(k * tau / T0);  % 푸리에 계수 수정
        y = y + ak * cos(2*pi*k*t/T0);
    end
end

% 그래프 그리기
figure('Position', [100, 100, 1200, 800]);

N_values = [3, 10, 30, 80];
for i = 1:4
    subplot(2, 2, i);
    N = N_values(i);
    
    % 원본 사각파
    plot(t, square_wave(t), 'k--', 'LineWidth', 1.5);
    hold on;
    
    % 푸리에 급수 근사
    y = fourier_series(t, N, T0, tau);
    plot(t, y, 'r-', 'LineWidth', 1.5);
    
    title(['N = ', num2str(N)]);
    xlabel('t');
    ylabel('X_N(t)');
    ylim([-0.2, 1.2]);
    grid on;
    legend('Original', 'Fourier Approximation');
end

sgtitle('Fourier Series Approximation of Square Wave');
