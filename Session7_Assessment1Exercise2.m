% Session7 - Assessment1 Exercise2

clear variables
close all
% ------------ Question Text --------------------------------------------
%Some objects might be affected by external conditions, and a set of tri-dimensional coordinates 𝑝(𝑡)=(𝑥(𝑡),𝑦(𝑡),𝑧(𝑡)) 
% of one moving object will be presented to the students.
%a. The students have to implement a program to plot the tri-dimensional shape at the beginning of the movement, 𝑡=0, 
% and then to select the most appropriate function to model the physical object. [15pts]
%By considering that the object is oscillating, the robot can pick it only when the velocity is close to zero:
%b. The students have to implement a program to identify the moment, 𝑡𝑝, which is optimal to perform the picking action. [15pts]
%To evaluate if the robotic arm has enough workspace to collect the object, you can estimate the volume under the object while it moves:
% original matrix M, reported here for your convenience.
%c. The students have to write a program to calculate the volume under the object, during its full movement [10pts]

% ------------ Exercise Starts --------------------------------------------
load('Assessment1Data.mat') %this load into the workspace 2 matrices, with filtered and unfiltered (raw) data. The structure is reported in the text.
% Consider that the data structure is the  following: in the first column you have the time of the data, 
% then from column 2 to colum 19, you have the x, y and z position of 6 different markers, therefore this is a row of the matrix:
% [time x0 y0 z0 x1 y1 z1 x2 y2 z2 x3 y3 z3 x4 y4 z4 x5 y5 z5]
% note that marker x0,y0,z0 is the proximal one, and x5,y5,z5 is the distal one. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (a) ---------------------
% hyperbolic function, could be logarithmic but the slop is too gentle,
% commonm trait of as the x increases the y decreases.
% ----------------- Insert your codes here for (a) ------------------------
% you have to use SD matrix for this task
figure(1)
hold on
for i = 2:3:19
    plot3(SD(:,i),SD(:,i+1),SD(:,i+2),'.')
    plot3(SDfilt(:,i),SDfilt(:,i+1),SDfilt(:,i+2),'-')%plot the filtered data to support my answer.
end
grid on
xlabel('x')
ylabel('y')
zlabel('z')
hold off
% -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (b) ---------------------
%We won't use z here as it is a consitant value
% -------------------------------------------------------------------------
% You should use SDfilt for this part
time = SDfilt(:,1); %This extract the time, and assign it to a variable with an explicit name
x5 = SDfilt(:,17); %This extract the x of the marker 5, and assign it to a variable with an explicit name
y5 = SDfilt(:,18); %This extract the y of the marker 5, and assign it to a variable with an explicit name
z5 = SDfilt(:,19); %This extract the z of the marker 5, and assign it to a variable with an explicit name
dx = diff(x5); %This creates the derivative of the x of the marker5
dy = diff(y5); %This creates the derivative of the y of the marker5
% ----------------- Insert your codes here for (b) ------------------------
for p = 1:length(dx) %for every value in dx
    if abs(dx(p)) < 10^-2 %checks if a value close to zero is found, 10.^-2 is the same as 0.0100
        if abs(dy(p)) < 10^-2 %if a zero is found in x then checks if there is a zero at the matching postion in y
            disp(['Zero at: ',num2str(time(p)), ' Safe for robot to pick up'])
        end
    end
end

%Visual check for zeros found
figure(2)
hold on
plot(time(2:end),dx)
plot(time(2:end),dy)
title('Robot pickup')
xlabel('x')
ylabel('y')
legend('dx','dy')
grid on
hold off
% -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (c) ---------------------
% to do this i used the trapz function, this function caculates the
% integral by using the trapezoidal method, this involes breaking the area
% down in to trapezoids to compute the area, i then do this for all the
% columns minus 2,3 and 4 as they are all zeros.
% ----------------- Insert your codes here for (c) ---------------------
% Please note that an approximate solution is fine, if you motivate what you did. 
% You should use SDfilt for this part

for l = 5:3:19
    x = SDfilt(:,l);
    y = SDfilt(:,l+1);
    z = SDfilt(:,l+2);

    xdis = trapz(x)
    ydis = trapz(x)
    zdis = trapz(z)
end
% -------------------------------------------------------------------------