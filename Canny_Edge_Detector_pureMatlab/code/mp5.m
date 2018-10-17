% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP5 Edge Detection
% Name:Runlong Lin    ID:3075255
% Due:2017.11.07
% -------------------------------------------------------
img_test=imread('C:\Users\linrl3\Desktop\332\mp5\lena','bmp');
img=rgb2gray(img_test);
figure(1)
imshow(img);
title('Original image');
N = 3; 
sigma = 7; 
% Gaussian smothing
s=GaussSmoothing(N,sigma,img);
s=uint8(s);
figure(2)
imshow(s);
title('Gauss Smoothing image');
% Calculate the image gradient
[mag,theta]=ImageGradient(double(s));
% mag=round(mag);
max_of_mag=max(max(mag));
mag=mag/max_of_mag*255;
figure(3)
imshow(uint8(mag));
title('Image Gradient magnitude ')
mag=double(uint8(mag));
mag=NonMaximaSupress(mag,theta);
figure(4)
imshow(uint8(mag));
title('magnitude after non-maxima supressing');
% Calculate high and low threshold
[th_low,th_high] = FindThreshold(mag, 0.88);
img_link=EdgeLinking(th_low,th_high,mag);
figure(7)
imshow(img_link);
title('mag image with edge linking');

