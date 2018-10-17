function[mag,theta]=ImageGradient(s)
    len=size(s)
    mag=zeros(len(1),len(2));
    theta=zeros(len(1),len(2));
    gx=[-1,0,1;-2,0,2;-1,0,1];
    gy=[1,2,1;0,0,0;-1,-2,-1];
    Ix= conv2(s, gx, 'same');
    Iy = conv2(s, gy, 'same');
    for u=1:len(1)
        for v=1:len(2)
            theta(u,v)=atan(Iy(u,v)/Ix(u,v));
            mag(u,v)=(Ix(u,v)^2+Iy(u,v)^2)^0.5;
        end
    end
    
end
