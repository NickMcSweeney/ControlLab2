clear all; close all; clc;

inverted_pendulum=InvertedPendulum; %create an inverted pendulum instance
axis([-1.2,1.2,-1.2,1.2]); grid on; %adjust the visualization settings

inverted_pendulum.x_=[1.5; 0]; %set the initial state (x=[theta; dtheta])
inverted_pendulum.dt_= 5*1e-3;   %set the sampling rate

%Simulation duration
tf=8;
t=linspace(0,tf,tf/inverted_pendulum.dt_);

for i=1:length(t)
	tic;
	inverted_pendulum.u_ = 0; %set the control input at the current time step
		
	inverted_pendulum.x_=inverted_pendulum.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
	duration=toc;
	
	pause(inverted_pendulum.dt_-duration); %a crude way of making the visualization appear in real-time
end