clear variables; close all;
%This exercise is for regression lines and correlation

load DataSession11Exercise1.mat

% Exercise: a) Plot the scatter plot of the data in matrix V (each column is a
% different set of data). b) Check the correlation coefficient between the
% different columms, and plot the regression line. c) Replicate part b) by removing the outlier.  

v1 = V(:,1);
v2 = V(:,2);

figure()
plot(v1,v2,'o')
xlabel('x')
ylabel('y')
title('With outliers')

corr1 = corr(V)

pf1 = polyfit(v1,v2,1)
lsline

V_filt = [];
v_anom = [];
for i = 1:length(V)
    if V(i,1) == 40 && V(i,2) == 5 %Used == to check when x and y are equal to target
         v_anom = [v_anom; V(i,:)];%Check to see the right anom was removed
    elseif V(i,1) == 1 && V(i,2) == 98
         v_anom = [v_anom; V(i,:)];%Check to see the right anom was removed
    else
         V_filt = [V_filt; V(i,:)];
    end
end

%Perferd method above, when using ~= it would remove points when x or y
%were equal to traget

v1_filt=V_filt(:,1);
v2_filt=V_filt(:,2);
figure() %create a new figure
plot(v1_filt,v2_filt,'ro'); 
xlabel('x-value')
ylabel('y-value')
title('Example Correlation and Regression w/o outliers')
lsline
hold on

corr2 = corr(V_filt)

pf2 = polyfit(v1_filt,v2_filt,1)