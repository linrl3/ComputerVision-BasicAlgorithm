function [opening_A]=opening(A,SE)
    c=erosion(A,SE);
    d=dilation(c,SE);
    opening_A=d;
end