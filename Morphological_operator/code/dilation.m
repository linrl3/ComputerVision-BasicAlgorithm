function[Dilation_A]=dilation(A,SE)
    length_A=size(A);
    length_SE=size(SE);
    bias=floor((length_SE(1)+1)/2);
    new=zeros(length_A(1),length_A(2));
    for i =bias:(length_A(1)-length_SE(1))
        for j =bias:(length_A(2)-length_SE(2))
            for u=1:length_SE(1)
                for v=1:length_SE(2)
                    if A(i-bias+u,j-bias+v)==SE(u,v)
                        new(i,j)=1;

                    end
                end
            end
        end
    end
    Dilation_A=new;
end