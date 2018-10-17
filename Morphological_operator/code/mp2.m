% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP2 Morphological Operators
% Name:Runlong Lin    ID:3075255
% Due:2017.10.05
% -------------------------------------------------------
img=imread('C:\Users\linrl3\Desktop\332\mp2\palm','bmp');

% imgg=size_filter(50,img)
% img=[]
SE = ones(3,3);

c=dilation(img,SE);
cc=erosion(img,SE);
ccc=opening(img,SE);
cccc=closing(img,SE);
d=boundary(c,SE);
dd=boundary(cccc,SE);
c=color(c);
dis=label2rgb(c);
figure,imshow(dis)

dis=label2rgb(cc);
figure,imshow(dis)

dis=label2rgb(ccc);
figure,imshow(dis)

dis=label2rgb(cccc);
figure,imshow(dis)

dis=label2rgb(d);
figure,imshow(dis)

dis=label2rgb(dd);
figure,imshow(dis)

