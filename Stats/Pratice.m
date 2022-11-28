clear variables
close all
load examgrades.mat

movieVotes = [10 10 9 6 10 8 9 8 2 9 7 3 8 10 10 5 9 7 8 9 5 10 5 5 2 8 7];
b = betarnd(7,10,[100,1]);

[counts, bins] = histcounts(movieVotes);



figure()
histogram(movieVotes,10,Normalization="probability")
title('Movie')
hold on
histfit(movieVotes,10,"kernel")

x = -2:0.1:7;
y2 = normpdf(x,0,1);
y3 = binopdf(x,10,0.2);
figure()
plot(x,y2)

figure()
plot(x,y3)