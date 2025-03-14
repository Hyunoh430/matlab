clear;
clc;

n = 50;
M = 10^6;

X = zeros(M,1);
for i = 1:n
    X = X + binornd(2,1/2,[M,1]);
end



[values, edges] = histcounts(X, 'BinMethod', 'integers');

for i = 1:length(edges)-1
    centedges(i) = (edges(i) + edges(i+1))/2;
end

figure;
plot(centedges, values)

pdf = values/M/(edges(2) - edges(1));

figure;
plot(centedges, pdf)

%%
Xmean = mean(X);
Xstd = std(X);
Z = (X-Xmean)/Xstd;


[values_z, edges_z] = histcounts(Z, (edges-Xmean)/Xstd);
for i = 1:length(edges_z)-1
    centedges_z(i) = (edges_z(i)+edges_z(i+1))/2;
end
pdf_z = values_z/M/(edges_z(2)-edges_z(1));

figure;
plot(centedges_z, pdf_z)
hold on
plot(centedges_z, normpdf(centedges_z,0,1))

%% average power&variance
AP = mean(Z.^2)
V = var(Z)

%%
[c,lags] = xcorr(Z, "unbiased");

figure;
plot(lags, c);

