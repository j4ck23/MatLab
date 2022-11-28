% Consider the following matrix
M = [9     1     2 ;    3     4     7 ;    8     5     6];
M = [1     2     3 ;    6     5     4 ;    7     8     9];
% Create a matrix of 9 rows and 2 colomn that reports the positions inside
% M of all the different numbers, from 1 to 9 (1 in the first row, 2 in the
% second row,)
% (Hint: you can use three nested for loops, and one if!)
P = [];
for i = 1:9
    for row=1:3
        for col=1:3
            if M(row,col)==i
                P = [P; [row col]];
            end
        end
    end
end
P
tot_dist_x = 0;
tot_dist_y = 0;
for j=1:length(P)-1
    tot_dist_x = tot_dist_x + abs(P(j+1,1)-P(j,1));
    tot_dist_y = tot_dist_y + abs(P(j+1,2)-P(j,2));
end
tot_dist = tot_dist_y + tot_dist_x
