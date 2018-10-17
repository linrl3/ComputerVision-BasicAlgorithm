function[h_local_max]=find_local_max(h,radius)
len_h=size(h);
padding_h=zeros(len_h(1)+radius*2,len_h(2)+radius*2);
padding_h(1+radius:len_h(1)+radius,1+radius:len_h(2)+radius)=h;
len=size(padding_h);
for i=radius+1:len(1)-radius
    for j=radius+1:len(2)-radius
        for x=-radius:1:radius
            for y=-radius:1:radius
                if padding_h(i,j)<padding_h(i+x,j+y)
                    padding_h(i,j)=0;
                end
            end
        end
    end
end
h_local_max=padding_h(1+radius:len_h(1)+radius,1+radius:len_h(2)+radius);

end
