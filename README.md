Smoothed Particle Hydrodynamics solution to the Navier-Stokes equation: The shock tube 
====

Description: This code solves the Navier-Stokes equations under approximation of Smoothed Particle Hydrodynamics, or SPH, for short. For details on how the SPH approximation works,
we refer the reader to the pioneering article of [J. Monaghan (1992)](https://ui.adsabs.harvard.edu/abs/1992ARA%26A..30..543M/abstract). 

SPH is a Lagrangian scheme that is based on particle interpolation to compute smooth field variables. 
Such particles act as control masses and carry all physical properties of the system to be simulated. 
Because of its Lagrangian nature, SPH has clear advantages over traditional mesh-dependent Eulerian methods. 
For example, it does not suffer from mesh distortions that affect the numerical accuracy in simulations of large material deformations. 
Most importantly, advection is performed exactly, and therefore material history information can be tracked free of numerical diffusion

This code shows the solution to the shock tube in 1D, and we present the time evolution of the fluid quantities like pressure, density, internal energy and velocity
as a function of position. By running the file Shock_tube.m the solutions are saved in an array. By running video.m a movie is produced based on the solution of the previous program.

## Figures:

![shockwave](https://github.com/ianpaga/Shock_tube/assets/57350668/e7b45471-45e2-4bd2-8b71-2128db411c5d)
![results_wo_visco](https://github.com/ianpaga/Shock_tube/assets/57350668/c576a156-374d-4057-bb6e-e6d1a9c6272d)
![results_w_visco](https://github.com/ianpaga/Shock_tube/assets/57350668/10ff0c8f-c75d-4222-bb76-cbdc956ff74c)
[results_w_visco.pdf](https://github.com/ianpaga/Shock_tube/files/15214919/results_w_visco.pdf)
[initialconditions.pdf](https://github.com/ianpaga/Shock_tube/files/15214920/initialconditions.pdf)
![initialconditions](https://github.com/ianpaga/Shock_tube/assets/57350668/0479449f-5fe3-471f-a383-2bd3ff4df30a)
![initialpos](https://github.com/ianpaga/Shock_tube/assets/57350668/0ade78da-e228-401f-8f6e-d11de0770c9c)

## Requirements:

- MATLAB (version 2017 or later)
