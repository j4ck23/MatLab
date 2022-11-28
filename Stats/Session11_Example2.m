clear variables; close all;
%This Example is for ztest

%This is a step by step example of matlab code, with comments and
%instructions. Note that, as you improve with Matlab, you can skip some
%steps and make your code more compact, or you can automate some processes.
%Most of this code was already discussed in the previous lectures, and you
%should reference to them if something is not clear; similarly, if you want
%to automate some parts with conditional or loop instructions, refer to
%previous lectures.

% Example: a) Test if the results of the a clinical value in matrix V (each column is a
% different sample) are within the healty conditions Vpop_mean, Vstd .
% b) Calculate the mean of each sample, and verify the output in a)
% manually
% c) Check if the results of a treatment, expressed in the vector v_treats increases significantly the test result. 
% Express, for each evaluation, two levels of significance (0.01 and 0.05). 

load DataSession11Example2

% - step0: inspect in the workspace the matrix V, to check its size
% - step1: extract from matrix V the different columns, and assign them to
% different vectors
v1 = V(:,1); %this command assigns to vector v1 all the values in column 1 of matrix V. The column (:) means "select all", therefore we are selecting all rows and column 1.
v2 = V(:,2);
v3 = V(:,3);

% - step2: use the function ztest for the specific vector.
h005_v1 = ztest(v1,Vpop_mean,Vstd) % this is the function for the z-test. It uses as first input the vector you want to test if belongs to the distribution defined by
% the mean value (second argument) and the standard deviation (third
% argument). Additional input additional arguments specify if you want to change some characteristics of the test, for example the sensitivity ('Alpha'). The 
% default level of significance is 0.05 (5%), or if you want a one-tail or
% double tail tests. If the output of the function ztest is 1, the null
% hypothesis can be reject, otherwise it should be retained.

% - step3: use the function ztest for the same vector as above, but with a different level of significance.
h001_v1 = ztest(v1,Vpop_mean,Vstd,'Alpha',0.01)
% - step4: replicate the analysis for the other vectors
h005_v2 = ztest(v2,Vpop_mean,Vstd)
h001_v2 = ztest(v2,Vpop_mean,Vstd,'Alpha',0.01)
h005_v3 = ztest(v3,Vpop_mean,Vstd)
h001_v3 = ztest(v3,Vpop_mean,Vstd,'Alpha',0.01)

% - step5: calculate the mean of the vector v1
meanV1 = mean(v1);
% - step6: calculate the z-test value, as per formula in Slide14
z1 = (meanV1 - Vpop_mean)/( Vstd/sqrt( length(v1))) 
% - step7: check the critical z in the table to reject or retain the null
% hypothesis with the two levels of specificity.

% - step8: replicate for all the vectors
meanV2 = mean(v2)
z2 = (meanV2 - Vpop_mean)/( Vstd/sqrt( length(v2)))
meanV3 = mean(v3)
z3 = (meanV3 - Vpop_mean)/( Vstd/sqrt( length(v3)))

% - step9: execute the ztest with the option: 'tail','right'
h005_vt = ztest(v_treat,Vpop_mean,Vstd,'Tail','right')
h001_vt = ztest(v_treat,Vpop_mean,Vstd,'Alpha',0.01,'Tail','right')