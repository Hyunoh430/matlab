clear; clc;

N = 1000;
T = 1/10^5;
t = -10*T:T/10:10*T;

B = 0.5;
RC = sinc(t/T) .* cos(pi * B * t / T) ./ (1 - (2 * B * t/T).^2);

alphabet = [1+1j, 1-1j, -1+1j, -1-1j] / sqrt(2); 
symbols = randsrc(1, N, alphabet);


oversample = upsample(symbols, 10);
fil_symbol = conv(oversample, RC, 'same');

sample = oversample(1:10:length(oversample));

figure;
scatter(real(sample), imag(sample)); grid on;

figure;
r_s = real(fil_symbol);

for i = 0:100
    plot(r_s(20 * i + 1:  20 * i + 20 + 1)); hold on;
end

for k=1:length(symbols)
    OVSS(2*k-1) = symbols(k);
    OVSS(2*k) = symbols(k);
end

oqpsk=randsrc(1000,1,alphabet);

for k=1:length(oqpsk)
    ovss(2*k-1)=oqpsk(k);
    ovss(2*k)=oqpsk(k);
end

oqpsk_i=real(ovss);
oqpsk_q=imag(ovss);
oqpsk_qd=circshift(oqpsk_q,1);
oqpsk_delay=oqpsk_i+1j*oqpsk_qd;

oqpsk_up=upsample(oqpsk_delay,10);


oqpsk_conv=conv(oqpsk_up,RC,"same");

oqpsk_sample=oqpsk_conv(1:10:length(oqpsk_conv));

oqpsk_I=real(oqpsk_sample);
opsk_Q=imag(oqpsk_sample);

figure;
scatter(oqpsk_I,opsk_Q);
grid on;

qpsk_eye=imag(oqpsk_conv);

figure

for i=1:49
    plot(qpsk_eye(20*(i-1)+1:20*i+1));
    hold on;
    grid on;
end

figure
plot(oqpsk_conv);
grid on
