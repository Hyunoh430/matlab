% 초기 파라미터 설정
N = 300;                  % 스테이션 수
G_values = 0.2:0.2:2.0;  % G 값 목록
num_slots = 10000;        % 슬롯 수
M = 10;                  % Pure ALOHA에서 구간 나누기

% 결과 저장 변수
slotted_simulation_throughput = zeros(size(G_values));
pure_simulation_throughput = zeros(size(G_values));
slotted_ideal_throughput = G_values .* exp(-G_values);
pure_ideal_throughput = G_values .* exp(-2 * G_values);

% G 값별로 반복
for i = 1:length(G_values)
    G = G_values(i);
    
    % Slotted ALOHA 시뮬레이션
    P = G / N;
    slotted_success_count = 0;
    
    for slot = 1:num_slots
        transmissions = rand(1, N) < P;
        num_transmissions = sum(transmissions);
        
        if num_transmissions == 1
            slotted_success_count = slotted_success_count + 1;
        end
    end
    
    slotted_simulation_throughput(i) = slotted_success_count / num_slots;
    
    % Pure ALOHA 시뮬레이션
    P_prime = G / (N * M);
    pure_success_count = 0;
    
    % 각 슬롯에 대해 시뮬레이션
    time_slots = zeros(1, num_slots * M);  % 전체 시간 슬롯
    
    % 전송 시도 기록
    for t = 1:(num_slots * M)
        transmissions = rand(1, N) < P_prime;
        time_slots(t) = sum(transmissions);
    end
    
    % 성공적인 전송 확인
    for t = M:(length(time_slots) - M)
        if time_slots(t) == 1  % 현재 시점에서 하나의 전송
            % 취약 구간 확인 (현재 전송 주변 ±1 패킷 시간)
            vulnerable_period = time_slots(t-M+1:t+M-1);
            vulnerable_period(M) = 0;  % 현재 전송은 제외
            
            if sum(vulnerable_period) == 0  % 취약 구간 내 다른 전송 없음
                pure_success_count = pure_success_count + 1;
            end
        end
    end
    
    % 처리량 계산 시 스케일링 조정
    pure_simulation_throughput(i) = pure_success_count / num_slots;
end

% 결과 그래프 그리기
figure;
plot(G_values, slotted_simulation_throughput, 'bo-', 'LineWidth', 2, 'DisplayName', 'Slotted ALOHA Simulation');
hold on;
plot(G_values, slotted_ideal_throughput, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Slotted ALOHA Ideal');
plot(G_values, pure_simulation_throughput, 'ro-', 'LineWidth', 2, 'DisplayName', 'Pure ALOHA Simulation');
plot(G_values, pure_ideal_throughput, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Pure ALOHA Ideal');

% 그래프 설정
xlabel('G (Average Arrival Rate)');
ylabel('Throughput');
title('ALOHA Throughput Simulation vs Ideal (Slotted & Pure)');
legend('Location', 'northwest');
grid on;
axis([0 2 0 0.4]);

% 각 데이터 포인트에 마커 추가
for i = 1:length(G_values)
    plot(G_values(i), slotted_simulation_throughput(i), 'bo', 'MarkerSize', 8);
    plot(G_values(i), pure_simulation_throughput(i), 'ro', 'MarkerSize', 8);
end