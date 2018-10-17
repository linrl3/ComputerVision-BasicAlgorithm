function[closing_A]=closing(A,SE)
    c=dilation(A,SE);
    d=erosion(c,SE);
    closing_A=d;
    
end