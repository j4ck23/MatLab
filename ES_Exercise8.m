% Consider the two arrays
a = [1 3 5 7];
b = [0 -1 2 -4];
% Create a third array of 4 arbitrary values
% --------- Insert your code here ----------------------
c = [4 6 5 9];
% ------------------------------------------------------
% An element of an array, can be accessed with the () braket, with the
% sintax array(index). 
% Acces the fourth element of each array, and print them. (Hint: remember
% that the index of an array starts from 1, in Matlab).
% --------- Insert your code here ----------------------
disp(a(4))
disp(b(4))
disp(c(4))
% ------------------------------------------------------
% Consider the array d:
d = a + b;
% Type help length, and understand what it does.
% Create a for loop that prints all the elements of the array d, by using the function length().
% (hint: remember that in the for loop you can use expression or function,
% if their output is an integer)
% --------- Insert your code here ----------------------
for i = 1:length(d)
    disp(d(i))
end
% ------------------------------------------------------
% What did the sum to the array "d"?
