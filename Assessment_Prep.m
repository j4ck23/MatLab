clear variables
load AssesTrainingData.mat

figure(1)
hold on

y = AssesTrainSDfilt(:,6);
z = AssesTrainSDfilt(:,7);
plot(y,z)

grid on
ylabel('y')
zlabel('x')

V1 = cross([AssesTrainSDfilt(4,11),AssesTrainSDfilt(4,12),AssesTrainSDfilt(4,13)], [AssesTrainSDfilt(4,8),AssesTrainSDfilt(4,9),AssesTrainSDfilt(4,10)]);
V1 = V1/norm(V1);

quiver(V1(1),V1(2),V1(3))

tang = V1(1)/V1(2); % the tangent is obtained simply as the y-vaule over the x-value of the second normal

ang = rad2deg(atan(tang));
disp(['The angle to rotate is: ', num2str(ang),'deg'])

