function [P] = pressure(Y,gamma)
%Computes pressure using the equation of state of a perfect fluid

global dim;

E = Y(dim+1,:);
rho = Y(end-2,:);

P = (gamma-1)*rho.*E;

end

