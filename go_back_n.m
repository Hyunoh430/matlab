function [pps, event_times] = go_back_n_simulation(RTT, error_prob, window_size)
    % Simulation parameters
    NUM_PACKETS = 10000;       % 10000 packets (1 bit per packet)
    PACKET_TRANS_TIME = 0.020; % 20ms to transmit one packet
    
    % Initialize variables
    current_time = 0;
    successful_packets = 0;
    total_attempts = 0;
    event_times = zeros(NUM_PACKETS, 6);
    
    % Window management
    base = 1;          % First unacked packet
    next_seq = 1;      % Next packet to send
    
    % Keep track of packet status and times
    packet_status = zeros(1, NUM_PACKETS);  % 0:not sent, 1:sent, 2:acked
    packet_sent_time = zeros(1, NUM_PACKETS);
    
    while base <= NUM_PACKETS
        % Send packets within window
        while (next_seq < base + window_size) && (next_seq <= NUM_PACKETS)
            % Record event times for packet transmission
            event_times(next_seq, 1) = current_time;  % Start time
            event_times(next_seq, 2) = current_time + PACKET_TRANS_TIME;  % Transmission complete
            
            packet_status(next_seq) = 1;  % Mark as sent
            packet_sent_time(next_seq) = current_time;
            total_attempts = total_attempts + 1;
            
            current_time = current_time + PACKET_TRANS_TIME;
            next_seq = next_seq + 1;
        end
        
        % Process the oldest unacked packet in window
        process_time = packet_sent_time(base) + RTT/2;
        
        % Check for packet error
        if rand() >= error_prob
            % Successful transmission
            event_times(base, 3) = process_time;  % Receiver processed
            event_times(base, 4) = process_time;  % ACK generated
            event_times(base, 5) = process_time;  % ACK transmitted
            event_times(base, 6) = packet_sent_time(base) + RTT;  % ACK received
            
            packet_status(base) = 2;  % Mark as acked
            successful_packets = successful_packets + 1;
            base = base + 1;
            
            current_time = max(current_time, packet_sent_time(base-1) + RTT);
        else
            % Packet error - need to retransmit window
            event_times(base, 3) = process_time;  % Receiver processed
            event_times(base, 4) = process_time;  % NACK generated
            event_times(base, 5) = process_time;  % NACK transmitted
            event_times(base, 6) = packet_sent_time(base) + RTT;  % NACK received
            
            current_time = max(current_time, packet_sent_time(base) + RTT);
            
            % Reset window
            next_seq = base;
            % Mark all packets in window as not sent
            for i = base:min(base+window_size-1, NUM_PACKETS)
                packet_status(i) = 0;
            end
        end
    end
    
    % Calculate packages per second
    pps = successful_packets / current_time;
    
    % Display statistics
    fprintf('Total transmission attempts: %d\n', total_attempts);
    fprintf('Average attempts per packet: %.2f\n', total_attempts/NUM_PACKETS);
    fprintf('Total simulation time: %.2f seconds\n', current_time);
end

% Test with different parameters
RTTs = [0.010, 0.025, 0.050];  % 10ms, 25ms, 50ms
error_probs = [0.01, 0.10];    % 1%, 10%

% Calculate optimal window size for each RTT
% Formula: window_size = (RTT + packet_trans_time) / packet_trans_time
PACKET_TRANS_TIME = 0.020; % 20ms
window_sizes = ceil((RTTs + PACKET_TRANS_TIME) / PACKET_TRANS_TIME);
% ceil 함수로 올림 처리하여 정수 window size 얻기

% Initialize results matrix
results = zeros(length(RTTs), length(error_probs));

% Run simulations for all combinations
for i = 1:length(RTTs)
    for j = 1:length(error_probs)
        fprintf('\nRTT: %dms, Error Probability: %.2f, Window Size: %d\n', ...
            RTTs(i)*1000, error_probs(j), window_sizes(i));
        [pps, events] = go_back_n_simulation(RTTs(i), error_probs(j), window_sizes(i));
        results(i,j) = pps;
    end
end

% Display final results
disp('');
disp('Successful Packages per Second (Go-Back-N):');
disp('RTT(ms) | Error 1% | Error 10%');
disp('--------------------------------');
for i = 1:length(RTTs)
    fprintf('%7.0f | %8.2f | %9.2f\n', RTTs(i)*1000, results(i,1), results(i,2));
end