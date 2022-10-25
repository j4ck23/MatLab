clear variables
% Consider the vector "a", made of 5 elements
a = [1 2 3 4 5];
% Create all the permuations of "a", and assign them to the matrix A.
% (hint: remember the matlab function perms())
% --------------------------------------------------------------------
% ---------------  insert your code here -----------------------------
A = perms(a);
% --------------------------------------------------------------------
% Select the fourth row of A, subtract the array "b = [1 3 4 2 5]", assign the result to the array
% "c" and print it  
% ---------------  insert your code here -----------------------------
b = [1,3,4,2,5];
c = A(4,:) - b;
% --------------------------------------------------------------------
% type "help sum", understand what it does, then use if on the vector c
% ---------------  insert your code here -----------------------------
sum(c);
% --------------------------------------------------------------------
% now type "help abs", understand what it does, then use if on the vector c
% to UPDATE the same vector, and calculate the sum again
% ---------------  insert your code here -----------------------------
c = abs(c);
sum(c);
% --------------------------------------------------------------------
% You have now all the elements to find the raw of a specific arrangment of
% elements, for example the vector "b" above, within the matrix A! 
% What can you do? Think about that, by using as hint the following code:

for i=1:factorial(length(a)) %for the length of vector a to the factorial, so 120 in this case
    tmp_vect = abs(A(i,:) - b); %stores in a temp var the abosulte val of matrix A for the current position of the loop take vector b
    % ---------------  insert your code here -----------------------------
    sum_vect = sum(tmp_vect); %sums the temp vat
    if sum_vect == 0 %if the um is eqaul to 0
        disp(A(i,:))
        disp(i) %best route found, display the route and is postion in the marix
    end
    
    % --------------------------------------------------------------------
end