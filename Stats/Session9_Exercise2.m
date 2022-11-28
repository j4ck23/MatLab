close all
clear variables
% create and plot a standard normal curve, as per example in slide
x = -5:0.05:5;
x_mean = mean(x);
x_std = std(x);

y2 = normpdf(x,0,1);

figure()
plot(x,y2)

area = normpdf(2,0,1)
% verify 5 different values of z-, with respect to the table presented in
% BB