clear variables; close all;
%This exercise is related to the t-test for one sample

lenddays = [21 15 12 24 20 21 13 16];
averagelend = 21;

% Exercise: A library system lends books for periods of 21 days. This
% policy is being reevaluated in view of a possible new loan period that
% could be either longer or shorter than 21 days. To aid in making this
% decision, book-lending records were consulted to determine the loan
% periods actually used by patrons. A random sample of eight records
% revealed the following loan periods in days: 21, 15, 12, 24, 20, 21, 13
% and 16. Test the null hypothesis with t, using the .05 level of
% significance.

hypt = ttest(lenddays,averagelend)
%Takes input of all the sample lend days, with the sample average lend day
%Does not include any extra arugemts as it wants to see if users lend books
%for longer or shoter thean the average and the default sig level for ttest
%is 5%

%Sum of sqaures
sumofsq = sum(lenddays.^2) - sum(lenddays)^2/length(lenddays);

%Squreroot
s = sqrt(sumofsq/ (length(lenddays)-1))

%Estimated standard error.
est_standarError = s/sqrt(length(lenddays))

%t-value
t = (mean(lenddays) - averagelend)/est_standarError%comapre with t table to back up hyptohsis test
