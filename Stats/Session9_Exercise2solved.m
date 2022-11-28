% create and plot a standard normal curve, as per example in slide
figure()
y = normpdf(-5:0.05:5,0,1);
hold on
plot(-5:0.05:5,y)

% verify 5 different values of z-, with respect to the table presented in
% BB
area1 = normcdf(-2.0,0,1)*100;
area2 = normcdf(-1.0,0,1)*100;
area3 = normcdf(0.0,0,1)*100;
area4 = normcdf(1.0,0,1)*100;
area5 = normcdf(2.0,0,1)*100;