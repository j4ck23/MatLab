clear variables
% Consider the following matrix
M = [9     1     2 ;    3     4     7 ;    8     5     6];

% Create a matrix of 9 rows and 2 colomn that reports the positions inside
% M of all the different numbers, from 1 to 9 (1 in the first row, 2 in the
% second row,)
% (Hint: you can use three nested for loops, and one if!)
val = [1,2,3,4,5,6,7,8,9];
p = [];

for k = 1:length(val) %for each value in order 1 to 9
    for i = 1:size(M,1:3) %for the columns of the matrix
        for j = 1:size(M,1:3) %for the rows of the matirix
            if val(k) == M(i,j) %if the value being looked for matches the current postion of the matrix
                p(k,:) = [k,[i,j]]; %store the value and output it
            end
        end
    end
end
disp(p)

dis = [];
for k = 1:length(val)
    try
        dis(k,2:3) = abs(p(k,2:3) - p(k+1,2:3));
        dis(k,1) = dis(k,1) + k;
    catch
        ("");
    end
end

distance_trav = [];
for b = 1:length(dis)
    temp_trav = sum(dis(b,2:3));
    distance_trav(b) = temp_trav; 
end

x = sum(dis(:,2));
y = sum(dis(:,3));



X = M(:);

A = nchoosek(X,3);

A_Distance = [];
for h = 1:length(A) %for each value in order 1 to 9
    for t = 1:length(A(h,:))
        for g = 1:size(M,1:3) %for the columns of the matrix
            for f = 1:size(M,1:3) %for the rows of the matirix
                if A(h,t) == M(g,f) %if the value being looked for matches the current postion of the matrix
                    A_Distance(h,t) = [g,f]; %store the value and output it
                end
            end
        end
    end
end
