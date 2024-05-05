% Shock tube Main program 
% 
% This program solves the shock tube program by solving numerically the
% SPH-approximated Navier Stokes equations. Solutions are obtained by
% implementing a 4th order Runge-Kutta method.

format long

global dim;
dim = 1;
N = 400;
NT=400;
dt =0.001;

Ytime1 = zeros(6,N,NT);
Ptime = zeros(1,N,NT);

%% Initial conditions
        
mass = 0.001875*ones(1,N);

etha = 1.35;
t = zeros(NT,1);

v0 = zeros(dim,N);
E0(1:N-80) = 2.5*ones(1,N-80);
E0((N-80+1):N) = 1.795*ones(1,N-320);
X0(1:N-80) = linspace(-0.6,-0.001875, N-80);     
X0((N-80+1):N) = linspace(0.0075,0.6,N-320);
rho0(1:N-80) = 1*ones(1,N-80);
rho0((N-80+1):N) = 0.25*ones(1,N-320);

P(1:N-80) = 1*ones(1,N-80);
P((N-80+1):N) = 0.1795*ones(1,80);     

%H = etha*(mass./rho0).^(1/(dim)); 
H = 0.01*ones(1,N);

%Y = [v0;E0;X0;rho0];         
Y = [v0;E0;X0;rho0;H;mass];        %STATE VECTOR

%% 
for n=1:NT
    
    disp(n);
    
    %Runge-Kutta 
    [Y,P] = runge_kutta(Y, N,dt);
    t(n+1) = t(n) + dt;
    Ytime1(:,:,n) = Y;
    Ptime(:,:,n) = P; 
    
end

