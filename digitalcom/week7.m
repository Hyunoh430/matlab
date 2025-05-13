% QPSK
% OQPSK


close all; clear; clc;

alphabet=[exp(1j*pi*(1/4)),exp(1j*pi*(3/4)),exp(1j*pi*(5/4)),exp(1j*pi*(7/4))];

qpsk=randsrc(1000,1,alphabet);

qpsk_up=upsample(qpsk,10);

T=1/10^5;
t=-10*T:T/10:10*T;
beta2=0.5;

Fs=10/T;
F=linspace(-Fs/2,Fs/2,201);

RC_filter2=sinc(t./T).*cos(pi*beta2*t./T)./(1-(2*beta2*t./T).^2);

qpsk_conv=conv(qpsk_up,RC_filter2,"same");

qpsk_sample=qpsk_conv(1:10:length(qpsk_conv));

qpsk_I=real(qpsk_sample);
qpsk_Q=imag(qpsk_sample);

figure
scatter(qpsk_I,qpsk_Q);
grid on

qpsk_eye=real(qpsk_conv);

figure

for i=1:49
    plot(qpsk_eye(20*(i-1)+1:20*i+1));
    hold on
    grid on
end

figure
plot(qpsk_conv);
grid on

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


oqpsk_conv=conv(oqpsk_up,RC_filter2,"same");

oqpsk_sample=oqpsk_conv(1:10:length(oqpsk_conv));

oqpsk_I=real(oqpsk_sample);
opsk_Q=imag(oqpsk_sample);

figure
scatter(oqpsk_I,opsk_Q);
grid on

qpsk_eye=real(oqpsk_conv);

figure

for i=1:49
    plot(qpsk_eye(20*(i-1)+1:20*i+1));
    hold on
    grid on
end

figure
plot(oqpsk_conv);
grid on






