clear variables; close all;
%This example is related to the t-test for one sample

testedMileage = [40 44 46 41 43 44]';
legalMean = 45;

%This is a step by step example of matlab code, with comments and
%instructions. Note that, as you improve with Matlab, you can skip some
%steps and make your code more compact, or you can automate some processes.
%Most of this code was already discussed in the previous lectures, and you
%should reference to them if something is not clear; similarly, if you want
%to automate some parts with conditional or loop instructions, refer to
%previous lectures.

% Example: 
% a) Does the mean gas mileage for some population of cars drop below
% the legally required minimum averate of 45 mpg? (Example from the book,
% pag.235 and pag.240). Check it with 0.01 level of significance.
% b) check the value of t, compare with the table and comment what would
% happen if the significance was decreases to 0.05.

% - step1: use the t-test function with the vector and the mean. Select
% appropriate parameters
h001 = ttest(testedMileage,legalMean,'Alpha',0.01,'tail','left') % ttest function works similarly to ztest. In the first argument you specify the vector 
% you want to analyze, in the second argument the mean. Optional arguments
% are possible, as for the ztest. In this case, I am using a left tail
% since I want to verify that I am not dropping below a certain value.

% - step2: By using as a reference the slides or the book, compute the t-value.
% First, you have to create the squared version of the vector.
testedMileage_square = testedMileage.^2;
% - step3: find the sum of squares
ssx = sum(testedMileage_square)-sum(testedMileage)^2/length(testedMileage);
% - step4: find the sum of squares
s = sqrt(ssx/ (length(testedMileage)-1))
% - step5: obtain the estimated standard error
est_standarError = s/sqrt(length(testedMileage))
% - step6: calculate the t-value
t = ( mean(testedMileage) - legalMean )/est_standarError