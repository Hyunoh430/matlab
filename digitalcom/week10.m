close all;
clear all;
clc

N=10^6;

sym=randi([0,1],1,N);
BPSK_sym=2*sym-1;

alphabet = [1+1j, 1-1j, -1+1j, -1-1j] / sqrt(2); 
QPSK_sym = randsrc(1, N, alphabet);
for k = 1:N
    if QPSK_sym(k) == alphabet(1)
        QPSK_bit(2*k-1) = 1;
        QPSK_bit(2*k) = 1;
    elseif QPSK_sym(k) == alphabet(2)
        QPSK_bit(2*k-1) = 1;
        QPSK_bit(2*k) = -1;
    elseif QPSK_sym(k) == alphabet(3)
        QPSK_bit(2*k-1) = -1;
        QPSK_bit(2*k) = 1;
    elseif QPSK_sym(k) == alphabet(4)
        QPSK_bit(2*k-1) = -1;
        QPSK_bit(2*k) = -1;
    end
end


noise=(randn(1,N)+1j*randn(1,N))/sqrt(2);


EbN0=-3:1:10;
EbN0_lin=10.^(EbN0/10);

for i=1:14
    GN=noise*(1/sqrt(EbN0_lin(i)));
    BPSK=BPSK_sym+GN;
    for k = 1:N
        if real(BPSK(k)) > 0
            recover_bit(k) = 1;
        else
            recover_bit(k) = 0;
        end
    end
    
    BPSK_BER(i) = sum(recover_bit ~= sym)/N;
end

[BPSK_BER_theory,BPSK_SER_theory]=berawgn(EbN0,'psk',2,'nondiff');
[QPSK_BER_theory,QPSK_SER_theory]=berawgn(EbN0,'psk',4,'nondiff');

%%   QPSK_SER
for i=1:14
    GN_QPSK=noise*(1/sqrt(EbN0_lin(i)*2));
    QPSK=QPSK_sym+GN_QPSK;
    for k = 1:N
        if (real(QPSK(k)) > 0 && imag(QPSK(k)) > 0)
            qpsk_recover_bit(k) = alphabet(1);
        elseif (real(QPSK(k)) > 0 && imag(QPSK(k)) < 0)
            qpsk_recover_bit(k) =alphabet(2) ;
        elseif (real(QPSK(k)) < 0 && imag(QPSK(k)) > 0)
            qpsk_recover_bit(k) =alphabet(3) ;
        elseif (real(QPSK(k)) < 0 && imag(QPSK(k)) < 0)
            qpsk_recover_bit(k) =alphabet(4) ;
        end
    end
    count = 0;
    for j = 1:N
        if qpsk_recover_bit(j) ~= QPSK_sym(j)
            count = count + 1;
        end
    end
    QPSK_SER(i) = count / N;
end

%% QPSK BER
for i=1:14
    GN_QPSK=noise*(1/sqrt(EbN0_lin(i)*2));
    QPSK=QPSK_sym+GN_QPSK;
    for k = 1:N/2
        if (real(QPSK(k)) > 0) && (imag(QPSK(k)) > 0)
            recover_bit_qpsk(2*k-1) = 1;
            recover_bit_qpsk(2*k) = 1;
        elseif (real(QPSK(k)) < 0) && (imag(QPSK(k)) > 0)
            recover_bit_qpsk(2*k-1) = 0;
            recover_bit_qpsk(2*k) = 1;
        elseif (real(QPSK(k)) < 0) && (imag(QPSK(k)) < 0)
            recover_bit_qpsk(2*k-1) = 0;
            recover_bit_qpsk(2*k) = 0;
        elseif (real(QPSK(k)) > 0) && (imag(QPSK(k)) < 0)
            recover_bit_qpsk(2*k-1) = 1;
            recover_bit_qpsk(2*k) = 0;
        end 
    end 
    QPSK_BER(i) = sum(recover_bit_qpsk ~= sym)/N;
   
end

%%
figure
semilogy(EbN0,BPSK_BER_theory, '-o')
grid on
hold on
semilogy(EbN0, QPSK_BER_theory, '-s')
hold on
semilogy(EbN0,BPSK_BER, '--o')
hold on
%semilogy(EbN0,QPSK_BER, '--s')


figure
semilogy(EbN0,BPSK_BER_theory)
grid on
hold on
semilogy(EbN0,BPSK_BER)
semilogy(EbN0,QPSK_SER_theory)
semilogy(EbN0,QPSK_SER)
