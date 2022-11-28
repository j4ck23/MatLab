clear variables; close all;
%This Example is for regression lines and correlation

%This is a step by step example of matlab code, with comments and
%instructions. Note that, as you improve with Matlab, you can skip some
%steps and make your code more compact, or you can automate some processes.
%Most of this code was already discussed in the previous lectures, and you
%should reference to them if something is not clear; similarly, if you want
%to automate some parts with conditional or loop instructions, refer to
%previous lectures.

% Example: a) Plot the scatter plot of the data in matrix V (each column is a
% different set of data). b) Check the correlation coefficient between the
% different columms, and plot the regression line. c) Replicate part b) by removing the outlier.  

load DataSession11Example1.mat
% - step0: inspect in the workspace the matrix V, to check its size
% - step1: extract from matrix V the different columns, and assign them to
% different vectors
v1 = V(:,1); %this command assigns to vector v1 all the values in column 1 of matrix V. The column (:) means "select all", therefore we are selecting all rows and column 1.
v2 = V(:,2);

% - step2: use plot function to draw v1 (in the horizontal axis) and v2 (in
% the vertical axis) as a scatter plot. Remember to select the appropriate marker, and to put
% a title to the plot, and label to the axis.
figure() %create a new figure
plot(v1,v2,'o'); %plot function wants the horizontal vector first, the vertical vector as second argument, and optional arguments for color and style.
xlabel('x-value')
ylabel('y-value')
title('Example Correlation and Regression')

% - step3: use corr function to obtain the correlation matrix.
CM = corr(V) %corr accepts as argument a matrix, and produce the correlation among the columns of the matrix, therefore always pay attention that the vectors are properly oriented.
% the semicolumns are removed to plot the output at screen

% - step4: use lsline to plot the regression line on the current figure
lsline %this command draws a regression line on the current figure

% - step5 (optional): extract the regression coefficients with the function
% ployfit
p = polyfit(v1,v2,1) %polyfit wants the two vectors as the first two arguments, then the degree of the fitting. For a line, this is 1.

% - step6: inspect the figure of the scatter plot. You can see that the
% outlier has v1=3, and v1=11;

% - step7: copy matrix V into V_filt, but for when V(i,1)=3, and V(i,2)=11;
V_filt = []; %This syntax creates an empty matrix
for i = 1:length(V) % in this way, the index i starts from 1 and goes to lenght(V)
    if V(i,1) ~= 3 && V(i,2) ~= 11 % this is a new condition, that check inequality! Notice that the && allows you to check that COND1 AND COND2 has to be true 
            V_filt = [V_filt; V(i,:)];
    end 
end

% - step8: repeat steps 1 to 4 withe the new vector V_filt
v1_filt=V_filt(:,1);
v2_filt=V_filt(:,2);
figure() %create a new figure
plot(v1_filt,v2_filt,'ro'); 
xlabel('x-value')
ylabel('y-value')
title('Example Correlation and Regression w/o outliers')
CM2 = corr(V_filt)
lsline