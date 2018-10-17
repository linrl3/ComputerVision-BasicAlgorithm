function[output_img]=quadratic_correction(input_img)
    mm=double(input_img);
    length=size(mm);
    AA=ones(256*256,5);
    tt=zeros(256*256,1);
    index=1;
    for u=1:256
        for v=1:256
            AA(index,1)=u^2;
            AA(index,2)=u;
            AA(index,3)=v^2;
            AA(index,4)=v;
            tt(index,1)=mm(u,v);
            index=index+1;
        end
    end
    xx=((AA'*AA)^-1)*AA'*tt;
    quadratic=zeros(256,256);
    inverse_quadratic=zeros(256,256);
    for u=1:256
        for v=1:256
            quadratic(u,v)=xx(1,1)*u*u+xx(2,1)*u+xx(3,1)*v*v+xx(4,1)*v+xx(5,1);
            inverse_quadratic(u,v)=255-quadratic(u,v);
        end
    end
    output_img =zeros(256,256);
    for u=1:256
        for v=1:256
            output_img(u,v)=(mm(u,v)+inverse_quadratic(u,v))/2;
        end
    end
    output_img=uint8(output_img);
    figure(9)
    imshow(output_img)
    quadratic=uint8(quadratic);
    figure(10)
    imshow(quadratic);
    figure(11)
    imshow(uint8(inverse_quadratic))
end