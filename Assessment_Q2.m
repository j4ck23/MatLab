load Session6data.mat 
% ------------ Insert your comment here --------------------------
% this task is pratice for 2(a)

% This task asks to plot tri-demensional starting a t=0 and then define the
% approate function, to do this i used a for loop to loop throught the file
% of data to plot increasing the i value by 3 each time to cover the x y
% and z values, i used i+1 and i+2 to point to the corresopinging y z and when
% i was equal to the x posiiton, then i ploted the values using plot3 to allow a 3 dimesnion
% view of the plot. if we look at the reults of the plot we can see the
% plots can be classified as an inverse function using formula f(x) =
% 3(x)+2. we can also deteremine this by the shape of the plots, ruling out
% a linear graph as the plots curve and falling into a inverse over others
% such as quad functions as the points do not cross 0.
% ------------ Insert your code here -----------------------------
figure()
hold on

for i = 2:3:19
    plot3(SDraw(:,i),SDraw(:,i+1),SDraw(:,i+2),'b.')
    plot3(SDfilt(:,i),SDfilt(:,i+1),SDfilt(:,i+2),'r.')
end
title("Functions")
xlabel('x')
ylabel('y')
zlabel('z')


% ----------------------------------------------------------------


% ------------ Insert your commenent here ------------------------
%This task requires to find the moment when time(p) is optimal for the
%robot to pick up the object, that is to say when the velocity of the
%object is close to 0. we can skip the first column of SDfilt as every
%value is 0 making it optiamal to pick up, so we set are for loop to loop
%form 5 to 19 in increments of 3 skiping x,y and z 0,

%to find the time when the roboto can pick up the object we can use the
%derivatie function(diff in matlab) this allows for us to see the change in
%the variables and judge how close to 0 the variable is, for this task
%since it was not specified to do one column for SDfilt i looped through
%all minus the fist 3 for the reason above, and since x,y and z are always
%chaning with no constant i check the derivative of all three. the function
%checks if the object is close to 0 meaning that the object is not moving,
%then i output it in repect of time and the current column we are looping
%through.
% ----------------------------------------------------------------

% ------------ Insert your code here -----------------------------
time = SDfilt(:,1);%gets the time column
for j = 5:3:19
    dx = diff(SDfilt(:,j));%derivative for current columns
    dy = diff(SDfilt(:,j+1));
    dz = diff(SDfilt(:,j+2));
    for p = 1:length(dx)
        if abs(dx(p)) < 10^-2 %10^-2 is equal to 0.0100(Checks if dx is close to 0)
            if abs(dy(p)) < 10^-2
                if abs(dz(p)) < 10^-2
                    disp(['The times in which the robot can pick up the object are: ', num2str(time(p)), '  in column: ',num2str(j)]);
                    disp(dx(p))
                end
            end
        end
    end
end

%Double check are results with the visual of the graph
figure(2)
hold on
plot(time(2:end),dx)
plot(time(2:end),dy)
plot(time(2:end),dz)
xlabel('dx')
ylabel('dy')
zlabel('dz')
legend('dx','dy','dz')
title('Pickup')
% ----------------------------------------------------------------


% ------------ Insert your comment here --------------------------
%for this task we have to calculate the area under the the object during
%its full movment, this can be done by using integrals to find the area
%under the graph. we can do this again for each column as it was not asked
%to only do it for one, so we start with the same for loop we have been
%using, next we can use the built in function syms from the symbolic math
%tool box to help us plot find the intergal, next we can calculate the are
%using the built in in function and change the output to a double for
%easier viewing, we can then use the column we would like to check agains
%tthe symbolci value we are ploting aginst, in this case we can keep it
%consistantly x as all the other column are plotted against each other,
%then we can declare the min and max range of the function, in this case 0
%to 5 as that is what are time axis covers and will show use the area under
%the object for the full range of movment.
% ----------------------------------------------------------------

% ------------ Insert your code here -----------------------------
for l = 2:3:19
    xval = SDfilt(:,l);
    y = SDfilt(:,l+1);
    z = SDfilt(:,l+2);

    syms('x');
   
    areax = double(int(xval,x,0,5)); %Convert to double for display purposeses
    areay = double(int(y,x,0,5));
    areaz = double(int(z,x,0,5));
end
% ----------------------------------------------------------------