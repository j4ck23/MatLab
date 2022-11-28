clear variables; close all;
%This exercise is related to the t-test for one sample

% Exercise: A library system lends books for periods of 21 days. This
% policy is being reevaluated in view of a possible new loan period that
% could be either longer or shorter than 21 days. To aid in making this
% decision, book-lending records were consulted to determine the loan
% periods actually used by patrons. A random sample of eight records
% revealed the following loan periods in days: 21, 15, 12, 24, 20, 21, 13
% and 16. Test the null hypothesis with t, using the .05 level of
% significance.

lm = 21;
lp = [21 15 12 24 20 21 13];

h005 = ttest(lp,lm)
