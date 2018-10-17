function h = hough(img_edge, num_r, num_theta)
    [rows, cols] = size(img_edge);
    h = zeros(num_r, num_theta);
    r_max = sqrt(rows^2 + cols^2);
    drho =  2*r_max/(num_r-1);
    dtheta = pi/num_theta;
    theta = [0:dtheta:(pi-dtheta)];    
    for u = 1:rows
        for v = 1:cols
            if img_edge(u, v) ==1                        
                for theta_index = 1:num_theta
                    rho = v*cos(theta(theta_index)) + u*sin(theta(theta_index));
                    r_index = round(rho/drho + num_r/2);
                    h(r_index, theta_index) = h(r_index, theta_index) + 1;
                end
            end
        end
    end
