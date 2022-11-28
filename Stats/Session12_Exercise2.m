close all
clear variables

%The following code load an image, and assign it to a matrix of uint8. 
MX = rgb2gray(imread('DaigoSwan.png'));
figure()
imshow(MX)
%You have to:
%(a) plot the instogram, and (b) comment on the distribution obtained.
%Check on your note, and write a program to create the cumulative
%distribution (c). Inspect it in another figure, and try to understand it.
% Them put your skills in practice by strectching your knowledge. Can you:
% (d) create an algorithm to separate the two distributions (with a manual
% threshold) by creating two vectors?
% (e) use an AUTOMATIC threshold for the point (d)?

figure()
hold on
histogram(MX,256)
title('auto bins')


figure()
histogram(MX,'Normalization','probability')
title('auto bins probability')


%From the histograms plotted above the distribution is binominal as it has
%to peaks, these peaks are defined by the most common values from our
%distrbuition. meaning this distribution has too common values making
%prediction of where each new piece of data may fall harder.

%cumlative distribution

%We can get the counts for each bin by using histcounts and checking by
%looking at the histogram ourselves

%Get the total of values in each bin
[counts, bins] = histcounts(MX,256);

%Calculate the frequrence of each bin
freq = [];
couintsum = sum(counts);%Sum the all the values in the histogram
for i = 1:length(counts)
    freq(i) = counts(i)/couintsum;%Frequecny calc
end

%Cumlative freqencey
cumfreq = [];
total = 0;%Current total
for j = 1:length(freq)
    cumfreq(j) = total + freq(j);%Append the cumlative frequency
    total = total + freq(j);%Total plus the frequecny to use for the calcuation above
end

t = table(counts',freq', cumfreq','VariableNames',{'counts','frequecny','Cumlative Frequency'})

figure()
plot(cumfreq)%plot the cumlative fequency

figure()
histogram(MX,256,'Normalization','cdf')%Double check the calculation

%this is how to find the cumlative distribution of the histogram

%Mean of the cumaltive frequency

dx = diff(cumfreq');
%after calculating the derivate we can use a point where the graph is not
%growing, in this case poition 150 of the derivative

%Loop to dectect if the current value in the matrix is greater than the
%value of the threshold found using the derivaitve
MX1 = [];
MX2 = [];
for m = 1:size(MX,1)
    for n = 1:size(MX,2)
        if MX(m,n) > 150
            MX1(m,n) = MX(m,n);
        else
            MX2(m,n) = MX(m,n);
        end
    end
end

%Method using the mean as a threshold
meanMX = mean(MX);
meanMX = mean(meanMX);

MX3 = [];
MX4 = [];
for k = 1:size(MX,1)
    for l = 1:size(MX,2)
        if MX(k,l) > meanMX
            MX3(k,l) = MX(k,l);
        else
            MX4(k,l) = MX(k,l);
        end
    end
end

%Remove zeros generated during the loop, we can confirm that there were no
%zeros present before the loop by looking at the histogram or using
%unqiue() on the MX data set
MX1 = nonzeros(MX1);
MX2 = nonzeros(MX2);
MX3 = nonzeros(MX3);
MX4 = nonzeros(MX4);

%Plot the new histograms
figure(10)
histogram(MX1)

figure(11)
histogram(MX2)

%Histograms using mean as split
figure(12)
histogram(MX3)

figure(13)
histogram(MX4)

cumdis = [];
totaldis = 0;
for len = 1:length(counts)
    cumdis(len,:) = totaldis + counts(len);
    totaldis = totaldis + counts(len);
end

plot(counts)