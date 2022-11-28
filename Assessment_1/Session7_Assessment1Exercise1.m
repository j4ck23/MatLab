% Session7 - Assessment1 Exercise1

clear variables
close all

% ------------ Question Text --------------------------------------------
% Supposing that the robot has to pick 9 objects in the correct order (represented by the number in the matrix), 
% SEE FIGURE IN THE BRIEFING.
% The students have to develop a program that:
% a. Evaluates the length of the trajectory required to pick all the objects arranged as in figure. For this task, consider that the robot can move 
% only horizontally or vertically, and that the distance between two cells of the matrix is 0.1m. 
% (e.g. the distance from matrix cell (x1,y1) to (x1,y2) is 0.1m, from cell (x1,y2) to (x3,y3) is 0.3m, etc.) [10pts]
% There are arrangements of objects that minimize the distance the robot has to travel:
% b. Create a Matlab script that lists all the possible arrangements of objects, and then select an arrangement that minimizes the trajectory. [5pts]
% Supposing that we you are asked to pick, randomly, only three objects from the matrix:
% c. Create a Matlab script that list all the possible combinations, and then evaluate the distance to pick these subsets 
% of objects from the original arrangement in figure [10pts]

% ------------ Exercise Starts --------------------------------------------
% original matrix M, reported here for your convenience.
M  = [4 5 1; 9 3 2; 6 7 8]; % this is the matrix M as presented in the assessment briefing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (a) ---------------------

% ----------------- Insert your codes here for (a) ------------------------
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

Y_Traveled = sum(Distance(:,2)) %Sums the 2nd column
X_Traveled = sum(Distance(:,3))%Sums the thrid column

Total = (X_Traveled + Y_Traveled) / 10 % total distance traveled consdering 1 = 0.1 meters
% -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (b) ---------------------

% ----------------- Insert your codes here for (b) ------------------------
Mv = [4 5 1 9 3 2 6 7 8]; % this re-write M as a vector. If you want to use a different implementation, please update the values of Mv.
%I will use Mv as the best trajectory to look for as an example. if the
%best trajectory was 1,2,3... then we could change mv to that and the code
%will find it

Nums = M(:);%Matrix as a vector

A = perms(Nums); %all permutations for the nums vector %trajectory being looked for
factorial(length(Nums)); %This checks is to double check the amout of permuations we can have to cross check witht the len of A

for b = 1:factorial(length(Nums))%for the length of !Nums(all permuation possiblites)
    temp_vec = abs(A(b,:) - Mv);%abs to stop negatives, the take the current perm from the searched value
    trajec = sum(temp_vec); %total
    if trajec == 0 %if the perm has the losest trajectory possible/matches the disred value
        disp(A(b,:))
        disp(b)
    end
end

% -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (c) ---------------------

% ----------------- Insert your codes here for (c) ---------------------
X=M(:);%Converts matrix M to a vector

Combunations = nchoosek(X,3);
for Comb = 1:length(Combunations)
    com = [];
    for h =1:3
        for l = 1:9
            if Combunations(Comb,h) == Pos(l,1)
                com(h,:) = Pos(l,2:3);
            end
        end
    end
    Temp_Com = abs(com(1,:) - com(2,:));
    Temp_Com2 = abs(com(2,:) - com(3,:));
    Total_Com = Temp_Com + Temp_Com2;
    disp(['For Combination ', num2str(Combunations(Comb,:)), ' the total distance traveled over x and y is ' ,num2str(sum(Total_Com))])
end
% -------------------------------------------------------------------------
