function [T] = GaussKernel(size, sigma)   
% here the size is the diameter of the filter  
if mod(size, 2) == 0  
    size = size + 1;  
end  
T = zeros(size, size);  
sum_of_square = zeros(size, size);  
centerIdx = ceil(size / 2);  
for i = 1:size  
    for j = 1:size  
        sum_of_square(i,j) = sqrt(abs(i - centerIdx) ^ 2 + abs(j - centerIdx) ^ 2);  
    end  
end   
T = (1/(2*pi*sigma^2))*exp(-sum_of_square.^2 / (2 * sigma^2));
s=sum(T(:));
T =T/s;
end