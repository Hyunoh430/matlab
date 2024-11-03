function [pps, event_times] = stop_and_wait_simulation(RTT, error_prob)
    % Simulation parameters
    NUM_PACKETS = 10000;       % 10000 packets (1 bit per packet)
    PACKET_TRANS_TIME = 0.020; % 20ms to transmit one packet
    
    % Initialize variables
    current_time = 0;
    successful_packets = 0;
    total_attempts = 0;
    event_times = zeros(NUM_PACKETS, 6);  % Store 6 events for each successful transmission
    
    % Main simulation loop
    for packet = 1:NUM_PACKETS
        success = false;
        while ~success
            total_attempts = total_attempts + 1;
            
            % Event 1: Start of packet
            start_time = current_time;
            event_times(packet, 1) = start_time;
            
            % Event 2: Packet transmitted
            trans_time = current_time + PACKET_TRANS_TIME;
            event_times(packet, 2) = trans_time;
            current_time = trans_time;
            
            % Event 3: Receiver processes packet
            process_time = current_time + RTT/2;
            event_times(packet, 3) = process_time;
            
            % Check for packet error after transmission
            if rand() >= error_prob
                % Successful transmission
                % Event 4-6: ACK generation, transmission, and reception
                event_times(packet, 4) = process_time;
                event_times(packet, 5) = process_time;
                event_times(packet, 6) = current_time + RTT;
                success = true;
                successful_packets = successful_packets + 1;
            else
                % Failed transmission
                % Event 4-6: NACK generation, transmission, and reception
                event_times(packet, 4) = process_time;
                event_times(packet, 5) = process_time;
                event_times(packet, 6) = current_time + RTT;
            end
            
            % Update current time to include full RTT
            current_time = current_time + RTT;
        end
    end
    
    % Calculate packages per second
    pps = successful_packets / current_time;
    
    % Display additional statistics
    fprintf('Total transmission attempts: %d\n', total_attempts);
    fprintf('Average attempts per packet: %.2f\n', total_attempts/NUM_PACKETS);
    fprintf('Total simulation time: %.2f seconds\n', current_time);
end

% Test all combinations
RTTs = [0.010, 0.025, 0.050];  % 10ms, 25ms, 50ms
error_probs = [0.01, 0.10];    % 1%, 10%

% Initialize results matrix
results = zeros(length(RTTs), length(error_probs));

% Run simulations for all combinations
for i = 1:length(RTTs)
    for j = 1:length(error_probs)
        fprintf('\nRTT: %dms, Error Probability: %.2f\n', RTTs(i)*1000, error_probs(j));
        [pps, events] = stop_and_wait_simulation(RTTs(i), error_probs(j));
        results(i,j) = pps;
    end
end

% Display final results
disp('');
disp('Successful Packages per Second:');
disp('RTT(ms) | Error 1% | Error 10%');
disp('--------------------------------');
for i = 1:length(RTTs)
    fprintf('%7.0f | %8.2f | %9.2f\n', RTTs(i)*1000, results(i,1), results(i,2));
end