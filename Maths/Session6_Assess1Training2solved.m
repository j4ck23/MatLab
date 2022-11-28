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
% b - Plots marker5 against time, and then identify when the object is NOT moving. Use the filtered data.
% (hint: consider that it shoud not move both in x, y, and z coordinates).
% c - select and plot the first istant of the  filtered 3d data, and then select and plot a random instant. 
% Obtain the normal to the planes of these data, and then evaluate the angle between the two normals.
% Use the filtered data.

load('AssesTrainingData.mat') %this load into the workspace 2 matrices, with filtered and unfiltered (raw) data. The structure is reported in the text.

% ----------------- Insert your comments here for (a) ---------------------
% Data represent points in three dimensional space (x,y,z). As per suggestion, the plot can be done by using the plot3 function of matlab,
% who takes as input the x-values first, the y-values as second argument, and the z-values as third argument. Since the data are structure as
% mentioned, to plot all the points we have to go toward all the rows, all select the proper triplets of elements, such as
% plot3(x0(:,2),y0(:,3),z0(:,4)) for the marker 0, plot3(x1(:,5),y1(:,6),z1(:,7)) for the marker 1, and so on for all the coloms. This can be 
% obtained in a more efficient way with a for loop, which is indeed reported after. By using this for loop, the data to plot will be
% determined by the index i, and a fixed shift, i+1, i+2. To change the color, I used blue dots for the unfiltered data, and red lines for the
% filtered one.
% -------------------------------------------------------------------------

%This for loop helps you to navigate the matrix and to select the appropriate values to plot.
% Notice that the index i is moving from 2, to 19, with a step of 3. 
figure() %This creates a new figure
hold on %This keeps the current figure active, to plot again on it.
for i=2:3:19
    % ----------------- Insert your codes here for (a) ------------------------
    plot3(AssesTrainSDraw(:,i),AssesTrainSDraw(:,i+1),AssesTrainSDraw(:,i+2),'b.') %plot3 with dotted, blue markers
    plot3(AssesTrainSDfilt(:,i),AssesTrainSDfilt(:,i+1),AssesTrainSDfilt(:,i+2),'r-') %plot3 with solid red line
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
% The markers position can be considered as functions of the independent variable time, t, suc as x=f(t), y=f(t), z=f(t). Therefore, to plot
% the functions we use plot(time,x5). We can repeat the plot function with the hold on command for the other coordinates, or we can use a single
% plot with all the three variables. I used the latter option for compactness of the code. To find when the maker is not moving, we need to
% find when the object is not varying both x(t) and y(t): theorectically, also z(t) should not vary, but as per plot, the z(t) is a constant
% function and therefore the marker is not moving in the z-direction. To find when a function does not vary, we can use the derivative of 
% the function. If the function is in explicit form, or the explicit form can be retrieved, we could use the derivation rules, or support from
% external sources such as Wolfram alfa. In our specific case, an approximate of the derivative is already reported, and therefore we used
% directly the functions dx, dy. When BOTH dx and dy are zero, it means the object/marker is not moving. To find the zeros, I inspected the vector
% with a for loop, and I used two conditional instructions to check if dx(i) is equal to zero. Note that, due to numerical implementation,
% dx(i)==0 should be transformed into abs(dx(i))<0.01. In this way, two zeros are reported in output, with the disp command. To double check the
% correctness of the algorithm, I also plotted dx and dy with respect to the time.
% -------------------------------------------------------------------------
% ----------------- Insert your code here for (b) ---------------------
plot(time,x5,time,y5,time,z5)
legend('x','y','z')
xlabel('time')
ylabel('x, y, z')
title('Marker 1 over time')

for i=1:length(dx) % in this for, I am scanning the whole length of vector dx. Note that vector dy has the same length
    if abs(dx(i)) < 10^-2 % this first conditional instruction allow me to check if a zero is found for dx
        if abs(dy(i)) < 10^-2 % this second conditional instruction allow me to check if a zero is found for dx
            disp(['zero of dx and dy found at: ', num2str(time(i))]) % here I plot the index each time I found a zero for BOTH dx and dy, and output at screen.
        end
    end
end
% --- This is optional, to double check the results obtained
figure()
plot(time(2:end),dx)
hold on
plot(time(2:end),dy,'r')
grid on
xlabel('time')
ylabel('derivative dx and dy')
title('Derivatives')
legend('dx','dy')
% -------------------------------------------------------------------------

randomInstant = uint8(length(AssesTrainSDfilt)*rand()); %This select a random row, corresponding to a random instant of the data

% ----------------- Insert your comments here for (c) ---------------------
% For the first part, I used the same code above, but by selecting two
% specific instants: t=0, identified by the index i=1, and a random instant
% of time, identified by the random value randomInstant. By using them
% inside the matrix AssesTrainSDfile, I can select specific elements.
% For the second part, we know that cross product v3 = v1 x v2 creates a
% vector v3, orthogonal to both v1 and v2. Therefore, I can use the cross
% product by using two markers of the curve at the same instant, to obtain
% the normals. Once the normals are obtained, I used trigonomtery by
% considering the tangent as the opposite element, divided by the adjacent.
% The inverse of the tangent was provided, with conversion between radiants
% and degress, therefore allowing the visually inspect the result (I
% optionally plotted them).
% -------------------------------------------------------------------------
% ----------------- Insert your code here for (c) -------------------------
% Hint: You can copy the loop at point (a)
figure() %This creates a new figure
hold on %This keeps the current figure active, to plot again on it.
for i=2:3:19
    plot3(AssesTrainSDfilt(1,i),AssesTrainSDfilt(1,i+1),AssesTrainSDfilt(1,i+2),'ko') % first instant
    plot3(AssesTrainSDfilt(randomInstant,i),AssesTrainSDfilt(randomInstant,i+1),AssesTrainSDfilt(randomInstant,i+2),'rd') % random instant
end
grid on %This to plot a grid in the background of the figure
axis equal %This creates axis with equal dimensions
xlabel('x')
ylabel('y')
zlabel('z')
title('Markers at 0 and random instant')

% the cross product uses the built-in function cross, of Matlab
n1 = cross([AssesTrainSDfilt(1,5),AssesTrainSDfilt(1,6),AssesTrainSDfilt(1,7)],[AssesTrainSDfilt(1,8),AssesTrainSDfilt(1,9),AssesTrainSDfilt(1,10)]);
n1 = n1/norm(n1); % here I normalized the vector, to obtain length 1
% the cross product uses the built-in function cross, of Matlab
n2 = cross([AssesTrainSDfilt(randomInstant,5),AssesTrainSDfilt(randomInstant,6),AssesTrainSDfilt(randomInstant,7)],[AssesTrainSDfilt(randomInstant,8),AssesTrainSDfilt(randomInstant,9),AssesTrainSDfilt(randomInstant,10)]);
n2 = n2/norm(n2); % here I normalized the vector, to obtain length 1
plot3([0 n1(1)],[0 n1(2)],[0 n1(3)],'k-','LineWidth',2) % vectors are plotted with different colors, and by using a width of 2.
plot3([0 n2(1)],[0 n2(2)],[0 n2(3)],'r-','LineWidth',2)

tang = n2(1)/n2(2); % the tangent is obtained simply as the y-vaule over the x-value of the second normal
% -------------------------------------------------------------------------
% (hint: you can use the following line to obtain the angle, but you have
% to give the tangent).
ang = rad2deg(atan(tang));
disp(['The angle between the two normals is: ', num2str(ang),'deg'])
