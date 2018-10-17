% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP6 Hough Transform
% Name:Runlong Lin    ID:3075255
% Due:2017.11.15
% -------------------------------------------------------
img=imread('C:\Users\linrl3\Desktop\332\mp6\test2','bmp');
figure(1)
imshow(img)
img=rgb2gray(img);
img_edge = edge(img,'canny'); 
figure(2)
imshow(img_edge);
d_r=360;
d_theta=360;
hh=hough(img_edge,d_r,d_theta);
figure(3)
imshow(uint8(hh));
len=size(hh);
h_local_max=find_local_max(hh,15);
figure(4)
imshow(uint8(h_local_max));
th=Find_Threshold(h_local_max,6);
[aa,bb]=find(h_local_max>=th);
draw_lines(uint8(img),aa,bb,hh);
%     
