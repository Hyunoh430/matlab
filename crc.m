function main_crc_simulation()
    % 1. 초기 설정
    data = randi([0 1], 1, 32);  % 32비트 랜덤 데이터
    generator = [1 0 0 0 0 0 1 1 1];  % CRC-8 다항식 (x^8 + x^2 + x + 1)
    
    % 2. 정상 데이터 테스트
    [encoded_data, crc] = crc_calculate(data, generator);
    
    fprintf('\n=== CRC-8 Error Detection Test ===\n');
    fprintf('1. Normal Operation Test\n');
    fprintf('------------------------\n');
    fprintf('Original Data (32 bits):\n  ');
    fprintf('%d', data);
    fprintf('\nCRC-8 (8 bits):\n  ');
    fprintf('%d', crc);
    fprintf('\nEncoded Data (40 bits):\n  ');
    fprintf('%d', encoded_data);
    
    [isValid, remainder] = crc_check(encoded_data, generator);
    fprintf('\nCRC Check (No Error): %s\n', result2str(isValid));
    fprintf('Remainder: ');
    fprintf('%d', remainder);
    fprintf('\n\n');
    
    % 3. 에러 패턴 테스트
    fprintf('2. Error Pattern Tests\n');
    fprintf('---------------------\n');
    
    % 에러 패턴 정의
    error_patterns = {
        % One Bit Error
        create_error_pattern(40, [1, 11, 26], 'One Bit Error (d0, d10, d25)'),
        
        % Two Bit Error
        create_error_pattern(40, [1, 2], 'Two Bit Error (d0, d1)'),
        create_error_pattern(40, [11, 21], 'Two Bit Error (d10, d20)'),
        
        % Three Bit Error
        create_error_pattern(40, [1, 2, 3], 'Three Bit Error (d0, d1, d2)'),
        create_error_pattern(40, [6, 8, 21], 'Three Bit Error (d5, d7, d20)'),
        
        % Four Bit Error
        create_error_pattern(40, [1, 7, 8, 9], 'Four Bit Error (d0, d6, d7, d8)'),
        create_error_pattern(40, [6, 11, 16, 21], 'Four Bit Error (d5, d10, d15, d20)'),
        create_error_pattern(40, [4, 8, 16, 26], 'Four Bit Error (d3, d7, d15, d25)')
    };
    
    % 각 에러 패턴 테스트
    for i = 1:length(error_patterns)
        pattern = error_patterns{i};
        fprintf('\nTesting %s:\n', pattern.description);
        fprintf('Error Pattern (%d bits):\n  ', length(pattern.bits));
        fprintf('%d', pattern.bits);
        
        % 에러 적용
        corrupted_data = apply_error_pattern(encoded_data, pattern.bits);
        fprintf('\nCorrupted Data:\n  ');
        fprintf('%d', corrupted_data);
        
        % CRC 체크
        [isValid, remainder] = crc_check(corrupted_data, generator);
        fprintf('\nCRC Check: %s\n', result2str(isValid));
        fprintf('Remainder: ');
        fprintf('%d', remainder);
        fprintf('\n');
    end
end

function pattern = create_error_pattern(length, positions, description)
    pattern.bits = zeros(1, length);
    pattern.bits(positions) = 1;
    pattern.description = description;
end

function [encoded_data, crc] = crc_calculate(data, generator)
    % Append 8 zeros (length of generator - 1)
    data_with_zeros = [data, zeros(1, 8)];
    remainder = data_with_zeros;
    
    % XOR division
    for i = 1:length(data)
        if remainder(i) == 1
            remainder(i:i+8) = bitxor(remainder(i:i+8), generator);
        end
    end
    
    % Get CRC (last 8 bits)
    crc = remainder(end-7:end);
    % Append CRC to original data
    encoded_data = [data, crc];
end

function [isValid, remainder] = crc_check(encoded_data, generator)
    % Calculate remainder
    check_data = encoded_data;
    for i = 1:(length(encoded_data) - 8)
        if check_data(i) == 1
            check_data(i:i+8) = bitxor(check_data(i:i+8), generator);
        end
    end
    
    % Get remainder (last 8 bits)
    remainder = check_data(end-7:end);
    % Check if remainder is zero
    isValid = all(remainder == 0);
end

function corrupted_data = apply_error_pattern(data, error_pattern)
    corrupted_data = data;
    for i = 1:length(error_pattern)
        if error_pattern(i) == 1
            corrupted_data(i) = bitxor(corrupted_data(i), 1);
        end
    end
end

function str = result2str(isValid)
    if isValid
        str = 'PASS (No Error Detected)';
    else
        str = 'FAIL (Error Detected)';
    end
end