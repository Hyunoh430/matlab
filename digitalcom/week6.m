clear;clc;
T = 1/10^5;
F_s = 10/T;
F = linspace(-F_s/2, F_s/2, 201);
t = -10*T:T/10:10*T;

figure; 
B = 0;
RC_0 = sinc(t/T) .* cos(pi * B * t / T) ./ (1 - (2 * B * t/T).^2);
plot(t, RC_0);
hold on; 
B = 0.5;
RC_1 = sinc(t/T) .* cos(pi * B * t / T) ./ (1 - (2 * B * t/T).^2);
plot(t, RC_1);
hold on; 
B = 1;
RC_2 = sinc(t/T) .* cos(pi * B * t / T) ./ (1 - (2 * B * t/T).^2);
plot(t, RC_2); 
title('RC filter')

figure; 
fft_RC_0 = abs(fftshift(fft(RC_0)));
fft_RC_1 = abs(fftshift(fft(RC_1)));
fft_RC_2 = abs(fftshift(fft(RC_2)));
plot(F, fft_RC_0);hold on;
plot(F, fft_RC_1);hold on;
plot(F, fft_RC_2);hold on;
title('RC filter frequency');


%%
B = 0;
RRC_0 = (sin(pi * t * (1 - B) / T) + 4 .* B .* t ./T.* cos(pi * t * (1 + B) / T)) ./ (pi * t .* (1 - (4 * B * t / T).^2) / T);
RRC_0(101)=1+B * (4/pi-1);
fft_RRC_0 = abs(fftshift(fft(RRC_0)));

B = 0.5;
RRC_1 = (sin(pi * t * (1 - B) / T) + 4 .* B .* t ./T.* cos(pi * t * (1 + B) / T)) ./ (pi * t .* (1 - (4 * B * t / T).^2) / T);
RRC_1(101) = 1+B * (4/pi-1);
fft_RRC_1 = abs(fftshift(fft(RRC_1)));

B = 1;
RRC_2 = (sin(pi * t * (1 - B) / T) + 4 .* B .* t ./T.* cos(pi * t * (1 + B) / T)) ./ (pi * t .* (1 - (4 * B * t / T).^2) / T);
RRC_2(101)=1+B * (4/pi-1);
fft_RRC_2 = abs(fftshift(fft(RRC_2)));

figure;
plot(t, RRC_0); hold on;
plot(t, RRC_1); hold on;
plot(t, RRC_2); hold on;
title('RRC filter')

figure;
plot(F, fft_RRC_0); hold on;
plot(F, fft_RRC_1); hold on;
plot(F, fft_RRC_2); hold on;


%%
T = 1/10^5;
f_s = 10^6;
BPSK = randi([0,1],1,1000);
BPSK = BPSK * 2 - 1;
BPSK = upsample(BPSK, 10);
RC_conv = conv(BPSK, RC_2, 'same');
RCC_conv = conv(BPSK, RRC_2, 'same');

figure;
plot(BPSK(1:100)); hold on;
plot(RC_conv(1:100)); hold on;
plot(RCC_conv(1:100)); hold on;


