close all;
clear all;
clc

N=10^6;

bit=randi([0,1],1,4 * N);
d = 1/sqrt(10);

for i=1:N
    if ((bit(4*i - 3) == 0) && (bit(4*i-1) == 1))
        I(i) = 3*d;
    elseif ((bit(4*i - 3) == 0) && (bit(4*i-1) == 0))
            I(i) = d;
    elseif ((bit(4*i - 3) == 1) && (bit(4*i-1) == 0))
            I(i) = -d;
    elseif ((bit(4*i - 3) == 1) && (bit(4*i-1) == 1))
            I(i) = -3*d;
    end

    if ((bit(4*i - 2) == 0) && (bit(4*i) == 1))
        Q(i) = 3*d;
    elseif ((bit(4*i - 2) == 0) && (bit(4*i) == 0))
            Q(i) = d;
    elseif ((bit(4*i - 2) == 1) && (bit(4*i) == 0))
            Q(i) = -d;
    elseif ((bit(4*i - 2) == 1) && (bit(4*i) == 1))
            Q(i) = -3*d;
    end    

end
%%
qam = I + 1j * Q;
noise=(randn(1,N)+1j*randn(1,N))/sqrt(2);


EbN0=-3:1:10;
EbN0_lin=10.^(EbN0/10);
%%
for i = 1:14
    GN = noise * (1 / sqrt(4 * EbN0_lin(i)));
    Rx = qam + GN;
    
    for k = 1:N
        if (0 < real(Rx(k)) && real(Rx(k)) < 2 * d)
            recover(4 * k - 3) = 0;
            recover(4 * k - 1) = 0;
            recover_i(k) = d;

        elseif (2 * d < real(Rx(k)))
            recover(4 * k - 3) = 0;
            recover(4 * k - 1) = 1;
            recover_i(k) = 3 * d;

        elseif (-2 * d < real(Rx(k)) && real(Rx(k)) < 0)
            recover(4 * k - 3) = 1;
            recover(4 * k - 1) = 0;
            recover_i(k) = -d;

        elseif (real(Rx(k)) < -2 * d)
            recover(4 * k - 3) = 1;
            recover(4 * k - 1) = 1;
            recover_i(k) = -3 * d;
        end
    end

    for k = 1:N
        if (0 < imag(Rx(k)) && imag(Rx(k)) < 2 * d)
            recover(4 * k - 2) = 0;
            recover(4 * k) = 0;
            recover_q(k) = d;

        elseif (2 * d < imag(Rx(k)))
            recover(4 * k - 2) = 0;
            recover(4 * k) = 1;
            recover_q(k) = 3 * d;

        elseif (-2 * d < imag(Rx(k)) && imag(Rx(k)) < 0)
            recover(4 * k - 2) = 1;
            recover(4 * k) = 0;
            recover_q(k) = -d;

        elseif (imag(Rx(k)) < -2 * d)
            recover(4 * k - 2) = 1;
            recover(4 * k) = 1;
            recover_q(k) = -3 * d;
        end
    end
    
   recover_sym = recover_i + 1j * recover_q;
   ber(i) = sum(recover ~= bit) / (4 * N);
   ser(i) = sum(recover_sym ~= qam) / N;

end



%%
[BER_theory,SER_theory]=berawgn(EbN0,'qam',16);

figure
semilogy(EbN0,BER_theory)
grid on
hold on
plot(EbN0,ber, 'x')
hold on

semilogy(EbN0,SER_theory)
grid on
hold on
plot(EbN0,ser, 'x')








