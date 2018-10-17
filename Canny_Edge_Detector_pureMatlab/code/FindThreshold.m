function[th_low,th_high] = FindThreshold(mag, percentageOfNonEdge)
x=1:1:256;
hist=zeros(1,256);
len=size(mag);
mag=double(mag);

for i=1:len(1)
    for j = 1:len(2)
        hist(1,mag(i,j)+1)=hist(1,mag(i,j)+1)+1;
    end
end
len2=size(hist);
total_area=len(1)*len(2);
current_area=0;
for i=1:len2(1)
    for j=1:len2(2)
        current_area=current_area+hist(i,j);
        if current_area/total_area>percentageOfNonEdge
            th_high=j;
            break
        end
    end
end
th_low=th_high/2.3;
figure(5)
bar(x,hist);
end
