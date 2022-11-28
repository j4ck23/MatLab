clear variables

M = [4  5   1;  9   3   2;  6   7   8]; %Matrix

Nums = M(:);%Matrix as a vector
Nums = sort(Nums);%Sorts the vector to start from 1

A = perms(Nums); %all permutations for the nums vector
disered = [1,2,4,5,8,9,3,7,6]; %trajectory being looked for

for i = 1:factorial(length(Nums))%for the length of !Nums(all permuation possiblites)
    temp_vec = abs(A(i,:) - disered);%abs to stop negatives, the take the current perm from the searched value
    trajec = sum(temp_vec); %total
    if trajec == 0 %if the perm has the losest trajectory possible/matches the disred value
        disp(A(i,:))
        disp(i)
    end
end
