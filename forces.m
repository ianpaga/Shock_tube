function [g,rho,P] = forces(Y,N)
%Forces function computes the SPH-apporximated Navier-Stokes equations and
%updates accordignly the state vector. 
global dim;
%%
gamma = 1.4;         
v = Y(1:dim,:);
mass = Y(end,:);

%Calling the NN-pair-search function here
[W_array,dWdx_array, niac,pair_i,pair_j] = NN_pairs(Y,N);

rho = density(Y,W_array,N,niac,pair_j,pair_i);
Y(end-2,:) = rho;

P = pressure(Y,gamma);  

dvdt = zeros(dim,N);
dedt = zeros(1,N);
drhodt = zeros(1,N);
dHdt= zeros(1,N);
dmdt= zeros(1,N);

%%
for k=1:niac
    
    i = pair_i(k);
    j = pair_j(k);
    
    %Computing the artificial viscosity term
    vscty = visco(i,j,Y,gamma);
    
    %SPH-approximated-Navier-Stokes equations
    
    A = (P(i)./(rho(i)^2) + P(j)./(rho(j)^2) + vscty);     
    
    dvdt(:,i) = dvdt(:,i) - mass(j)*A*dWdx_array(:,k); 
    dvdt(:,j) = dvdt(:,j) + mass(i)*A*dWdx_array(:,k);
     
    dedt(i) = dedt(i) + (1/2)*mass(j)*A*dot((v(:,i)-v(:,j)),dWdx_array(:,k));   
    dedt(j) = dedt(j) + (1/2)*mass(i)*A*dot((v(:,i)-v(:,j)),dWdx_array(:,k));   
 
end

dxdt = v;
g = [dvdt;dedt;dxdt;drhodt;dHdt;dmdt];

end