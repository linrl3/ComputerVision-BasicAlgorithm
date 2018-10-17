% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP3 Histogram Equalization
% Name:Runlong Lin    ID:3075255
% Due:2017.10.12
% -------------------------------------------------------
img=imread('C:\Users\linrl3\Desktop\332\mp3\moon','bmp');
out=HistoEqualization(img)
linear_correction(out)
quadratic_correction(out)