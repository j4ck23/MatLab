% Assign a value to the variable "a", and another value to the varibale "b" 
% --------- Insert your code here ----------------------
a = -5;
b = 2;
% ------------------------------------------------------
% Consider the flow chart for conditional instructions:
% use the conditional instructions here to assign to variable "c" the value "a" to the power of 2, 
% if "a" is negative, or "a" to the power of 3, if "a" is negative. 
if a>0
% ------- insert your code here
    c = a.^2;
% ------------------- 
else
% ------- insert your code here
    c = a.^3;
% -------------------
if a-b > 0
    disp(a-b)
else
    disp(b-a)
end
disp(c)
end
% Now insert another "if" condition inside the condition a>0 and print at
% screen a-b if this difference is greater than zero, or b-a otherwise
% (hint: the condition within the "if" syntax can be also the result of an operation,
% otherwise you can use an additional auxilary variable)