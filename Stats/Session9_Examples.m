clear variables
close all
DataLoader;

figure()
histogram(weight,'BinLimits',[55 109],'BinWidth',1)
xlabel('classes [kg]')
ylabel('frequency')

m1 = mean(weight)
m2 = mode(weight)
m3 = median(weight)
s_samp = std(weight)
s_pop = std(weight,1)

figure()
histogram(weight,12,'BinLimits',[55 109],'BinWidth',5,'Normalization','probability')
xlabel('classes [kg]')
ylabel('frequency')

figure()
y = normpdf(-5:0.05:5,0,1);
hold on
plot(-5:0.05:5,y)
area = normcdf(-2.0,0,1)*100

figure()
plot(v1,v2,'o','MarkerSize',5,'LineWidth',2)
axis([0 20 0 15])
grid on
xlabel('v1')
ylabel('v2')
title('weekly activities posted (v1) and followers (v2) on Strava')

corMat = corr([v1' v2' v3'])