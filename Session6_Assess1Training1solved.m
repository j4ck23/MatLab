% Session6 - Mock-up Assessment 1

% This Mock-up Assessment presents how you are expected to complete the
% Assessment. The questions are different from the ones of the
% Assessment 2022/23, that you can find in your briefing.

% ------------- Here starts a Mock-up Assessment script -----------------------------------
clear all
close all

% Q1. Create a Matlab script that:
% a - outputs at screen the number of combination of the set v = [1 2 3 4 5 6 7 8 9 10]. In other words: how 
% many combinations exist for the vector v?
% b - creates all the possible combinations of a subset of 5 elements of v, and assign it to a matrix V.
% For this task, use the Matlab built-in function nchoosek(). Type "help
% nchoosek" to double check the usage.
% c - select randomly one row of V, Rrow, then find within the Matrix M the
% positions (row and column indexes) of the values V(Rrow,1), V(Rrow,3), V(Rrow,5). Note
% that more than one position it is possible!

v  = [1 2 3 4 5 6 7 8 9 10]; % this is the vector presented for the question

% ----------------- Insert your comments here for (a) ---------------------
% Combinations are unordered sets of different elements (i.e. sets % {a,b}={b,a} are the same combination). The total number of different
% combinations of a specific set of n elements, where p elements at a time % are taken, is obtained by the ratio n!/p!(n-p)!. 
% For the specific question (a), since a subset IS NOT specified, this means that we have the trivial answer 1.
% This is verified in two ways: with the following code, the factorial formula is implemented. on the other hand we know that, by
% defintion, factorial of 0 is equal to 1, and therefore, for p=n -->
% n!/p!(n-p)! = n!/n!(0)! = n!/n! = 1
% ----------------- Insert your codes here for (a) ------------------------
n = length(v); % to extract the number of elements of the set v
p = n;
numSets = factorial(n)/(factorial(n)*factorial(n-p)) % this line is without semicolum, to output the result at screen, in the command window
% -------------------------------------------------------------------------

% ----------------- Insert your comments here for (b) ---------------------
% The built-in function nchoosek is used to produce all the combinations on a set of n elements, taken k at the time. The syntax requires to input the
% set (in our case v) and the number of elements we want to select, in this case 5. The result will be stored in matrix V, with output suppresed to
% avoid 10!/5!(5!) prints at scree. The matrix V will have 10!/5!(5!), each one representing a specific combination. The effective result can be also
% double-checked with the equation at line 31: the number of rows of V (checked in the workspace or obtained with length(V)) should be equal to the 
% nSets obtained from line 31. This condition is checked with a conditional
% instruction.
% ----------------- Insert your codes here for (b) ------------------------
p = 5; % here the variable p is updated to the new value to select a subset of 5 elements
V = nchoosek(v,p); % built-in function of matlab. I assigned the output (sets of combination) to V
numSetsFive = factorial(n)/(factorial(p)*factorial(n-p));  % value used only to double check the results of nchoosek
if length(V)==numSetsFive % if the longest dimension of V is equal to the computed number of sets, nSetFive, then print that it is ok, otherwise report that something is wrong.
    disp('Everything is fine') % this display in the command windows a sentence
else
    disp('Something is wrong')
end
% -------------------------------------------------------------------------

M = uint8(10*rand(10,10)); % this line generates a 10x10 Matrix M, of random natural numbers within 1 and 10.
randomRow = uint8(length(V)*rand()); % this line generates one random natural numbers within 1 and and length(V).

% ----------------- Insert your comments here for (c) ---------------------
% V is a matrix with length(V) row, and 5 columns. To select a random row, I can use the function at line 55 of this script.
% Therefore, a random row vector will be: V(randomRow,:). Since to find, within the matrix M, only 3 values of the random row,
% question asks, I can use directly: V(randomRow,1) then V(randomRow,2) then V(randomRow,1), store them in 3 different variables, or in another
% smaller vector. The latter solution is used for compactness, and to use a third for loop, rather than additional if statements.
% Then, I will scan the whole matrix M and use a conditional statement to check if the two values are the same. Everytime I will find
% the value, I will print it at screen, by not using the double column. Note that more than value can be found, since the matrix is built
% randomly with possibility of repetition: is it therefore a sampling with replacement.
% ----------------- Insert your codes here for (c) ---------------------
valuesToFind = [V(randomRow,1) V(randomRow,3) V(randomRow,5)] %I am creating a vector of 3 elements, and printing the output at screen to check it.

for i=1:3 % With this loop I will select all the values that need to be found
    for j=1:10 % With this loop I will select all rows of matrix M
        for k=1:10 % With this loop I will select all columns of matrix M
            if M(j,k) == valuesToFind(i) % Here I check if the values are the same. If so, I print the value, and the position.
                disp(['value ', num2str(valuesToFind(i)), ' found in position: Row ',num2str(j), ' Col ',num2str(k)]);
            end
        end
    end
end
% -------------------------------------------------------------------------