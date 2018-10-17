function[boundary_A]=boundary(A,SE)
    c=erosion(A,SE);
    boundary_A=A-c;
end