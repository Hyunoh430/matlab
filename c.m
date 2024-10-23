function main_crc_simulation()
    % 1. 초기 설정
    data = randi([0 1], 1, 32);  % 32비트 랜덤 데이터
    generator = [1 0 0 0 0 0 1 1];  % CRC-8 다항식 (x^8 + x^2 + x + 1, 0x07)
    
    % 주어진 에러 패턴
    error_patterns = {
        [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],  % d0, d10, d25
        [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1],  % d0, d1 (two-bit error)
        [1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1]  % d0, d1, d2 (three-bit error)
    };
    
    % 2. 정상 데이터 테스트
    fprintf('\n=== CRC-8 Error Detection Test ===\n\n');
    fprintf('1. Normal Operation Test\n');
    fprintf('------------------------\n');
    
    [encoded_data, crc] = crc_calculate(data, generator);
    
    display_data('Original Data', data);
    display_data('CRC-8', crc);
    display_data('Encoded Data', encoded_data);
    
    isValid = crc_check(encoded_data, generator);
    display_result('CRC Check (No Error)', isValid);
    
    % 3. 에러 패턴 테스트
    fprintf('\n2. Error Pattern Tests\n');
    fprintf('---------------------\n');
    
    for i = 1:length(error_patterns)
        fprintf('\nError Pattern %d:\n', i);
        error_pattern = error_patterns{i};
        
        % 에러 패턴 표시
        display_data('Error Pattern', error_pattern);
        
        % 에러 적용
        corrupted_data = apply_error(encoded_data, error_pattern);
        display_data('Corrupted Data', corrupted_data);
        
        % CRC 체크
        isValid = crc_check(corrupted_data, generator);
        display_result('CRC Check', isValid);
    end
end

function display_data(label, data)
    fprintf('%s (%d bits):\n', label, length(data));
    fprintf('  ');
    fprintf('%d', data);
    fprintf('\n');
end

function display_result(label, isValid)
    if isValid
        result = 'PASS';
    else
        result = 'FAIL (Error Detected)';
    end
    fprintf('%s: %s\n', label, result);
end

function [encoded_data, crc] = crc_calculate(data, generator)
    n = length(generator) - 1;
    data_with_zeros = [data, zeros(1, n)];
    encoded_data = data_with_zeros;
    
    for i = 1:length(data)
        if encoded_data(i) == 1
            encoded_data(i:i+n) = bitxor(encoded_data(i:i+n), generator);
        end
    end
    
    crc = encoded_data(end-n+1:end);
    encoded_data = [data, crc];
end

function isValid = crc_check(encoded_data, generator)
    n = length(generator) - 1;
    check_data = encoded_data;
    
    for i = 1:(length(encoded_data) - n)
        if check_data(i) == 1
            check_data(i:i+n) = bitxor(check_data(i:i+n), generator);
        end
    end
    
    isValid = all(check_data(end-n+1:end) == 0);
end

function corrupted_data = apply_error(data, error_pattern)
    corrupted_data = data;
    for i = 1:length(error_pattern)
        if error_pattern(i) == 1
            corrupted_data(i) = bitxor(corrupted_data(i), 1);
        end
    end
end

