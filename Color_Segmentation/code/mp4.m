% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP4 Color Segmentation
% Name:Runlong Lin    ID:3075255
% Due:2017.10.17
% -------------------------------------------------------
img_test=imread('C:\Users\linrl3\Desktop\332\mp4\hand','png');
% seg1=imcrop(img_test);
% imwrite(seg1,'seg18.bmp')
% -----------------------------------------------------------------------
length_img=size(img_test);
histogram_HS=zeros(100,100)
srcFiles = dir('C:\Users\linrl3\Desktop\332\mp4\seg\*.bmp');  
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\linrl3\Desktop\332\mp4\seg\',srcFiles(i).name);
    gg = imread(filename);
    hsv_seg=rgb2hsv(gg);
    histogram_HS=hist_HS(hsv_seg,histogram_HS);
end
figure(1)
bar3(histogram_HS,'r');
th1=20;
img_hsv=rgb2hsv(img_test);
for u=1:length_img(1)
    for v=1:length_img(2)
        h_test=round(img_hsv(u,v,1)*100);
        s_test=round(img_hsv(u,v,2)*100);
        if h_test==0
            h_test=h_test+1;
        end
        if s_test==0
            s_test=s_test+1;
        end
        if histogram_HS(h_test,s_test)<th1
            img_hsv(u,v,3)=0;
        end
    end
end
out=hsv2rgb(img_hsv);
figure(2)
imshow(out)
% ---------------------------------------------------------------------------
histogram_RG=zeros(100,100);
img_test_RG=double(img_test);
srcFiles = dir('C:\Users\linrl3\Desktop\332\mp4\seg\*.bmp');  
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\linrl3\Desktop\332\mp4\seg\',srcFiles(i).name);
    gg = imread(filename);
%     hsv_seg=rgb2hsv(gg);
    gg=double(gg);
    histogram_RG=hist_RGB(gg,histogram_RG);
end
figure(3)
bar3(histogram_RG,'r')
th2=20;
for u=1:length_img(1)
    for v=1:length_img(2)
        r_test=round(img_test_RG(u,v,1)/255*100);
        g_test=round(img_test_RG(u,v,2)/255*100);
        if r_test==0
            r_test=r_test+1;
        end
        if g_test==0
            g_test=g_test+1;
        end
        if histogram_RG(r_test,g_test)<th2
            img_test_RG(u,v,1)=0;
            img_test_RG(u,v,2)=0;
            img_test_RG(u,v,3)=0;
        end
    end
end
img_test_RG=uint8(img_test_RG);
figure(4)
imshow(img_test_RG)
% ----------------------------------------------------------------------------



