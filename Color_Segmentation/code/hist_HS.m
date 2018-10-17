function[h]=hist_HS(input_seg,histogram_hs)
    length=size(input_seg);
    for i=1:length(1)
        for j=1:length(2)
            hh=round(input_seg(i,j,1)*100);
            ss=round(input_seg(i,j,2)*100);
            if hh==0
                hh=hh+1;
            end
            if ss==0
                ss=ss+1;
            end
            histogram_hs(hh,ss)=histogram_hs(hh,ss)+1;
        end
    end
    h=histogram_hs;
end
