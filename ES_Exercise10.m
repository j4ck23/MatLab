clear variables
close all
% Use the following domain of the function
x = -10:0.1:10;
% Create a function at your choice, among the ones saw in class, but use y1
% as name for the array
for i = 1:length(x)
% ---- insert your code here -----------------------
   y1(i) = 5*x(i)-1;
% --------------------------------------------------
end
% Plot the function, with appropriate labels and title
% ---- insert your code here -----------------------
plot(x,y1,'c.-')
grid on
xlabel('x')
ylabel('y1')
title('X VS Y1')
% --------------------------------------------------
% now create a second function, y2, different from the previous one
for i = 1:length(x)
% ---- insert your code here -----------------------
   y2(i) = 7+x(i)*2;
% --------------------------------------------------
end
% Plot the function, with appropriate labels and title, but use also the 
% additional command "hold on", before the plot() function 
hold on
% ---- insert your code here -----------------------
plot(x,y2,'g*:')
grid on
xlabel('x')
ylabel('y2')
title('X VS Y2')
% --------------------------------------------------
% Now remove the hold on command.
% What is the difference of using, or not using, the "hold on" command?



