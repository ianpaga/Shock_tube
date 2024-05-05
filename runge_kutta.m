function [Yn,P] = runge_kutta(Y, N,dt)
%4th-order-Runge-Kutta Method. 

gamma = 1.4;  
%%
    [~,rho,~] = forces(Y,N);
    [P] = pressure(Y,gamma);
    
    [a,~,~] = forces(Y,N);
    [b,~,~] = forces(Y+a*dt/2, N); 
    [c,~,~] = forces(Y+b*dt/2, N);
    [d,~,~] = forces(Y+c*dt, N);
    
    %Runge-kutta update
    Yn = Y + (1/6)*dt*a + (1/3)*dt*b + (1/3)*dt*c + (1/6)*dt*d; 
    
    Yn(4,:) = rho;
    

end