% Week 1
clear; clc;

n = 2; % n = 2, 6, 10
M = 10^7;

uniforms = zeros(M,1);

for i=1:n
    uniforms = uniforms + rand(M,1);
end

[values, edges] = histcounts(uniforms);

mean_uniform = mean(uniforms);
std_uniform = std(uniforms);

pdf1 = (values / M) / (edges(2) - edges(1));

center_edges = zeros(length(edges)-1,1);
for k=1:length(edges)-1
    center_edges(k)=(edges(k)+edges(k+1))/2;
end

%% 
Z = (uniforms - mean(uniforms)) / std(uniforms);

[values2, edges2] = histcounts(Z);

pdf2 = (values2 / M) / (edges2(2)-edges2(1));

center_edges2 = zeros(length(edges2) -1, 1);
for k=1:length(edges2)-1
    center_edges2(k)=(edges2(k)+edges2(k+1))/2;
end



