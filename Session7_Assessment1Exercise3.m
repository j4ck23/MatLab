% Session7 - Assessment1 Exercise3

clear variables
close all

% ------------ Question Text --------------------------------------------
% To calibrate its sensors, the robot needs to know the normal to the plane where the object is contained, when 𝑡=0, 
% and then align it with the plane (𝑧,𝑦). To do so:
% a. The students have to write a program to find the normal vector, and to plot it as an arrow. [10pts]
% b. The students have to write a program to find the angle which is needed to rotate the model at 𝑡=0, 
% until it will be contained within the plane (𝑧,𝑦) [10pts]
% c. The students have to rotate the model, to obtain a new collection of points which will be contained in the plane (𝑧,𝑦) [15pts]

% ------------ Exercise Starts --------------------------------------------
load('Assessment1Data.mat') %this load into the workspace 2 matrices, with filtered and unfiltered (raw) data. The structure is reported in the text.
% Consider that the data structure is the  following: in the first column you have the time of the data, 
% then from column 2 to colum 19, you have the x, y and z position of 6 different markers, therefore this is a row of the matrix:
% [time x0 y0 z0 x1 y1 z1 x2 y2 z2 x3 y3 z3 x4 y4 z4 x5 y5 z5]
% note that marker x0,y0,z0 is the proximal one, and x5,y5,z5 is the distal one. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (a) ---------------------
%For this example i picked 2 markers for x, y and z
% -------------------------------------------------------------------------
% ----------------- Insert your codes here for (a) ------------------------
% you have to use SDfilt matrix for this task. Assign the normal to the
% vector n1, so that it could be used into the function quiver3
v1 = cross([SDfilt(1,8),SDfilt(1,9),SDfilt(1,10)],[SDfilt(2,8),SDfilt(2,9),SDfilt(2,10)]);
n1 = v1/norm(v1);
% -------------------------------------------------------------------------
if exist('n1','var') 
    quiver3(0,0,0,n1(1),n1(2),n1(3));
else
    disp('You did not provide the variable n1, you misspelled it, or you used another name for the normal.')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (b) ---------------------

% -------------------------------------------------------------------------
% ----------------- Insert your codes here for (b) ------------------------
% (hint: you can use the tangent and store it into the variable tang. If you use anohter implmenentation
% you can change the code below accordingly
tang = n1(1)/n1(2);
% -------------------------------------------------------------------------
if exist('tang','var')
    %(hint: you can use the following line to obtain the angle, but you have to give the tangent into variable tang).
    ang = rad2deg(atan(tang)); %this use the inverse function of the tangent, and convert the angle in deg
    disp(['The angle between the two normals is: ', num2str(ang),'deg'])
else
    disp('You did not provide the variable tang, you misspelled it, or you used another name for the tangent.')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- Insert your comments here for (c) ---------------------

%-----------------------------------------------------------------------
if exist('ang','var')
    figure() 
    hold on 
    for j = 0:deg2rad(ang)/5:deg2rad(ang) %this spans the angle, from 0 to the angle you found above.
        % ----------------- Insert your codes here for (c) --------------------
        R = [ang cos(ang) -sin(ang); ang sin(ang) cos(ang);];%rotation matrix
        for i = 5:3:19
        x = SDfilt(:,i);
        y = SDfilt(:,i+1);
        z = SDfilt(:,i+2);

        X = x;
        Y = y*cos(ang) - z*sin(ang);
        Z = y*sin(ang) + z*cos(ang);
        hold on
        plot3(X,Y,Z)
        end
        % ---------------------------------------------------------------------
    end
    grid on %This to plot a grid in the background of the figure
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Rotated markers, for theta from 0 to ang')
else
    disp('You did not provide the variable ang, you misspelled it, or you used another name for the angle.')
end
% -------------------------------------------------------------------------

%Around y
%X = x*cos(theta) + z*sin(theta);
%Y = y;
%Z = z*cos(theta) - x*sin(theta);

%Around Z
%X = x*cos(theta) - y*sin(theta);
%Y = x*sin(theta) + y*cos(theta);
%Z = z;