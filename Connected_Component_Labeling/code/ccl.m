function[label_img,num_of_label]=CCL(img)
[r,c]=size(img);
% set the label as flag
flag=0;
% initialize the E-table
ET=zeros(1,100);
L=zeros(r,c);
% begin the First Scan
for u=2:r
    for v=2:c
        if img(u,v)~=0
            Lu=L(u-1,v);
            Ll=L(u,v-1);
            %case1 Lu=Ll and both of them are non-zero
            if (Lu==Ll) && (Lu~=0)&&(Ll~=0) 
                L(u,v)=Lu;
            %case2 either Lu or Ll is zero
            elseif (Lu~=Ll)&&(~(Lu&&Ll)) 
                L(u,v)=max(Lu,Ll);
            %case3:both of them are non_zero and Lu~=Ll
            %in this case, we set up the E-table 
            %call the recursion_Etable to help us build up Et
            elseif ((Lu~=Ll)&&Lu>0&&Ll>0)
                L(u,v)=min(Lu,Ll);
                ET(max(Lu,Ll))=recursion_Etable(ET,min(Lu,Ll));
            %case4:Lu=Ll=0, we create a new label
            %set the new label in E-tabel
            else
                flag=flag+1;
                L(u,v)=flag;
                ET(flag)=flag;
            end
        end
    end
end
% begin the Second Scan
% replace all the pixel with the value in E-table
for u=1:r-1
    for v=1:c-1
        if L(u,v)~=0 
            L(u,v)=ET(L(u,v));
            
        end
        
    end
end
% optimize the E-table
for u=1:r-1
    for v=1:c-1
if L(u,v+1)~=L(u+1,v)&&L(u,v+1)>0&&L(u+1,v)>0
            ET(max(L(u,v+1),L(u+1,v)))=recursion_Etable(ET,min(L(u,v+1),L(u+1,v)));
end
% final scan
    end
end
for u=1:r-1
    for v=1:c-1
        if L(u,v)~=0 
            L(u,v)=ET(L(u,v));
            
        end
        
    end
end
% count the unique label(number of label) in labeled image
total=size(unique(L));
num_of_label=total(1)*total(2)-1;
    label_img=L;
end

