close all
clear variables

followers = [3 2 6 4 7 9 11 14 18 15];
following = [1 1 3 2 5 5 6 8 14 11];
posts = [20 14 13 12 7 6 5 2 2 1];

figure()
plot(followers,following,'ro')
title('followers V following')
xlabel('followers')
ylabel('following')
lsline

figure()
plot(followers,posts,'bo')
title('followers V posts')
xlabel('followers')
ylabel('posts')
lsline

figure()
plot(posts,following,'go')
title('posts V following')
xlabel('posts')
ylabel('following')
lsline

co = polyfit(followers,following,1)
co1 = polyfit(followers,posts,1)
co2 = polyfit(posts,following,1)

corr1 = corr([followers' following'])
corr2 = corr([followers' posts'])
corr3 = corr([posts' following'])
corMat = corr([followers' following' posts'])

disp(['The properties of the line are ', num2str(co)])
disp(['The correlation of this is ', mat2str(corr1(:))])

disp('The correlation of this is:')
disp(corMat)