clear all; close all;
%The following code load an image, and assign it to a matrix of uint8. 
MX = rgb2gray(imread('DaigoSwan.png'));
figure()
imshow(MX)
%You have to:
%(a) plot the histogram, and (b) comment on the distribution obtained.
%Check on your note, and write a program to create the cumulative
%distribution (c). Inspect it in another figure, and try to understand it.
% Them put your skills in practice by strectching your knowledge. Can you:
% (d) create an algorithm to separate the two distributions (with a manual
% threshold) by creating two vectors?
% (e) use an AUTOMATIC threshold for the point (d)?

% -- part (a)
figure()
histogram(MX)
title('Historgram 256 bins')

% -- part (c)
% from the help of histogram, it is enough to add "cumcount", or "cdf", as
% normalization option
figure()
histogram(MX,'Normalization','cumcount') %you can try also cdf
title('Cumulative distribution function')

% but you can build the histogram and the cdf from zero
histDist = zeros(1,256);

for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        histDist(MX(i,j)) = histDist(MX(i,j))+1; %this create the histo. Note the problem with zero.
    end
end

cumDist = zeros(1,256);
for j = 1:256
    cumDist(j) = sum(histDist(1:j));
end
hold on
plot(cumDist,'r')
% -- part (d)

v1 = [];
v2 = [];

for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        if MX(i,j)>150
            v1 = [v1; MX(i,j)];
        else
            v2 = [v2; MX(i,j)];
        end
    end
end

figure()
subplot(1,2,1)
histogram(v2)
subplot(1,2,2)
histogram(v1)
title('Distributions with manual threshold')

% -- part (e) auto-threshold 
v1a = [];
v2a = [];

t_iter1 = mean(mean(MX)); % note you can do also use mean(MX,'all')

for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        if MX(i,j)>t_iter1
            v1a = [v1a; MX(i,j)];
        else
            v2a = [v2a; MX(i,j)];
        end
    end
end

mode1 = mode(v1a);
mode2 = mode(v2a);
t_final = round( (mode1+mode2)/2 )


v1b = [];
v2b = [];
for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        if MX(i,j)>t_final
            v1b = [v1b; MX(i,j)];
        else
            v2b = [v2b; MX(i,j)];
        end
    end
end

figure()
subplot(1,2,1)
histogram(v2b)
subplot(1,2,2)
histogram(v1b)
title('Distributions with automatic threshold')