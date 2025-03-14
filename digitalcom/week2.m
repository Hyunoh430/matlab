%binordnd()
%4에서 도시화된 normalization된 average power variance 비교, autocoreelation
% Week 2
clear; clc;

n = 2; % n = 2, 6, 10
M = 10^6;

binomial = zeros(M,1);

for i=1:n
    binomial = binomial + binornd(100,1/2, [M,1]);
end

[values, edges] = histcounts(binomial);

mean_uniform = mean(binomial);
std_uniform = std(binomial);

pdf1 = (values / M) / (edges(2) - edges(1));

center_edges = zeros(length(edges)-1,1);
for k=1:length(edges)-1
    center_edges(k)=(edges(k)+edges(k+1))/2;
end

%% 
Z = (binomial - mean(binomial)) / std(binomial);

[values2, edges2] = histcounts(Z);

pdf2 = (values2 / M) / (edges2(2)-edges2(1));

center_edges2 = zeros(length(edges2) -1, 1);
for k=1:length(edges2)-1
    center_edges2(k)=(edges2(k)+edges2(k+1))/2;
end



