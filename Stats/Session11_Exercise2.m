clear variables; close all;
%This exercise is for regression lines and correlation

load DataSession11Exercise2.mat

% Example: a) Test if the results of the a clinical value in matrix M (each column is a
% different sample) are within the healty conditions Mpop_mean, Mstd .
% b) Calculate the mean of each sample, and verify the output in a) manually
means = [];
result = [];
for i = 1:length(M)
    result(i,:) = [i,ztest(M(:,i),Mpop_mean,Mstd)];
    means(i,:) = [i,mean(M(:,i))];
end

zscores = [];
for j = 1:length(means)
    zscores(j,:) = [j,(means(j,2) - Mpop_mean)/( Mstd/sqrt( length(M(:,j))))];
end