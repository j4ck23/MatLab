% Create a vector "v1" by adding elemnt by element (element-wise) vetors
% "a" and "b", and then concatenating vector "c".
% Create a vector "v2" by multiplying vectors "a" and "b", element-wise.
% Create a last vector "e" by elevating each element of "a" at the power of 2.
a = [12 19 16];
b = [10 -2 -1];
c = [1 3 5 1 9 8 10 4 14];

% ------------------ Insert your code here --------------------------------
v1 = [a+b,c];
v2 = a.*b;
e = a.^2;
% -------------------------------------------------------------------------

% Create a function nSets that takes as input the vectors, and it returns: 
% - for the vector 1 (v1) the number of permutation, by selecting only 6 elements
% - for the vetor 2 (v2), the total number of permutation
% - for the vector 3 (v3), the combinations for all, and then for only 10 elements

% Suggestions: to double-check your code, you can also use the example
% presente during the lectures

% ------------------ Insert your code here to produce the ouput of the
% fucntion ----------------------------------------------------------------
function output = nSets(vector1,vector2,vector3)
    a1 = factorial(length(vector1(1:6)));
    a2 = factorial(vector2);
    a3 = nchoosek(vector3);
    a4 = nchoosek(vector3,10);

    output = a1
end
% -------------------------------------------------------------------------