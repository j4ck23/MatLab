% Assign a value to the variable "a", and another value to the varibale "b" 
% --------- Insert your code here ----------------------
a = 2;
b = 3;
% ------------------------------------------------------
% Print a screen the values of "a" inside the conditional instruction.
% hint: you can see that the value of "a" is UPDATEd by the power operator. 
if a>0
% ------- insert your code here
    a = a^3;
% ------------------- 
else
% ------- insert your code here
    a = a^2;   
% -------------------
end

% Now insert another "if" condition inside the condition a>0 and print at
% screen a-b if this difference is greater than zero, or b-a otherwise
% (hint: the condition within the "if" syntax can be also the result of an operation,
% otherwise use an additional auxilary variable)