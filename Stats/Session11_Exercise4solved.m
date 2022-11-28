clear variables; close all;
%This example is related to the t-test for Two samples (Independent and
%dependent)

% Exercise (Independent): 
% A psychologist investigates the effect of instructions on the time
% required to solve a puzzle. Each of 20 volunteers is given the same
% puzzle to be solved as rapidly as possible. Subjects are randombly
% assigned, in equal numbers, to receive two different sets of instructions
% prior to the task. One group is told that the task is difficult, and the
% other group is told that the tast is easy. The score of each subject
% reflects the time in minutes to solve the puzzle. Use a t to test the
% null hypothesis at the .05 level of significance.

difficult = [5 20 7 23 30 24 9 8 20 12]'; easy = [13 6 6 5 3 6 10 20 9 12]'; %Independent samples

[hyp,p,~,stats] = ttest2(easy, difficult)

meanDiff = mean(difficult); meanEasy = mean(easy);
ssDiff = sum(difficult.^2)-sum(difficult)^2/length(difficult)
ssEasy = sum(easy.^2)-sum(easy)^2/length(easy)
sp_squared = (ssDiff+ssEasy)/(length(easy)+length(difficult)-2)
s = sqrt(sp_squared/length(difficult)+sp_squared/length(difficult))
t = ((meanDiff-meanEasy)-0)*1/s

% Exercise (Dependent): 
% An investigator tests a claim that vitamin C reduces the severity of
% common colds. To eliminate the variability due to different family
% environments, pairs of children from the same family are randomly
% assigned to either a treatment group that receives vitamic C or a control
% group that receives fake vitamin C. Each children estimates, on a
% 10-point scale, the severity of their colds during the school year. The
% following scores are obtained for ten pairs of children. Using t, test
% teh null hypothesis at the .05 level of significance.

CPaired = [2 5 7 0 3 7 4 5 1 3]'; CcontrolPaired = [3 4 9 3 5 7 6 8 2 5]'; %Dependent samples
[hypP,pP] = ttest(CPaired,CcontrolPaired,'tail','left')