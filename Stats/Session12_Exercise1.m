close all
clear variables
% A psychologist tests wheter a series of workshops on assertive training
% increases eye contact initiated by shy college students in controlled
% interactions with strangers. A total of 32 subjects are randomly assigned
%, 8 to a group, to attend either zero, one, two or three workshop
%sessions. The results, expressed as a the number of eye contacts during a
%stantard observation period, are reported in Matrix EC. Note that column 1
%reportes eye contacts for zero sessions, column 2 for 1 sessions, etc.

zero = [1 0 0 2 3 4 2 1];
one = [2 1 2 4 4 6 3 3];
two = [4 2 3 6 7 8 5 5];
three = [7 1 6 9 10 12 8 7];

SD = [zero' one' two' three'];

[p,aov,stats] = anova1(SD);

between = size(SD,2)-1;%Uses sd,2 to get the length of the columns as 1 is the length of rows
within = size(SD,1)*size(SD,2)-size(SD,2);

%for ssbetween, start by suming the input vectors, raising them to the
%power of two then divinging by the length, do it for each vector.
%Next add the sum of all the vecotrs and raise to the power of 2, after divide by
%the lenghts added togather
ssBetween = sum(zero)^2/length(zero)+sum(one)^2/length(one)+sum(two)^2/length(two)+sum(three)^2/length(three)...
    -(sum(zero)+sum(one)+sum(two)+sum(three))^2/(length(zero)+length(one)+length(two)+length(three));

%sum a matrix of all the vecotrs raissed to .^2 the we take the sum of the
%vector to the power of 2 divde the length of the vector
ssWithin = sum([zero.^2 one.^2 two.^2 three.^2]) - (sum(zero)^2/length(zero) + sum(one)^2/length(one) +...
    sum(two)^2/length(two) + sum(three)^2/length(three));

MSwithin = ssWithin/within;
MSbetween = ssBetween/between;

F = MSbetween/MSwithin

res2 = multcompare(stats, 'alpha', 0.05, 'ctype','hsd');

q = 2.95; %Find this by looking at the f table for the number of groups -1 and the number of instances - the number of groups

HSD = q*sqrt(MSwithin/size(SD,2))

if abs(mean(zero)-mean(one))>HSD
    disp('Significative difference between group 0 and 1')
end

if abs(mean(zero)-mean(two))>HSD
    disp('Significative difference between group 0 and 2')
end

if abs(mean(zero)-mean(three))>HSD
    disp('Significative difference between group 0 and 3')
end

if abs(mean(one)-mean(two))>HSD
    disp('Significative difference between group 1 and 2')
end

if abs(mean(one)-mean(three))>HSD
    disp('Significative difference between group 1 and 3')
end

if abs(mean(two)-mean(three))>HSD
    disp('Significative difference between group 2 and 3')
end