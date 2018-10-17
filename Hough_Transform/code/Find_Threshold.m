function[th] = Find_Threshold(h, line_pre)
x=1:1:256;
hist=zeros(1,256);
len=size(h);
h=double(h);

for i=1:len(1)
    for j = 1:len(2)
        hist(1,h(i,j)+1)=hist(1,h(i,j)+1)+1;
    end
end
len2=size(hist);
total_pixel=len(1)*len(2);
current_pixel=0;
for i=1:len2(1)
    for j=1:len2(2)
        current_pixel=current_pixel+hist(i,j);
        if total_pixel-current_pixel<=line_pre;
            th=j;
            break
        end
    end
end
figure(5)
bar(x,hist);
end
