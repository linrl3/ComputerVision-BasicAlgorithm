function[filter_img]=size_filter(threshold,img)
%use tabulate function 
%to calculate the num of label in img and its counts
    filter_label=[];
    aa=tabulate(img(:));
    total=size(aa);
    label_list=[];
    for i=1:total(1)
        label_list(i)=aa(i,1);
    end
    label_area=[];
    for j=1:total(1)
        label_area(j)=aa(j,2);
    end
%calculate the area of each label
%if the area is smaller than threshold
%we filter the area by setting its pixel the same as background
    for i = 1 : length(label_area)
        if label_area(i)<threshold
            filter_label=[filter_label,label_list(i)];
        end
    end
    size_of_img=size(img);
    num_of_filter_label=size(filter_label);
    for i=1:size_of_img(1)
        for j=1:size_of_img(2)
            for k = 1:num_of_filter_label(2)
                if img(i,j)==filter_label(k)
                    img(i,j)=0;
                end
            end
        end
    end
    filter_img=img;
    
end