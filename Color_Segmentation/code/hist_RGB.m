function[h]=hist_RG(input_seg,histogram_rgb)
    length=size(input_seg);
    for i=1:length(1)
        for j=1:length(2)
            rr=round(input_seg(i,j,1)/255*100);
%             rr=input_seg(i,j,1)/255*100;
            gg=round(input_seg(i,j,2)/255*100);
            if rr==0
                rr=rr+1;
            end
            if gg==0
                gg=gg+1;
            end
            histogram_rgb(rr,gg)=histogram_rgb(rr,gg)+1;
        end
    end
    h=histogram_rgb;
end
