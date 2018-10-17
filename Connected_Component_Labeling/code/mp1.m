% -------------------------------------------------------
% This is EECS 332 Introduction to Computer Vision 
% MP1 CCL(Connected Components Labels)
% Name:Runlong Lin    ID:3075255
% Due:2017.09.28
% -------------------------------------------------------
% load the image we use for CCL
target_img=imread('C:\Users\linrl3\Desktop\mp1\test','bmp');
% call the ccl function
[label_img,num_of_label]=ccl(target_img);
% set threshold and call filter_img function
% (if the image has too much noise)
th=1;
filter_img=size_filter(th,label_img);
% display the labeled img in RGB 
color_pixel=label2rgb(filter_img);
bb=size(color_pixel);
for i=1:bb(1)
    for j=1:bb(2)
        for k=1:bb(3)
        if color_pixel(i,j,k)==254
            color_pixel(i,j,k)=0;
        end
        
        
        end
    end
end
figure,imshow(color_pixel);

    
            
           
