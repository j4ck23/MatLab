clear variables
close all
% Another way to create an array is to define a start value, an incremental
% step, and a final value with the sintax number0:number1:number2
x = -10:0.25:10;

% Consider the mathematical function y = 3x-6, and the for loop below:
for i = 1:length(x)
    y(i) = 3*x(i)-6;
end
% Can you understand what the for loop did? 
% Print and compare the lenght of vector x and vector y.
% ---- insert your code here -----------------------
disp(length(x))
disp(length(y))
% --------------------------------------------------
% type help plot. Read it carefully, with specific care to the formatting
% type. Modify the following part of the code to:
% - Change the color, marker, and type of lines (you can also remover
% markers, or lines)
% - Modify the title
% - Modify the axis name
plot(x,y,'gh--')
grid on
xlabel('X Vector')
ylabel('Y Vector')
title('X V Y')



