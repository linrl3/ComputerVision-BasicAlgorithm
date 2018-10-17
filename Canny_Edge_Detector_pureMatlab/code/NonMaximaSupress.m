function[mag]=NonMaximaSupress(mag, theta)
    len=size(mag);
    sector=zeros(len(1),len(2));
% Supressing non-maxima
    for i=1:len(1)
        for j=1:len(2)
            if -pi/8<theta(i,j)&&theta(i,j)<pi/8
                sector(i,j)=0;
            end
            if pi/8<theta(i,j)&&theta(i,j)<3*pi/8
                sector(i,j)=1;
            end
            if (3*pi/8<theta(i,j)&&theta(i,j)<=4*pi/8)||(-4*pi/8<=theta(i,j)&&theta(i,j)<-3*pi/8)
                sector(i,j)=2;
            end
            if -3*pi/8<theta(i,j)&&theta(i,j)<-pi/8
                sector(i,j)=3;
            end
        end
    end
    for i=3:len(1)-2
        for j=3:len(2)-2
%         if sector(i,j)==0
            if sector(i,j)==2
                if (mag(i-1,j)>mag(i,j))||(mag(i+1,j)>mag(i,j))
                    mag(i,j)=0;
                end
            end
%         if sector(i,j)==1
            if sector(i,j)==3
                if (mag(i-1,j-1)>mag(i,j))||(mag(i+1,j+1)>mag(i,j))
                    mag(i,j)=0;
                end
            end
%         if sector(i,j)==2
            if sector(i,j)==0
                if (mag(i,j-1)>mag(i,j))||(mag(i,j+1)>mag(i,j))
                    mag(i,j)=0;
                end
            end
%         if sector(i,j)==3
            if sector(i,j)==1
                if (mag(i+1,j-1)>mag(i,j))||(mag(i-1,j+1)>mag(i,j))
                    mag(i,j)=0;
                end
            end
            
        end
    end
end
