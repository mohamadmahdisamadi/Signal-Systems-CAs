clc;
close all;
clearvars;

y = cell2mat(struct2cell(load("received_p12.mat")));
for sigma=0:0.01:2
    fprintf("simulating with sigma %2f\n", sigma);
    p13(y + sigma*randn(1,length(y)));
    fprintf("\n");
end
