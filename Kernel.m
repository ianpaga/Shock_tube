function [W,dWdx] = Kernel(dx,h)
%Kernel or smoothing function
%This function determines the domain problem of the particle of interest
%by looking at the distance between particles and assigning them a weight
%accordingly.

global dim;                                   

alpha_1 = [1/h, 15/(7*pi*h^2), 3/(2*pi*h^3)];             

    r =norm(dx);
    R = r/h;
    
    if (R >= 0) && (R < 1) 
    W = alpha_1(dim)*(2/3 - R^2 + 1/2*R^3);
    dWdx = alpha_1(dim)*(-2 + 3/2*R)*(dx./h^2);  
    elseif (R >= 1) && (R < 2)
    W = alpha_1(dim)*1/6*(2-R)^3;
    dWdx = -alpha_1(dim)*1/2*(2-R)^2 *(dx./(h*r)); 
    else
    W = 0;
    dWdx = zeros(1,dim);             
    end

end