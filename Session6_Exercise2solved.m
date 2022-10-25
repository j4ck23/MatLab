clear variables
close all

load Session6data.mat %This instruction load data on the workspace.

% Two matrixes of data are imported: one is the RAW data (SDraw) that has to be
% used to identify the function. The second one, SDfilt, is the second one
% that shall be used to identify the instant of picking.

% The data structure is the follwing: in the first column you have the time
% of the data, the from column 2 to colum 19, you have the x, y and z
% position of 6 different markers, therefore this is a row of the matrix:
% [time x0 y0 z0 x1 y1 z1 x2 y2 z2 x3 y3 z3 x4 y4 z4 x5 y5 z5]

% plot the data of one of the marker over time.
% ------------ Insert your code here -----------------------------
time = SDfilt(:,1);
x = SDfilt(:,5);
y = SDfilt(:,6);
z = SDfilt(:,7);
plot(time,x,time,y,time,z)
legend('x','y','z')
xlabel('time')
ylabel('x, y, z')
title('Marker 1 over time')
% ----------------------------------------------------------------

% Type: help diff, and understand what it does. Use the diff function to
% create an approximante derivative of one of the marker over time.
% ------------ Insert your code here -----------------------------
dx = diff(x);
dy = diff(y);
% ----------------------------------------------------------------

% Plot the derivative function, and inspect its behavior with respect to
% the not derived function.
% ------------ Insert your code here -----------------------------
figure()
plot(time(2:end),dx)
hold on
plot(time(2:end),x(2:end),'r')
grid on
legend('dx','x')
% ----------------------------------------------------------------