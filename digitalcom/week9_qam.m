% QPSK
% OQPSK


close all; clear; clc;
%%
N=4000;
m=randi([0,1],1,N);
d = 1/sqrt(10);

for i=1:1000
    if ((m(4*i - 3) == 0) && (m(4*i-1) == 1))
        I(i) = 3*d;
    elseif ((m(4*i - 3) == 0) && (m(4*i-1) == 0))
            I(i) = d;
    elseif ((m(4*i - 3) == 1) && (m(4*i-1) == 0))
            I(i) = -d;
    elseif ((m(4*i - 3) == 1) && (m(4*i-1) == 1))
            I(i) = -3*d;
    end

    if ((m(4*i - 2) == 0) && (m(4*i) == 1))
        Q(i) = 3*d;
    elseif ((m(4*i - 2) == 0) && (m(4*i) == 0))
            Q(i) = d;
    elseif ((m(4*i - 2) == 1) && (m(4*i) == 0))
            Q(i) = -d;
    elseif ((m(4*i - 2) == 1) && (m(4*i) == 1))
            Q(i) = -3*d;
    end    

end

for i=1:1000
    QAM(i) = I(i) + j * Q(i);
end

QAM_up = upsample(QAM, 10);
T=1/10^5;
t=-10*T:T/10:10*T;

beta2=0.5;
Fs=10/T;
F=linspace(-Fs/2,Fs/2,201);

RC_filter2=sinc(t./T).*cos(pi*beta2*t./T)./(1-(2*beta2*t./T).^2);

qpsk_conv=conv(QAM_up,RC_filter2,"same");

qpsk_sample=qpsk_conv(1:10:length(qpsk_conv));


%% qpsk phase offset = 0 frequency offset = 0

qpsk_I=real(qpsk_conv);
qpsk_Q=imag(qpsk_conv);
qpsk_I_sample=qpsk_I(1:10:length(qpsk_conv));
qpsk_Q_sample=qpsk_Q(1:10:length(qpsk_conv));
figure
scatter(qpsk_I_sample,qpsk_Q_sample);
grid on

figure
for i=1:400
    plot(qpsk_I(20*(i-1)+1:20*i+1));
    hold on
    grid on
end

figure
plot(qpsk_conv)

%% qpsk phase offset = 20 frequency offset = 0
p_offset = qpsk_conv .* exp(1i * pi/9);
p_offset_sample = p_offset(1:10:length(p_offset));
%p_offset = qpsk_sample * exp(1i * pi/9);

qpsk_I=real(p_offset_sample);
qpsk_Q=imag(p_offset_sample);
figure
scatter(qpsk_I,qpsk_Q);
grid on

figure
for i=1:400
    plot(real(p_offset(20*(i-1)+1:20*i+1)));
    hold on
    grid on
end

figure
plot(p_offset)

%% qpsk phase offset = 0 frequency offset = 1000hz
time=0:1/Fs:0.01-1/Fs;
p_offset = qpsk_conv.* exp(1i * 2*pi * 1000 * time);
p_offset_sample = p_offset(1:10:length(p_offset));
qpsk_I=real(p_offset_sample);
qpsk_Q=imag(p_offset_sample);
figure
scatter(qpsk_I,qpsk_Q);
grid on

figure
for i=1:400
    plot(real(p_offset(20*(i-1)+1:20*i+1)));
    hold on
    grid on
end

figure
plot(p_offset);

%% qpsk phase offset = 20 frequency offset = 0
p_offset = qpsk_conv .* exp(1i * pi/9);

%p_offset = qpsk_sample * exp(1i * pi/9);
s4 = real(qpsk_conv) + 1j * imag(p_offset);
s4_sample = s4(1:10:length(p_offset));

qpsk_I=real(s4_sample);
qpsk_Q=imag(s4_sample);
figure
scatter(qpsk_I,qpsk_Q);
grid on

figure
for i=1:400
    plot(real(p_offset(20*(i-1)+1:20*i+1)));
    hold on
    grid on
end

figure
plot(p_offset)

%%


%%
% alphabet=[exp(1j*pi*(1/4)),exp(1j*pi*(3/4)),exp(1j*pi*(5/4)),exp(1j*pi*(7/4))];
% 
% qpsk=randsrc(4000,1,alphabet);
% 
% qpsk_up=upsample(qpsk,10);
% 
% T=1/10^5;
% t=-10*T:T/10:10*T;
% beta2=0.5;
% 
% Fs=10/T;
% F=linspace(-Fs/2,Fs/2,201);
% 
% RC_filter2=sinc(t./T).*cos(pi*beta2*t./T)./(1-(2*beta2*t./T).^2);
% 
% qpsk_conv=conv(qpsk_up,RC_filter2,"same");
% 
% qpsk_sample=qpsk_conv(1:10:length(qpsk_conv));
% 
% qpsk_I=real(qpsk_sample);
% qpsk_Q=imag(qpsk_sample);
% 
% figure
% scatter(qpsk_I,qpsk_Q);
% grid on
% 
% qpsk_eye=real(qpsk_conv);
% 
% figure
% 
% for i=1:49
%     plot(qpsk_eye(20*(i-1)+1:20*i+1));
%     hold on
%     grid on
% end
% 
% figure
% plot(qpsk_conv);
% grid on

