clear variables; close all;

MX = rgb2gray(imread('Assess3image.png'));
figure()
imshow(MX)

% Images could be considered a collection of data, with a different value for each pixel. The students are asked to inspect the greyscale 8-bit image provided, and to develop a script to:
% a. Create the histogram of the image, and describe the resulting distribution. [10pts]
% b. If more than one peak is present in the histogram, create a program to evaluate the probability that they represent distinct parts of the image, and in this case, to identify which part they represent. [10pts]
% c. Create the cumulative distribution of the histogram, and then use it to modify the values of the pixel of the image. Plot the new image and comment the result. [15pts]

% --- description part (a) -------

% --------------------------------

% --- implementation part (a) -------
figure()
histogram(MX)
title('Histogram of the image')
% --------------------------------

% --- description part (b) -------

% --------------------------------

% --- implementation part (b) -------
meanMX = mean(MX);
meanMX = mean(meanMX);

MX1 = [];
MX2 = [];
for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        if MX(i,j) > meanMX
            MX1(i,j) = MX(i,j);
        else
            MX2(i,j) = MX(i,j);
        end
    end
end

MX1 = nonzeros(MX1);
MX2 = nonzeros(MX2);

Threshold = round((mode(MX1)+mode(MX2))*1/2);

MX3 = [];
MX4 = [];
for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        if MX(i,j) > Threshold
            MX4(i,j) = MX(i,j);
        else
            MX3(i,j) = MX(i,j);
        end
    end
end

MX3 = nonzeros(MX3);
MX4 = nonzeros(MX4);

figure()
subplot(1,2,1)
histogram(MX3)
title('Lower Split')
subplot(1,2,2)
histogram(MX4)
title('Higher split')

Distinct_Img = ttest2(MX3,MX4);%Use base significance of 0.05
if Distinct_Img == 1
    disp('The two peaks of the image represent two distinct parts of the image')
else
    disp('The two peaks of the image do not represent two distinct parts of the image')
end
% --------------------------------

% --- description part (c) -------

% --------------------------------

% --- implementation part (c) -------
%Gets the counts of each bin, we could use histcoiunts to do this, but we
%want all 256 bins, histcounts starts at the first populated bin

counts = zeros(1,256);%Declare a vector of 0 for indexing
for i=1:size(MX,1)%for every value in MX
    for j=1:size(MX,2)
        for k=0:255 %For bins
            if MX(i,j)==k%If current value == to bin value
                counts(k+1)=counts(k+1)+1;%Add to counts
            end
        end
    end
end

counts = counts(:);

%Distrubtion freqency
freq = [];
sumc = sum(counts);
for i = 1:length(counts)
    freq = [freq; (counts(i)/sumc)];%Current bin total divded by the sum of all the bins
end

%Cumlative Frequecny
cumfreq = [];
total = 0;
for i = 1:length(freq)
    cumfreq = [cumfreq; (total + freq(i))];%Current bin total + the sum of all previous bins
    total = total + freq(i);
end

%Round to the value of the grayscale pixels
cumfreq = round(255*cumfreq);

%Enhanced Image
Out = [];
for i=1:size(MX,1)
    for j=1:size(MX,2)
        temp=(MX(i,j)+1);%Stores the current MX plus 1
        Out(i,j)=cumfreq(temp); %assgins the out value to the cumlative frequency of the current pixel +1
    end
end

figure()
imshow(uint8(Out))%changes the output image from double to unassgined interger 8-bit

%Comparrison of images
figure()
subplot(1,2,1),
imshow(MX)
title('Original')
subplot(1,2,2)
imshow(uint8(Out))
title('Enhanced')

%Comparrison of histograms
figure()
subplot(1,2,1)
histogram(MX)
title('Unenhanced')
subplot(1,2,2)
histogram(Out)
title('Enhanced')

%Formatting
disp('Tabel of frequencies')
Labels = 0:255;
Labels = Labels(:);
t = table(Labels,counts,freq,cumfreq,VariableNames=["Bins","Amount","Frequency","Cumlative"]);
disp(t)

if Distinct_Img == 1
    disp('The two peaks of the image represent two distinct parts of the image')
else
    disp('The two peaks of the image do not represent two distinct parts of the image')
end

% --------------------------------