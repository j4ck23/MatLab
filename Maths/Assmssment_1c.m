clear variables
M = [4  5   1;  9   3   2;  6   7   8];


X = M(:);%Stores M matrix as a vector

A = nchoosek(X,3); %Combinations for three radom numbers from the matrix

A_DistanceX1 = [];
A_DistanceX2 = [];
A_DistanceX3 = [];
for h = 1:length(A) %for each value in order 1 to 9
    for g = 1:size(M,1:3) %for the columns of the matrix
        for f = 1:size(M,1:3) %for the rows of the matirix
            if A(h,1) == M(g,f) %if the value being looked for matches the current postion of the matrix
               A_DistanceX1(h,:) = [g,f];%store the value and output it
            end
            if A(h,2) == M(g,f) %if the value being looked for matches the current postion of the matrix
               A_DistanceX2(h,:) = [g,f];%store the value and output it
            end
            if A(h,3) == M(g,f) %if the value being looked for matches the current postion of the matrix
               A_DistanceX3(h,:) = [g,f];%store the value and output it
            end
        end
    end
end

A_Distance = [A_DistanceX1, A_DistanceX2, A_DistanceX3]; %Combines the postions of the three selected nums

Distance = [];
for i = 1:length(A)
    try
        Temp = abs(A_Distance(i,1:2) - A_Distance(i,3:4)); %Distance between postion 1 and 2
        Temp2 = abs(A_Distance(i,3:4) - A_Distance(i,5:6)); %distance of 2 and 3
        Distance(i,:) = [i, Temp, Temp2]; %Adds to distance
    catch
        ("");
    end
end

Total = [];
for l = 1:length(Distance)
    temp_Total = sum(Distance(l,2:5));
    Total(l,:) = [l,temp_Total]; %Sums the distance traveled for each combination.
end
