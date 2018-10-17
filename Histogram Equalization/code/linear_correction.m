function[output_img]=linear_correction(input_img)
    mm=double(input_img);
    length=size(mm);
    A=ones(256*256,3);
    t=zeros(256*256,1);
    index=1;
    for u=1:256
        for v=1:256
            A(index,1)=u;
            A(index,2)=v;
            t(index,1)=mm(u,v);
            index=index+1;
        end
    end
    x=((A'*A)^-1)*A'*t;
    linear=zeros(256,256);
    for u=1:256
        for v=1:256
            linear(u,v)=x(1,1)*u+x(2,1)*v+x(3,1);
        end
    end
    modi=linear';
%     transpose 'linear'
    output_img=zeros(256,256);
    for u=1:256
        for v=1:256
            output_img(u,v)=(modi(u,v)+mm(u,v))/2;
        end
    end
    output_img=uint8(output_img);
    figure(7)
    imshow(output_img)
    linear=uint8(linear);
    figure(8)
    imshow(linear);
    figure(77)
    imshow(uint8(modi))
end
% total=0;
% total2=0;
% for u=1:256
%     for v=1:256
%         total=total+out(u,v);
%     end
% end
% linear=double(linear);
% for u=1:256
%     for v=1:256
%         total2=total2+linear(u,v);
%     end
% end
        

% function[cost]=least_squares(img,w)
%     cost=0;
%     cp=0;
%     for u=1:256
%         for v=1:256
%             cp=w(1,1)+w(1,2)*u+w(1,3)*v;
%             cost=cost+(cp-img(u,v))^2;
%         end
%     end
% end
