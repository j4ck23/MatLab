% Session6 - Mock-up Assessment 1 Training 2

% This Mock-up Assessment presents how you are expected to complete the
% Assessment. The questions are different from the ones of the
% Assessment 2022/23, that you can find in your briefing.

% ------------- Here starts a Mock-up Assessment script -----------------------------------
clear variables
close all

% Q2. Create a Matlab script that:
% a - plots the 3d data provided, filtered and unfiltered, with different colors. Consider that the data structure is the 
% following: in the first column you have the time of the data, the from column 2 to colum 19, you have the x, y and z
% position of 6 different markers, therefore this is a row of the matrix:
% [time x0 y0 z0 x1 y1 z1 x2 y2 z2 x3 y3 z3 x4 y4 z4 x5 y5 z5]
% (hint: remember how plot3 works)
% b - plots marker5 against time, and then identify when the object is NOT moving. Use the filtered data.
% (hint: consider that it shoud not move both in x, y, and z coordinates).
% c - selects and plots the first istant of the filtered 3d data, and then it selects and plots a random instant. 
% Obtain the normal to the planes of these data, and then evaluate the angle between the two normals.
% Use the filtered data.

load('AssesTrainingData.mat') %this load into the workspace 2 matrices, with filtered and unfiltered (raw) data. The structure is reported in the text.

% ----------------- Insert your comments here for (a) ---------------------

% -------------------------------------------------------------------------

%This for loop helps you to navigate the matrix and to select the appropriate values to plot.
% Notice that the index i is moving from 2, to 19, with a step of 3. 
figure() %This creates a new figure
hold on %This keeps the current figure active, to plot again on it.
for i=2:3:19
    % ----------------- Insert your codes here for (a) ------------------------

    % -------------------------------------------------------------------------
end
grid on %This to plot a grid in the background of the figure.
axis equal %This creates axis with equal dimensions
xlabel('x')
ylabel('y')
zlabel('z')
title('Markers in 3d')

figure()
time = AssesTrainSDfilt(:,1); %This extract the time, and assign it to a variable with an explicit name
x5 = AssesTrainSDfilt(:,17); %This extract the x of the marker 5, and assign it to a variable with an explicit name
y5 = AssesTrainSDfilt(:,18); %This extract the y of the marker 5, and assign it to a variable with an explicit name
z5 = AssesTrainSDfilt(:,19); %This extract the z of the marker 5, and assign it to a variable with an explicit name

dx = diff(x5); %This creates the derivative of the x of the marker5
dy = diff(y5); %This creates the derivative of the y of the marker5
% ----------------- Insert your comments here for (b) ---------------------

% -------------------------------------------------------------------------
% ----------------- Insert your code here for (b) ---------------------

% -------------------------------------------------------------------------

randomInstant = uint8(length(AssesTrainSDfilt)*rand()); %This selects a random row, corresponding to a random instant of the data

% ----------------- Insert your comments here for (c) ---------------------

% -------------------------------------------------------------------------
% ----------------- Insert your code here for (c) -------------------------
% Hint: You can copy the loop at point (a)

% ----------------- Insert your code here for (c) -------------------------
% Hint: you can use the following line to obtain the angle, but you have
% to provide the tangent, within a variable called "tang".
ang = rad2deg(atan(tang));
disp(['The angle between the two normals is: ', num2str(ang),'deg'])
