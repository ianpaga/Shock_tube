%Code for plotting and creation of video of simulation

N = 400;
NT=400;
dt =0.001;

t = zeros(NT,1);

vidobj = VideoWriter('shockwave.avi');
vidobj.Quality = 100;
open(vidobj);
%set(gca,'nextplot','replacechildren');
 
for n=1:NT
    
    t(n+1) = t(n) + dt;
   
    %% Plotting
    set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0, 0.7, 0.7]);
    subplot(2,2,1)
    plot(Ytime1(3,:,n),Ytime1(1,:,n),'.r','MarkerSize',9);
    axis([-0.4 0.4 0 1.8]);
    xlabel('x(m)'); 
    ylabel('Velocity[m/s]');
    title('Velocity');
    grid on
    
    subplot(2,2,2)
    plot(Ytime1(3,:,n),Ytime1(2,:,n),'.g','MarkerSize',9);
    axis([-0.4 0.4 1.6 2.8]);
    xlabel('x(m)'); 
    ylabel('Internal Energy[J/Kg]');
    title('Internal Energy');
    grid on
    
    subplot(2,2,3)
    plot(Ytime1(3,:,n),Ytime1(4,:,n),'.b','MarkerSize',9);
    axis([-0.4 0.4 0 1.2]);
    xlabel('x(m)'); 
    ylabel('Density[Kg/m^3]');
    title('Density');
    grid on
    
    subplot(2,2,4)
    plot(Ytime1(3,:,n),Ptime(:,:,n),'.k','MarkerSize',9);
    axis([-0.4 0.4 0 1.2]);
    xlabel('x(m)'); 
    ylabel('Pressure[N/m^2]');
    title('Pressure');
    grid on
    
    %%
    currframe = getframe(gcf);
    writeVideo(vidobj,currframe);   
    
end
close(vidobj);