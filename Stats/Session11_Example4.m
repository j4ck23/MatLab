clear variables; close all;
%This example is related to the t-test for Two samples (Independent and
%dependent)

epo = [12 5 11 11 9 18]'; control = [7 3 4 6 3 13]'; %Independent samples

%This is a step by step example of matlab code, with comments and
%instructions. Note that, as you improve with Matlab, you can skip some
%steps and make your code more compact, or you can automate some processes.
%Most of this code was already discussed in the previous lectures, and you
%should reference to them if something is not clear; similarly, if you want
%to automate some parts with conditional or loop instructions, refer to
%previous lectures.

% Example: 
% Does the population mean endurance score for treatment (EPO) patients
% exceed that for control patients?

% - step1: run the function ttest2, which is the version of ttest for 2
% independent variables
hyp = ttest2(epo, control,'tail','right') %for 2 independent samples, you have to use ttest2. All the remaining parts are the same.

% - optional steps2: (verification of the function with the equations)
meanEpo = mean(epo); meanControl = mean(control);
ssEpo = sum(epo.^2)-sum(epo)^2/length(epo)
ssControl = sum(control.^2)-sum(control)^2/length(control)
sp_squared = (ssEpo+ssControl)/(length(control)+length(epo)-2)
s = sqrt(sp_squared/length(epo)+sp_squared/length(epo))
t = ((meanEpo-meanControl)-0)*1/s

% - step3: run the function with two vectors of the same length, do to
% dependent sample analysis
epoPaired = [12 5 11 11 9 18]'; controlPaired = [7 3 4 6 3 13]'; %Dependent samples
hypP = ttest(epo, control,'tail','right')