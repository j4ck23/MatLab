close all
clear variables
% Consider the vector "a", made of 3 elements
a = [1 2 3];
% --------------------------------------------------------------------
% Calculate the number of permutations possible with the vector "a".
% (hint: remember the factorial function of matlab)
% --------------------------------------------------------------------
% ---------------  insert your code here -----------------------------
factorial(a);
% --------------------------------------------------------------------
p = perms(a); % This functions create all the permutations for vector "a". The output of the function is a matrix

% inspect the matrix "p", by printing it at screen (in the command window). How many rows and how many colomn are there?

% You can access an element of an array with the array(index). In matrix it
% is the same, but you need two indexes:
% matrix(row_index, colomn_index)

%now extract the element (1,2), (3,3) and (2,1) of the matrix "p"
% ---------------  insert your code here -----------------------------
p(1,2);
p(3,3);
p(2,1);
% --------------------------------------------------------------------
% now, write and inspect the following selection p(:,1), p(2,:)
% ---------------  insert your code here -----------------------------
p(:,1);
p(2,:);
% ---------------  insert your code here -----------------------------
% eventually, subtract the array b = [1 1 1] to the third row of the matrix
% "p", and assign it to another array "c"
% ---------------  insert your code here -----------------------------
b = [1,1,1];
c = p(3,:) - b;
c1 = b - p(3,:);
% ---------------  insert your code here -----------------------------
