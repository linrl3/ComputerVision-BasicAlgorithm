function[output_img]=HistoEqualization(input_img)
    dis=rgb2gray(input_img);
    figure(1)
    imshow(dis);
    h=zeros(1,256);
    length=size(dis);
    for u=1:length(1)
        for v=1:length(2)
            h(1,dis(u,v)+1)=h(1,dis(u,v)+1)+1;
        end
    end
% test=h(1,5)
% hhh = histogram(dis);
    x=1:1:256;

    p_h=zeros(1,256);
    for i=1:256
        p_h(1,i)=h(1,i)/(256^2);
    end
    Tr=zeros(1,256);
    % new T(r)
    for i=1:256
        Tr(1,i)=round(sum(p_h(1:i))*256);
    end

    hh=zeros(1,256);
    for i=1:256
        if Tr(1,i)==0
            hh(1,Tr(1,i)+1)=h(1,i);
        end
        if Tr(1,i)>0
            hh(1,Tr(1,i))=h(1,i);
        end
    end
    figure(2)
    bar(x,h);
    figure(3)
%     bar(x,Tr)
    plot(x,Tr)
    figure(4)
    bar(x,hh)
    output_img=zeros(256,256);
    for u=1:256
        for v=1:256
            ori_gray=dis(u,v)+1;
            output_img(u,v)=Tr(1,ori_gray);
        
        end
    end
    output_img=uint8(output_img);
    figure(5)
    imshow(output_img)
    figure(6)
    histogram(output_img)
end