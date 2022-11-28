clear variables
close all

load Session6data.mat %This instruction load data on the workspace.

% Two matrixes of data are imported: one is the RAW data (SDraw) that has to be
% used to identify the function. The second one, SDfilt, is the second one
% that shall be used to identify the instant of picking

% The data structure is the follwing: in the first column you have the time
% of the data, the from column 2 to colum 19, you have the x, y and z
% position of 6 different markers, therefore this is a row of the matrix:
% [time x0 y0 z0 x1 y1 z1 x2 y2 z2 x3 y3 z3 x4 y4 z4 x5 y5 z5]

% type: help plot3, to understand how plot3 works. Then, plot the 3d data
% of the marker, and rotate the plot to inspect them. Use the RAW data for
% this part.
% ------------ Insert your code here -----------------------------
figure()
hold on
for i=2:3:19
    plot3(SDraw(:,i),SDraw(:,i+1),SDraw(:,i+2),'.')
end
grid on
xlabel('x')
ylabel('y')
zlabel('z')
title('Markers in 3d')
% ----------------------------------------------------------------

% Now plot the marker position for the first istant. 
% (Hint: You can plot either in 2d or in 3d, as you prefer.)
% ------------ Insert your code here -----------------------------
figure()
hold on
for i=2:3:19
    plot3(SDraw(1,i),SDraw(1,i+1),SDraw(1,i+2),'o')
end
grid on
xlabel('x')
ylabel('y')
zlabel('z')
title('Markers in 3d at time 0')
% ----------------------------------------------------------------

% Inspect the plot of the first instant you just obtained. Plot, on top of
% the data, a function that can approximate the data. Manually tune the
% parameters of the function, until you are satisfied.
% ------------ Insert your code here -----------------------------
xf = 0:0.1:SDraw(1,5);
zf = -0.4*xf;
yf = zeros(1,length(xf));
plot3(xf,yf,zf)
% ----------------------------------------------------------------
