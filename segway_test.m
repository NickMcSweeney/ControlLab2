clear all; close all; clc;

segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate

%Simulation duration
tf=8;
t=linspace(0,tf,tf/segway.dt_);


%k1 =   -0.0942;
%k2 =    0.3766;
%k3 =   25.7142;
%k4 =   -4.3766;

%k1 =   -0.3766;
%k2 =   -1.1299;
%k3 =   32.9966;
%k4 =    7.1299;

%k1 =   -2.2599;
%k2 =   -4.7081;
%k3 =   56.8799;
%k4 =   14.7081;

K = [k1 k2 k3 k4];
%persistent x = [0.01;0;0.3;0];

for i=1:length(t)
	segway.u_ = -K*segway.x_; %set the control input at the current time step
    tic;
	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
	t=toc;

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end
