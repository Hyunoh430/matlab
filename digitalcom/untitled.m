close all;
clear all;
clc

N=10^6;
bit=randi([0,1],1,4*N);
h_QPSK=(randn(1,2*N)+1j*randn(1,2*N))/sqrt(2);
h_QAM=(randn(1,N)+1j*randn(1,N))/sqrt(2);
d=1/sqrt(10);

for i=1:N
    if (bit(4*i-3)==0)&&(bit(4*i-1)==0)
        sym_i(i)=d;
    elseif (bit(4*i-3)==0)&&(bit(4*i-1)==1)
        sym_i(i)=3*d;
    elseif (bit(4*i-3)==1)&&(bit(4*i-1)==0)
        sym_i(i)=-1*d;
    elseif (bit(4*i-3)==1)&&(bit(4*i-1)==1)
        sym_i(i)=-3*d;
    end
end

for i=1:N
    if (bit(4*i-2)==0)&&(bit(4*i)==0)
        sym_q(i)=d;
    elseif (bit(4*i-2)==0)&&(bit(4*i)==1)
        sym_q(i)=3*d;
    elseif (bit(4*i-2)==1)&&(bit(4*i)==0)
        sym_q(i)=-1*d;
    elseif (bit(4*i-2)==1)&&(bit(4*i)==1)
        sym_q(i)=-3*d;
    end
end

for i=1:2*N
    if (bit(2*i-1)==0)
        qpsk_i(i)=-1;
    else
        qpsk_i(i)=1;
    end
end

for i=1:2*N
    if (bit(2*i)==0)
        qpsk_q(i)=-1;
    else
        qpsk_q(i)=1;
    end
end

for i=1:2*N
    QPSK_sym(i)=(qpsk_i(i)+1j*qpsk_q(i))/sqrt(2);
end

for i=1:N
    QAM_sym(i)=sym_i(i)+1j*sym_q(i);
end

noise_QPSK=(randn(1,2*N)+1j*randn(1,2*N))/sqrt(2);
noise_QAM=(randn(1,N)+1j*randn(1,N))/sqrt(2);


EbN0=-3:1:10;
EbN0_lin=10.^(EbN0/10);

for i=1:14
    GN_QPSK=noise_QPSK*(1/sqrt(2*EbN0_lin(i)));
    GN_QAM=noise_QAM*(1/sqrt(4*EbN0_lin(i)));
    QPSK=QPSK_sym+GN_QPSK./h_QPSK;
    QAM=QAM_sym+GN_QAM./h_QAM;
    
    for k = 1:2*N
        if (real(QPSK(k)) > 0) && (imag(QPSK(k)) > 0)
            recover_sym_qpsk(k) = (1+1j)/sqrt(2);
        elseif (real(QPSK(k)) < 0) && (imag(QPSK(k)) > 0)
            recover_sym_qpsk(k) = (-1+1j)/sqrt(2);
        elseif (real(QPSK(k)) < 0) && (imag(QPSK(k)) < 0)
            recover_sym_qpsk(k) = (-1-1j)/sqrt(2);
        elseif (real(QPSK(k)) > 0) && (imag(QPSK(k)) < 0)
            recover_sym_qpsk(k) = (1-1j)/sqrt(2);
        end
    end
    for k = 1:2*N
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
            
    BER_QPSK(i) = sum(recover_bit_qpsk ~= bit)/(4*N);
    SER_QPSK(i) = sum(recover_sym_qpsk ~= QPSK_sym)/(2*N);

    for k = 1:N
        if (real(QAM(k)) > 2*d) && (imag(QAM(k)) > 2*d)
            recover_sym_QAM(k) = 3*d + 1j*3*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 1;
        elseif (real(QAM(k)) > 2*d) && (imag(QAM(k)) < 2*d) && (imag(QAM(k)) > 0)
            recover_sym_QAM(k) = 3*d + 1j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) > 2*d) && (imag(QAM(k)) < 0) && (imag(QAM(k)) > -2*d)
            recover_sym_QAM(k) = 3*d - 1j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) > 2*d) && (imag(QAM(k)) < -2*d)
            recover_sym_QAM(k) = 3*d - 3j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 1;

        elseif (real(QAM(k)) < 2*d) && (real(QAM(k)) > 0) && (imag(QAM(k)) > 2*d)
            recover_sym_QAM(k) = d + 1j*3*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 1;
        elseif (real(QAM(k)) < 2*d) && (real(QAM(k)) > 0) && (imag(QAM(k)) < 2*d) && (imag(QAM(k)) > 0)
            recover_sym_QAM(k) = d + 1j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < 2*d) && (real(QAM(k)) > 0) && (imag(QAM(k)) < 0) && (imag(QAM(k)) > -2*d)
            recover_sym_QAM(k) = d - 1j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < 2*d) && (real(QAM(k)) > 0) && (imag(QAM(k)) < -2*d)
            recover_sym_QAM(k) = d - 3j*d;
            recover_bit_QAM(4*k-3) = 0;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 1;

        elseif (real(QAM(k)) < 0) && (real(QAM(k)) > -2*d) && (imag(QAM(k)) > 2*d)
            recover_sym_QAM(k) = -d + 1j*3*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 1;
        elseif (real(QAM(k)) < 0) && (real(QAM(k)) > -2*d) && (imag(QAM(k)) < 2*d) && (imag(QAM(k)) > 0)
            recover_sym_QAM(k) = -d + 1j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < 0) && (real(QAM(k)) > -2*d) && (imag(QAM(k)) < 0) && (imag(QAM(k)) > -2*d)
            recover_sym_QAM(k) = -d - 1j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < 0) && (real(QAM(k)) > -2*d) && (imag(QAM(k)) < -2*d)
            recover_sym_QAM(k) = -d - 3j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 0;
            recover_bit_QAM(4*k) = 1;

        elseif (real(QAM(k)) < -2*d) && (imag(QAM(k)) > 2*d)
            recover_sym_QAM(k) = -3*d + 1j*3*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 1;
        elseif (real(QAM(k)) < -2*d) && (imag(QAM(k)) < 2*d) && (imag(QAM(k)) > 0)
            recover_sym_QAM(k) = -3*d + 1j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 0;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < -2*d) && (imag(QAM(k)) < 0) && (imag(QAM(k)) > -2*d)
            recover_sym_QAM(k) = -3*d - 1j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 0;
        elseif (real(QAM(k)) < -2*d) && (imag(QAM(k)) < -2*d)
            recover_sym_QAM(k) = -3*d - 3j*d;
            recover_bit_QAM(4*k-3) = 1;
            recover_bit_QAM(4*k-2) = 1;
            recover_bit_QAM(4*k-1) = 1;
            recover_bit_QAM(4*k) = 1;
        end
    end
    SER_QAM(i) = sum(recover_sym_QAM ~= QAM_sym)/N;
    BER_QAM(i) = sum(recover_bit_QAM ~= bit)/(4*N);    
end

[BER_QPSK_theory,SER_QPSK_theory]=berawgn(EbN0,'psk',4,'nondiff');
[BER_fading_QPSK_theory,SER_fading_QPSK_theory]=berfading(EbN0,'psk',4,1);
[BER_QAM_theory,SER_QAM_theory]=berawgn(EbN0,'qam', 16);
[BER_fading_QAM_theory,SER_fading_QAM_theory]=berfading(EbN0,'qam', 16,1);



figure
semilogy(EbN0,BER_QAM_theory)
grid on
hold on
semilogy(EbN0,BER_QAM)
semilogy(EbN0,BER_fading_QAM_theory)
semilogy(EbN0,BER_QPSK_theory)
semilogy(EbN0,BER_QPSK)
semilogy(EbN0,BER_fading_QPSK_theory)

legend('BER_QAM_theory','BER_QAM','BER_fading_QAM_theory','BER_QPSK_theory','BER_QPSK','BER_fading_QPSK_theory');

figure
semilogy(EbN0,SER_QAM_theory)
grid on
hold on
semilogy(EbN0,SER_QAM)
semilogy(EbN0,SER_fading_QAM_theory)
semilogy(EbN0,SER_QPSK_theory)
semilogy(EbN0,SER_QPSK)
semilogy(EbN0,SER_fading_QPSK_theory)

legend('SER_QAM_theory','SER_QAM','SER_fading_QAM_theory','SER_QPSK_theory','SER_QPSK','SER_fading_QPSK_theory');
