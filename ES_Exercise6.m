%Type help sqrt, and read what the function does. Assign a value the the variable "a", assign the variable
%"b" the value of "a" to the power of 2, then use the function sqrt() to
%compute the square root of "b".

% ------- insert your code here
a = 4;
b = a.^2;
c = sqrt(b);
% -----------------------------

%Type help factorial. Compute the factorial of 5 by using the function
%factorial(), then use a for loop to create an algorithm to do the
%factorial of 5. (Hint: you can use the index of the for loop, and an
%auxilary variable that starts assigned to 1.


fact = 1;

for i = 1:5
    fact = fact*i;
end
disp(fact)