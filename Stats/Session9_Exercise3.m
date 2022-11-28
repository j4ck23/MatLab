close all
clear variables

v1 = [3 2 6 4 7 9 11 14 18 15];
v2 = [1 1 3 2 5 5 6 8 14 11];
v3 = [20 14 13 12 7 6 5 2 2 1];

% plot a scatter plot for v1 and v2, for v1 and v3, and for v2 and v3
figure()
scatter(v1,v2)
title('V1,V2')
xlabel('V1')
ylabel('V2')

figure()
scatter(v1,v3)
title('V1,V3')
xlabel('V1')
ylabel('V3')

figure()
scatter(v2,v3)
title('V2,V3')
xlabel('V2')
ylabel('V3')

figure()
hold on 
scatter(v1,v2)
scatter(v2,v3)
scatter(v1,v3)
hold off

figure()
scatter3(v1,v2,v3)
xlabel('V1')
ylabel('V2')
zlabel('V3')
% then, create the correlation matrix
v4 = [v1;v2;v3];
corrcoef(v4)

corr([v1' v2' v3'])