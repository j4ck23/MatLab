close all
clear variables

%The following code load an image, and assign it to a matrix of uint8. 
MX = rgb2gray(imread('DaigoSwan.png'));
figure()
imshow(MX)

figure()
hold on
histogram(MX,256)
title('auto bins')

figure()
histogram(MX,'Normalization','probability')
title('auto bins probability')

[counts, bins] = histcounts(MX,256);


freq = [];
sumc = sum(counts);
for i = 1:length(counts)
    freq = [freq; (counts(i)/sumc)];
end

cumfreq = [];
total = 0;
for i = 1:length(freq)
    cumfreq = [cumfreq; (total + freq(i))];
    total = total + freq(i);
end

Out = [];
for i = 1:size(MX,1)
    for j = 1:size(MX,2)
        Out(i,j) = cumfreq(MX(i,j),+1);
    end
end

figure()
imshow(Out)

figure()
subplot(1,2,1),
imshow(MX)
subplot(1,2,2)
imshow(Out)
% cumdis = [];
% total = 0;
% for i = 1:length(counts)
%     cumdis = [cumdis,(total + counts(i))];
%     total = total + counts(i);
% end
% 
% figure()
% hold on
% plot(cumdis)

% newimg = [];
% for u = 1:length(counts)
%     newimg = [newimg; (round(((cumdis(u)-min(cumdis))/(size(MX,1)*size(MX,2))-1)*255))];
% end

% newimg = abs(newimg);

% newimg1 = [];
% for r = 1:length(newimg)
%     for y = 1:size(MX,1)
%         for t = 1:size(MX,2)
%             if r == MX(y,t)
%                 newimg1(y,t) = newimg(r);
%             else
%             end
%         end
%     end
% end



% imwrite(newimg1, 'newimg.png');
% 
% figure()
% imshow(newimg1)