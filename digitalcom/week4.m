clear; clc;

music = load('44.1sound(ncs).mat');
a = music.signal;
samp = downsample(a, 4);

%%
out = compand(samp, 255, max(abs(samp)), 'mu/compressor');

%%
s_max = max(out);
s_min = min(out);

y = linspace(s_min, s_max, 16);

for i=1:15
    partition(i) = (y(i) + y(i+1))/2;
end

[index, quants] = quantiz(out, partition, y);

%%
out = compand(quants, 255, max(abs(samp)), 'mu/expander');
sound(out, 11025);




