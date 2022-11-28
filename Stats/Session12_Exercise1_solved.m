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

EC = [zero' one' two' three'];

[p,tbl,stats] = anova1(EC);
results = multcompare(stats, 'alpha', 0.05, 'ctype','hsd');

