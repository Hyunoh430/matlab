clear; clc;

music = load('44.1sound(ncs).mat');
a = music.signal;
samp = downsample(a, 10);

%%
s_max = max(samp);
s_min = min(samp);

y = linspace(s_min, s_max, 16);

for i=1:15
    partition(i) = (y(i) + y(i+1))/2;
end

[index, quants] = quantiz(samp, partition, y);

sound(a, 44100);

sound(quants, 4410);
