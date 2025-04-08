%DC component 없게 고려
%NRZ-L 1일때 1 0일때 -1, NRZ-M 1일때만 전압을 바꿈, NRZ-S 0일때만 전압을 바꿈 // 연속되는 값들은 dc값느낌
%bandwidth가 1/T_b?
%Unipolar RZ 1일때 양전압이다 0으로 BipolarRZ 1일때 양전압이다 다음껄로(0이면 -V로) RZ-AMI 1이
%나올때마다 반대로 Unipolar, Bipolar: bandwidth 2/T_b / 
%Bi - pi - L (Manchester Coding) 1일땐 1에서 0, 0일땐 0에서 1 / Bi - pi - M 1일때 두번
%0일때 한번 반전 / Bi - pi - S 0일때 두번 반전, 1일때 한번 반전해준다
% Bi - phase - L은 dc component 감소, bandwidth 2/T_b

clear; clc;
x = randi([0,1],1,1000);
y = repmat(x, 100, 1);
a=y(:);
a = transpose(a);

%%
nrz_l = zeros(1,100000);
for i=1:1000
    if(x(i) == 1)
        nrz_l((i-1) * 100 + 1 : i * 100) = 1;
    else
        nrz_l((i-1) * 100 + 1 : i * 100) = -1;
    end
end

%%
bipolar_rz = zeros(1,100000);
for i=1:1000
    if(x(i) == 1)
        bipolar_rz( (i-1) * 100 + 1 : (i-1) * 100 + 50 ) = 1;
        bipolar_rz( (i - 1) * 100 + 50 + 1 : i * 100) = 0;
    else
        bipolar_rz( (i-1) * 100 + 1 : (i-1) * 100 + 50 ) = -1;
        bipolar_rz( (i - 1) * 100 + 50 + 1 : i * 100) = 0;        
    end
end

%%
manchester = zeros(1,100000);
for i = 1:1000
    if(x(i) == 1)
        manchester( (i - 1) * 100 + 1 : (i - 1) * 100 + 50 ) = 1;
        manchester( (i - 1) * 100 + 50 + 1 : i * 100 ) = -1;
    else
        manchester( (i - 1) * 100 + 1 : (i - 1) * 100 + 50 ) = -1;
        manchester( (i - 1) * 100 + 50 + 1 : i * 100 ) = 1;        
    end
end



%%
T_b = 1/1000;
T_sample = 1/(1000*100);
N = 1000;
t = [0:T_sample : N*T_b - T_sample];

%% 
figure;
subplot(4,1,1)
stem(x(1:10))
subplot(4,1,2)
plot(t,nrz_l);xlim([0,9*T_b])
subplot(4,1,3)
plot(t,bipolar_rz);xlim([0,9*T_b])
subplot(4,1,4)
plot(t,manchester);xlim([0,9*T_b])


%%
figure;
m_f = fftshift(fft(manchester));
n_f = fftshift(fft(nrz_l));
b_f = fftshift(fft(bipolar_rz));
f = -length(m_f) / 2 : length(m_f) / 2 -1;

plot(f,abs(n_f));xlim([-2000,2000])
hold on;
plot(f,abs(b_f));xlim([-2000,2000])
hold on;
plot(f,abs(m_f));xlim([-2000,2000])
hold off;
