function l = nSets(vector1,vector2,vector3)
    a1 = factorial(length(vector1(1:6)));
    a2 = factorial(abs(vector2));
    a3 = nchoosek(vector3,3);

    l = a1
    l = a2
    l = a3
end
