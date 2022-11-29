clear variables; close all;

load DataAss2Ex1.mat

% Please note that matrix M has the following structure:
% Column one has the number of posts, Column two the number of followers,
% Column three the number of followings. Each row is a specific account.

% The students are asked to use data retrieved from a social media (the number of followers, followings, and posts of the friends of the lecturer without a professional account), and to create a Matlab program to:
% a. Create scatter plots of “followers VS followings”; “followers VS posts”; “posts VS followings”; complemented with correlation coefficients and regression lines. [10pts]
% b. Create histograms of “followers”, “followings”, and “posts”, and generalize them with the appropriate distribution curve. [10pts]
% c. Remove potential outliers, and replicate the analysis at point a., commenting potential differences. [10pts]

% --- Insert your code with appropriate comments below in the correct spaces ---------
% --- description part (a) -------
%For ease i will first split the data from matrix M  into 3 sperate vectors
%for each 3 attrbiutes to save calling M(:,1) for posts etc...
%
%For this task we are instructed to create 3 scatter graphs
% --------------------------------
% --- implementation part (a) ----
%Assign the Matrix to Vectors
Post = M(:,1);
Followers = M(:,2);
Following = M(:,3);

%Plot the vectors into scatter graphs
figure(Name="Followers V Following")%Figure Name
plot(Followers,Following,'ro')%Use'o' for scatter plot, could be chnaged with the scatter command
title("Followers VS Following")%Graph title
xlabel('Followers')%Graph X Label
ylabel('Following')%Graph Y Label
lsline%Draws a regression line

figure(Name="Followers V Posts")
plot(Followers,Post,'bo')
title("Followers VS Posts")
xlabel('Followers')
ylabel('Posts')
lsline

figure(Name="Posts V Following")
plot(Post,Following,'go')
title("Posts VS Following")
xlabel('Posts')
ylabel('Following')
lsline

%A plot of all 3 side by side
figure(Name="All three")
subplot(1,3,1)
plot(Followers,Following,'ro')
title("Followers VS Posts")
xlabel('Followers')
ylabel('Posts')
lsline

subplot(1,3,2)
plot(Followers,Post,'bo')
title("Posts VS Following")
xlabel('Posts')
ylabel('Following')
lsline

subplot(1,3,3)
plot(Post,Following,'go')
title("Posts VS Following")
xlabel('Posts')
ylabel('Following')
lsline

FFline = polyfit(Followers,Following,1);%Calculation for the line with the input being vectors and a degree, in this case 1
FPline = polyfit(Followers,Post,1);
PFline = polyfit(Post,Following,1);

corrFF = corr([Followers, Following]);%Correlation between the vectors
corrFP = corr([Followers, Post]);
corrPF = corr([Post, Following]);
corrAll = corr([Followers,Following,Post]);

%Formatting
disp('Followers and Following')
disp(['The line equation for Followers VS Folloiwng are ',num2str(FFline(1)),' line coeffcient and ',num2str(FFline(2)),' line intercept'])
disp('The Correlation between Followers and Following are:')
disp(corrFF)

disp('Followers and Posts')
disp(['The line equation for Followers VS Posts are ',num2str(FPline(1)),' line coeffcient and ',num2str(FPline(2)),' line intercept'])
disp('The Correlation between Followers and Posts are:')
disp(corrFP)

disp('Posts and Following')
disp(['The line equation for Posts VS Folloiwng are ',num2str(PFline(1)),' line coeffcient and ',num2str(PFline(2)),' line intercept'])
disp('The Correlation between Posts and Following are:')
disp(corrPF)

disp('Correlation between Followers, Following and Posts')
disp(corrAll)
% --------------------------------
% --------------------------------
% --- description part (b) -------
%All left skew
% --------------------------------
% --- implementation part (b) ----
%Plot a Histogram - In this case i subplotted the same histogram
%Allowing us to view the distribution as well as the probablity
figure(Name="Posts Hist")
subplot(1,2,1)
histogram(Post,10)%plots a histogram with 10 bins
title("Posts")
subplot(1,2,2)
histogram(Post,10,Normalization="probability")%plots the same histogram but converts the counts to probabiltiy using normalization
title("Posts Probablity")

figure(Name="Followers Hist")
subplot(1,2,1)
histogram(Followers,10)
title("Followers")
subplot(1,2,2)
histogram(Followers,10,Normalization="probability")
title("Followers Probablity")

figure(Name="Following Hist")
subplot(1,2,1)
histogram(Following,10)
title("Following")
subplot(1,2,2)
histogram(Following,10,Normalization="probability")
title("Following Probablity")

%Plot to visualize the distribution
figure(Name="Distributions")
subplot(1,3,1)
histfit(Post,10,'kernel')%Use kernel to smooth fit the data with an appriote line.
title("Posts")
subplot(1,3,2)
histfit(Followers,10,'kernel')
title("Followers")
subplot(1,3,3)
histfit(Following,10,'kernel')
title("Following")
% --------------------------------
% --------------------------------
% --- description part (c) -------
%For this task we must identifier any outliers in the data set, for this
%task we will do it by eye looking at 1a scatter plots to identify any
%outliers. For this task i found it best to loop through each scatter graph
%indavidually as some graphs would list rows as outliers that we're not
%outliers in others, given this information i found it best to take this
%approach for the greatest accuracy.
% --------------------------------
% --- implementation part (c) ----
FANDF = [Followers Following];
FANDF_Filt = [];
FANDF_Anom = [];

%For loop to remove outliers identifed by looking at the scatter graph
for i  = 1:length(FANDF)
    if FANDF(i,1) == 4756 && FANDF(i,2) == 6028%Checks for ceratin points
        FANDF_Anom = [FANDF_Anom; FANDF(i,:)];%Adds them to a list, could be left blank to ignore this point
    elseif FANDF(i,1) == 1789 && FANDF(i,2) == 257
        FANDF_Anom = [FANDF_Anom; FANDF(i,:)];
    elseif FANDF(i,1) == 712 && FANDF(i,2) == 2052
        FANDF_Anom = [FANDF_Anom; FANDF(i,:)];
    elseif FANDF(i,1) == 328 && FANDF(i,2) == 1955
        FANDF_Anom = [FANDF_Anom; FANDF(i,:)];
    else
        FANDF_Filt = [FANDF_Filt; FANDF(i,:)];%any point not classified as anom is added to the new list to be plotted.
    end
end

%Followers vs Posts
FANDP = [Followers Post];
FANDP_Anom = [];
FANDP_Filt = [];

for i = 1:length(FANDP)
    if FANDP(i,1) == 4756 && FANDP(i,2) == 521
        FANDP_Anom = [FANDP_Anom; FANDF(i,:)];
    elseif FANDP(i,1) == 1831 && FANDP(i,2) == 821
        FANDP_Anom = [FANDP_Anom; FANDP(i,:)];   
    elseif FANDP(i,1) == 985 && FANDP(i,2) == 615
        FANDP_Anom = [FANDP_Anom; FANDP(i,:)];
    elseif FANDP(i,1) == 607 && FANDP(i,2) == 503
        FANDP_Anom = [FANDP_Anom; FANDP(i,:)];
    elseif FANDP(i,1) == 712 && FANDP(i,2) == 646
        FANDP_Anom = [FANDP_Anom; FANDP(i,:)];
    elseif FANDP(i,1) == 521 && FANDP(i,2) == 609
        FANDP_Anom = [FANDP_Anom; FANDP(i,:)]; 
    else
        FANDP_Filt = [FANDP_Filt; FANDP(i,:)];
    end
end

PANDF = [Post Following];
PANDF_Anom = [];
PANDF_Filt = [];

for i = 1:length(PANDF)
    if PANDF(i,1) == 521 && PANDF(i,2) == 6028
        PANDF_Anom = [PANDF_Anom, PANDF(i,:)];
    elseif PANDF(i,1) == 18 && PANDF(i,2) == 1955
        PANDF_Anom = [PANDF_Anom, PANDF(i,:)];
    elseif PANDF(i,1) == 646 && PANDF(i,2) == 2052
        PANDF_Anom = [PANDF_Anom, PANDF(i,:)];
    elseif PANDF(i,1) == 498 && PANDF(i,2) == 257
        PANDF_Anom = [PANDF_Anom, PANDF(i,:)];
    elseif PANDF(i,1) == 609 && PANDF(i,2) == 554
        PANDF_Anom = [PANDF_Anom, PANDF(i,:)];
    else
        PANDF_Filt = [PANDF_Filt; PANDF(i,:)];
    end
end

%I could change to amout of outliers i remove by being tighter with my
%requirments but i think this amount of removal gives a intresting result
%to explore.

figure(Name="Followers V Following W/O Outliers")
plot(FANDF_Filt(:,1),FANDF_Filt(:,2),'ro')
title("Followers VS Following W/O Outliers")
xlabel('Followers')
ylabel('Following')
lsline

figure(Name="Followers V Posts W/O Outliers")
plot(FANDP_Filt(:,1),FANDP_Filt(:,2),'bo')
title("Followers VS Posts W/O Outliers")
xlabel('Followers')
ylabel('Posts')
lsline

figure(Name="Posts V Following W/O Outliers")
plot(PANDF_Filt(:,1),PANDF_Filt(:,2),'go')
title("Posts VS Following W/O Outliers")
xlabel('Posts')
ylabel('Following')
lsline

%A plot of all 3 side by side
figure(Name="All three W/O Outliers")
subplot(1,3,1)
plot(FANDF_Filt(:,1),FANDF_Filt(:,2),'ro')
title("Followers VS Posts W/O Outliers")
xlabel('Followers')
ylabel('Posts')
lsline

subplot(1,3,2)
plot(FANDP_Filt(:,1),FANDP_Filt(:,2),'bo')
title("Posts VS Following W/O Outliers")
xlabel('Posts')
ylabel('Following')
lsline

subplot(1,3,3)
plot(PANDF_Filt(:,1),PANDF_Filt(:,2),'go')
title("Posts VS Following W/O Outliers")
xlabel('Posts')
ylabel('Following')
lsline

FFline_Outliers = polyfit(FANDF_Filt(:,1),FANDF_Filt(:,2),1);%Calculation for the line with the input being vectors and a degree, in this case 1
FPline_Outliers = polyfit(FANDP_Filt(:,1),FANDP_Filt(:,2),1);
PFline_Outliers = polyfit(PANDF_Filt(:,1),PANDF_Filt(:,2),1);

corrFF_Outliers = corr([FANDF_Filt(:,1),FANDF_Filt(:,2)]);%Correlation between the vectors
corrFP_Outliers = corr([FANDP_Filt(:,1),FANDP_Filt(:,2)]);
corrPF_Outliers = corr([PANDF_Filt(:,1),PANDF_Filt(:,2)]);

disp('Followers and Following W/O Outliers')
disp(['The line equation for the improved Followers VS Folloiwng are ',num2str(FFline_Outliers(1)),' line coeffcient and ',num2str(FFline_Outliers(2)),' line intercept'])
disp('The Correlation between the imporved Followers and Following are:')
disp(corrFF_Outliers)

disp('Followers and Posts W/O Outliers')
disp(['The line equation for the improved Followers VS Posts are ',num2str(FPline_Outliers(1)),' line coeffcient and ',num2str(FPline_Outliers(2)),' line intercept'])
disp('The Correlation between the imporved Followers and Posts are:')
disp(corrFP_Outliers)

disp('Posts and Following W/O Outliers')
disp(['The line equation for the improved Posts VS Following are ',num2str(PFline_Outliers(1)),' line coeffcient and ',num2str(PFline_Outliers(2)),' line intercept'])
disp('The Correlation between the imporved Posts and Following are:')
disp(corrPF_Outliers)
%we cant compare all 3 due to different legnths of vectors

disp('Comparing:')
disp('Followers VS Following With and witout outliers')
disp(corrFF), disp(corrFF_Outliers)

disp('Followers VS Posts With and witout outliers')
disp(corrFP), disp(corrFP_Outliers)

disp('Posts VS Following With and witout outliers')
disp(corrPF), disp(corrPF_Outliers)
% --------------------------------
% --------------------------------