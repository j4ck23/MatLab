clear variables; close all;

load DataAss2Ex2.mat

%DataSet1 reports the stride time (T), the stride height (z) and the body inclination (alfa)
% of crabs running inside and outside water. Each row is a specific crab. These 3 parameters, T, z and alfa, are the gait parameters. 
% Please note that matrix DataSet1 has the following structure:
% Odd columns are the data for OUTSIDE water running, EVEN columns are the
% data for INSIDE water running. Therefore: 
% Column 1 is T outside water, Column 2 is T inside water
% Column 3 is z outside water, Column 4 is z inside water
% Column 5 is alfa outside water, Column 6 is alfa inside water

%DataSet2 reports the speed (v) as the gravity decreases (i.e. the crab is more submerged in water). 
% Please note that matrix DataSet2 has the following structure, with respect to one factor varying (the gravity):
% Column 1 is speed outside water (full gravity), Column 2 is speed with half gravity, Column 3 is 
% speed for 1/3 of full gravity 

% The students are asked to use data collected during gait analysis of animals while running on different environments, and to develop a Matlab program to:
% a. Create tri-dimensional scatter plots to visualize the most relevant gait parameters, and comment on the clusters obtained (use DataSet1). [10pts]
% b. Use the appropriate test and/or analysis to evaluate if the animals are exhibiting different gaits or not. Please use and report as many descriptors as you consider relevant (use DataSet1). [10pts]
% c. By considering that each animal is contributing to only one measure, perform the appropriate analysis of variance (use DataSet2). [15pts]

% --- Insert your code with appropriate comments below in the correct spaces ---------
% --- description part (a) -------

% --------------------------------
% --- implementation part (a) ----
% please plot the data OUTISE water are red, and INSIDE water as blue
figure()
plot3(DataSet1(:,1),DataSet1(:,3),DataSet1(:,5),'ro')
hold on
plot3(DataSet1(:,2),DataSet1(:,4),DataSet1(:,6),'bo')
xlabel('X(T)')
ylabel('Y(Z)')
zlabel('Z(Alpha)')
legend('Outwater','Inwater')
% --------------------------------
% --------------------------------
% --- description part (b) -------
%for this we will use a dependant t test(student test) as each crab gave
%results for the test both in land and in water, this will allow us to see
%the benifits or drawbacks of different enviroment without having to worry
%about bias from different crabs being natually faster or slower allowing us to just see the impact the different
%enviroments have.

% we can tell the t score by looking at the t table with are degree of
% freedom which is stored as df in the workspace(This is the length of the
% dataset column - 1 for dependant samples), and with are level of
% significance, which in this case is 0.05, and we are doing a two tailed
% test to check if the crabs speed both fast and slow, so each extreme of
% the graph. In this case the Tscore with the level of significance of 0.05
% and the df of 24 is 2.064 so juding by the t scores we can see that the
% scores for T and A(Alfa) are statisticlly significant to this significant
% level.
% --------------------------------
% --- implementation part (b) ----
TResults = [];
Tests = ['T', 'Z', 'A'];
for i = 1:2:size(DataSet1,2)
    TResults = [TResults, ttest(DataSet1(:,i),DataSet1(:,i+1))];
end

for i = 1:length(TResults)
    if TResults(i) == 1
        disp(['The TTest for ',Tests(i),' Is equal to 1, Therefore we can reject the null Hypothesis'])
    else
        disp(['The TTest for ',Tests(i),' Is equal to 0, Therefore we can accept the null Hypothesis'])
    end
end
disp(' ')%Break in output

%Calculate the Tscore to double check matlabs findings using this formula
Tscore = [];
for i = 1:2:size(DataSet1,2)
    D = DataSet1(:,i) - DataSet1(:,i+1);
    dbar = sum(D)/length(D);
    ssd = sum(D.^2) - sum(D)^2/length(D);
    sd = sqrt(ssd/(length(D)-1));
    sdbar = sd/sqrt(length(D));
    tdependant = dbar/sdbar;
    Tscore = [Tscore, tdependant];
end

df = length(DataSet1) - 1;
disp('The T_Score is 2.064')

for i = 1:length(Tscore)
    disp(['The Tscore for ',Tests(i),' is ',num2str(Tscore(i))])
end
disp(' ')%Break in output
% -------------------------------
% --------------------------------
% --- description part (c) -------

% --------------------------------
% --- implementation part (c) ----
[p,aov,stats] = anova1(DataSet2);
disp(['The P Value is ',num2str(p),' or ',num2str(p*100),'%'])

fullg = DataSet2(:,1);
fullg = fullg.';
halfg = DataSet2(:,2);
halfg = halfg.';
thirdg = DataSet2(:,3);
thirdg = thirdg.';

%Check the F-Value:
between = size(DataSet2,2)-1;%Uses sd,2 to get the length of the columns as 1 is the length of rows
within = size(DataSet2,1)*size(DataSet2,2)-size(DataSet2,2);

%for ssbetween, start by suming the input vectors, raising them to the
%power of two then divinging by the length, do it for each vector.
%Next add the sum of all the vecotrs and raise to the power of 2, after divide by
%the lenghts added togather
ssBetween = sum(fullg)^2/length(fullg)+sum(halfg)^2/length(halfg)+sum(thirdg)^2/length(thirdg)...
    -(sum(fullg)+sum(halfg)+sum(thirdg))^2/(length(fullg)+length(halfg)+length(thirdg));

%sum a matrix of all the vecotrs raissed to .^2 the we take the sum of the
%vector to the power of 2 divde the length of the vector
ssWithin = sum([fullg.^2 halfg.^2 thirdg.^2]) - (sum(fullg)^2/length(fullg) + sum(halfg)^2/length(halfg) +...
    sum(thirdg)^2/length(thirdg));


MSwithin = ssWithin/within;
MSbetween = ssBetween/between;

F = MSbetween/MSwithin;
disp(['The F Score is ',num2str(F)])

F_Score = 3.89; %Find this by looking at the f table for the number of groups -1 and the number of instances - the number of groups
%In this case there are 3 groups so we want 2, and 15 instaces so 15-3 to
%gives us 12, so we need to look at 12,2

HSD = F_Score*sqrt(MSwithin/size(DataSet2,2));%find the HSD
disp(['The Honestly Significant Difference is ',num2str(HSD)])

res = multcompare(stats, 'alpha', 0.05, 'ctype','hsd');

if abs(mean(fullg)-mean(halfg))>HSD
    disp('Significative difference between group 0 and 1')
end

if abs(mean(fullg)-mean(thirdg))>HSD
    disp('Significative difference between group 0 and 2')
end

if abs(mean(halfg)-mean(thirdg))>HSD
    disp('Significative difference between group 0 and 3')
end
% --------------------------------
% --------------------------------