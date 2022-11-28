%This Example is for ANOVA
clear variables
close all
%This is a step by step example of matlab code, with comments and
%instructions. Note that, as you improve with Matlab, you can skip some
%steps and make your code more compact, or you can automate some processes.
%Most of this code was already discussed in the previous lectures, and you
%should reference to them if something is not clear; similarly, if you want
%to automate some parts with conditional or loop instructions, refer to
%previous lectures.

% This is the example presented in class, where aggressive actions were
% recorded after 0, 24, and 48 hours of sleep deprivation

zero = [0 4 2];
twenty_four = [3 6 6];
forty_eight = [6 8 10];
% step0 - inspect the vectors
% step1 - prepare the matrix. ANOVA wants each sample in column, as for the
% ttest
SD = [zero' twenty_four' forty_eight'];
% step2 - execute the anova function for one factor, anova1. Use as output
% three agruments
[p2,aov2,stats2] = anova1(SD);

% steps (optional): verify the in-built matlab function with the proper
% expressions from the slides
df_between = size(SD,2)-1;
df_within = size(SD,1)*size(SD,2)-size(SD,2);
SSbetween = sum(zero)^2/length(zero)+sum(twenty_four)^2/length(twenty_four)+sum(forty_eight)^2/length(forty_eight)-...
            (sum(zero)+sum(twenty_four)+sum(forty_eight))^2/(length(zero)+length(twenty_four)+length(forty_eight));
SSwithin = sum([zero.^2 twenty_four.^2 forty_eight.^2])-...
    (sum(zero)^2/length(zero)+sum(twenty_four)^2/length(twenty_four)+sum(forty_eight)^2/length(forty_eight));
MSwithin = SSwithin/df_within;
MSbetween = SSbetween/df_between;
F = MSbetween/MSwithin

% step3 - execute the Tukey HSD test
res2 = multcompare(stats2, 'alpha', 0.05, 'ctype','hsd');

% steps (optional) - check the q for the Tukey's test
q = 4.76;
% steps (optional) - calculate the HSD value
HSD = q*sqrt(MSwithin/size(SD,2))
% step (optinal) - verify difference among group means
if abs(mean(zero)-mean(twenty_four))>HSD
    disp('Significative difference between group 0 and 24')
end

if abs(mean(zero)-mean(forty_eight))>HSD
    disp('Significative difference between group 0 and 48')
end

if abs(mean(forty_eight)-mean(twenty_four))>HSD
    disp('Significative difference between group 24 and 48')
end