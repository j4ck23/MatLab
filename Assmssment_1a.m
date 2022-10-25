clear variables

M = [4  5   1;  9   3   2;  6   7   8]; %Matrix

Nums = M(:);%Matrix as a vector
Nums = sort(Nums);%Sorts the vector to start from 1

Pos = []; %Matrix positions

for i = 1:length(Nums) %For the length of the numbers in the vector/being searched for
    for j = 1:size(M,1:3) %for the columns in the matrix 
        for f = 1:size(M,1:3) %for the rows in the matrix
            if Nums(i) == M(j,f) %Check if the number in vector position matches the number in the matrix postion
                Pos(i,:) = [i,[j,f]]; %Adds the number and its position to Pos
            end
        end
    end
end

Distance = [];
for k = 1:length(Pos) - 1
    try %While k+1 exists
    Temp_Dis = abs(Pos(k,2:3) - Pos(k+1,2:3));% Tales the current pos from the next on in the list, Absoulte values as distance cannot be negative
    Distance(k,:) = [k,Temp_Dis];
    catch
        ("Every Pos Calced");
    end
end

Y_Traveled = sum(Distance(:,2)); %Sums the 2nd column
X_Traveled = sum(Distance(:,3));%Sums the thrid column

Total = (X_Traveled + Y_Traveled) / 10; % total distance traveled consdering 1 = 0.1 meters

X=M(:);

A = nchoosek(X,3);
for com = 1:length(A)
    test_case = [];
    for h =1:3
        for l = 1:9
            if A(com,h) == Pos(l,1)
                test_case(h,:) = Pos(l,2:3);
            end
        end
    end
    Temp_Com = abs(test_case(1,:) - test_case(2,:));
    Temp_Com2 = abs(test_case(2,:) - test_case(3,:));
    Total_Com = Temp_Com + Temp_Com2;
    disp(['For Combination ', num2str(A(com,:)), ' the total distance traveled over x and y is ' ,num2str(sum(Total_Com))])
end