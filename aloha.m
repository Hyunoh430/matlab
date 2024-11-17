% 초기 파라미터 설정
N = 300;                  % 스테이션 수
G_values = 0.2:0.2:2.0;   % G 값 목록
num_slots = 10000;        % 슬롯 수

% 결과 저장 변수
slotted_simulation_throughput = zeros(size(G_values));
pure_simulation_throughput = zeros(size(G_values));
slotted_ideal_throughput = G_values .* exp(-G_values); % Slotted ALOHA 이론적 처리량
pure_ideal_throughput = G_values .* exp(-2*G_values);  % Pure ALOHA 이론적 처리량

% G 값별로 반복
for i = 1:length(G_values)
    G = G_values(i);
    
    % Slotted ALOHA 시뮬레이션
    P = G / N;               % 각 스테이션의 전송 확률 (Slotted ALOHA)
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
    P = G / N;               % 각 스테이션의 전송 확률 (Pure ALOHA)
    pure_success_count = 0;
    
    for slot = 1:num_slots
        % 현재 슬롯에서 전송 시도 여부 결정
        transmissions = rand(1, N) < P;
        num_transmissions = sum(transmissions);
        
        % Pure ALOHA 성공 조건: 현재 슬롯과 다음 슬롯에 단일 전송만 있어야 함
        if num_transmissions == 1
            % 다음 슬롯에서 충돌 여부 확인
            next_transmissions = rand(1, N) < P;
            next_num_transmissions = sum(next_transmissions);
            
            if next_num_transmissions == 0
                pure_success_count = pure_success_count + 1;
            end
        end
    end
    
    pure_simulation_throughput(i) = pure_success_count / num_slots;
end

% 결과 그래프 그리기
figure;
plot(G_values, slotted_simulation_throughput, 'o-', 'DisplayName', 'Slotted ALOHA Simulation');
hold on;
plot(G_values, slotted_ideal_throughput, 'x--', 'DisplayName', 'Slotted ALOHA Ideal');
plot(G_values, pure_simulation_throughput, 's-', 'DisplayName', 'Pure ALOHA Simulation');
plot(G_values, pure_ideal_throughput, '+--', 'DisplayName', 'Pure ALOHA Ideal');

% 그래프 설정
xlabel('G (Average Arrival Rate)');
ylabel('Throughput');
title('ALOHA Throughput Simulation vs Ideal (Slotted & Pure)');
legend('show');
grid on;
