function[Erosion_A]=erosion(A,SE)
    length_A=size(A);
    length_SE=size(SE);
    new=zeros(length_A(1),length_A(2));
    bias=floor((length_SE(1)+1)/2);
    for i =bias:(length_A(1)-length_SE(1))
        for j =bias:(length_A(2)-length_SE(2))
            flag=1;
            for u=1:length_SE(1)
                for v=1:length_SE(2)
                    if A(i-bias+u,j-bias+v)~=SE(u,v)
                        flag=0;
                    end
                    
                end
                
            end
            new(i,j)=flag;
        end
    end
    Erosion_A=new;
end