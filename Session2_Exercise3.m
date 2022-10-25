% Consider the presented array v, create all the permutations and select
% the position of the permutation t = [5 2 4 1 3]
v = 1:5;
p = perms(v); % This functions create all the permutations for vector "e". The output of the function is a matrix
t = [5 2 4 1 3];

% -------------- insert you code here ------------------------------ 
for i = 1:factorial(length(v))
    temp_vec = p(i,:) - t;
    temp_find = sum(abs(temp_vec));
    if temp_find == 0
        disp(p(i,:))
        disp(i)
    end
end
% -----------------------------------------------------------------
