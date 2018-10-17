function[out]=color(in)
    len1=size(in)
    for x=1:len1(1)
        for y=1:len1(2)
            if in(x,y)==1
                in(x,y)=110;
            end
        end
    end
    out=in;
end