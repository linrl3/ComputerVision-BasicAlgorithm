function[img_link]=EdgeLinking(th_low,th_high,mag)
    len=size(mag);
    img_link=zeros(len(1),len(2));
    mag_low=zeros(len(1),len(2));
    for i=1:len(1)
        for j=1:len(2)
            if mag(i,j)>th_high
                img_link(i,j)=255;
            end
        end
    end
    mag_high_copy=img_link;
    for i=1:len(1)
        for j=1:len(2)
            if mag(i,j)<=th_low
                mag_low(i,j)=0;
            else
                mag_low(i,j)=255;
            end
        end
    end
    for i=2:len(1)-1
        for j=2:len(2)-1
            if mag(i,j)>=th_low&&mag(i,j)<=th_high
                for x=-1:1:1
                    for y=-1:1:1
                        if img_link(i+x,j+y)==255
                            img_link(i,j)=255;
                        end
                    end
                end
            end
        end
    end    
    
    figure(5);
    imshow(mag_high_copy);
    title('imgage with high threshold');
    figure(6)
    imshow(mag_low);
    title('imgage with low threshold');

    
end
