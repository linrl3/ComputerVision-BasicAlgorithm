function[img_out]=GaussSmoothing(N,sigma,img_input)
    Gmask=GaussKernel(N,sigma);
    img_out = conv2(img_input, Gmask, 'same');
end
