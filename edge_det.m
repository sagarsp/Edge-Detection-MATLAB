clear all;
clc;
img = imread('RedBall.png');
figure(1);
imshow(img);

imgGray = rgb2gray(img);
imwrite(imgGray,'gray.jpg');
figure(2);
imshow(imgGray);
title('GrayScale Image');

figure(3);
imhist(imgGray);
title('Histogram')

Len = length(imgGray);
Hei = length(imgGray(:)) / length(imgGray);
imgDiff = zeros(Len,Hei);

for i=1: Hei-1;
    for j = 1 : Len-1;
        imgDiff(i,j) = abs(imgGray(i,j) - imgGray(i,j+1));
        imgDiff(i,j) = imgDiff(i,j) + abs(imgGray(i,j+1) - imgGray(i,j));
    end
end
for i=1: Hei-1;
    for j = 1 : Len-1;
        imgDiff(i,j) = imgDiff(i,j) + abs(imgGray(i,j) - imgGray(i+1,j));
        imgDiff(i,j) = imgDiff(i,j) + abs(imgGray(i+1,j) - imgGray(i,j));
    end
end

for i=2: Hei-1;
    for j = 2 : Len-1;
        imgDiff(i,j) = imgDiff(i,j) + abs(imgGray(i,j) - imgGray(i+1,j-1));
        imgDiff(i,j) = imgDiff(i,j) + abs(imgGray(i-1,j+1) - imgGray(i,j));
    end
end


figure(4);
imshow(imgDiff);
imwrite(imgDiff,'edge.jpg');
title('Using my Algorithm');

p = edge(imgGray, 'sobel' , 0.01, 'both');
figure(5);
imshow(p);
title('Using MATLAB inbuilt Function');