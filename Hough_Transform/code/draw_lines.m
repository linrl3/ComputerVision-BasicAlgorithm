function draw_lines(img_input, rr, tt,h)
    [rows, cols] = size(img_input);  
    [num_r, num_theta] = size(h);
    
    r_max = sqrt(rows^2 + cols^2);
    d_r =  2*r_max/(num_r-1);         
    d_theta = pi/num_theta;
    % Array of theta values across the accumulator matrix.
    theta = [0:d_theta:(pi-d_theta)];    
    r_index=rr;
    t_index=tt;
    rho = d_r*(r_index' - num_r/2);
    theta = d_theta*(t_index' - 1);
    
    x = [0; cols]*ones(1, length(r_index));
    y = [rho./sin(theta); (rho - x(2,:).*cos(theta))./sin(theta)];
    
    hold on;
    figure(6);
    imshow(img_input);
    line(x, y,'Color','b');
    hold off;