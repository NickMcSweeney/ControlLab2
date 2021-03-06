clear all; close all; clc;

inverted_pendulum=InvertedPendulum; %create an inverted pendulum instance
axis([-1.2,1.2,-1.2,1.2]); grid on; %adjust the visualization settings

inverted_pendulum.x_=[0.3; 0]; %set the initial state (x=[theta; dtheta])
inverted_pendulum.dt_= 5*1e-3;   %set the sampling rate

%Simulation duration
tf=8;
t=linspace(0,tf,tf/inverted_pendulum.dt_);

G = [9.86; 0.048; 3.87];
K = [11.81 3];

control = PIDController(inverted_pendulum.dt_);

x_vec = zeros(1,length(t));

for i=1:length(t)
	tic;
    e = -inverted_pendulum.x_(1);
	%inverted_pendulum.u_ = control.my_pid(e, G); %set the control input at the current time step
    inverted_pendulum.u_ = -K*inverted_pendulum.x_;

	inverted_pendulum.x_=inverted_pendulum.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector

    x_vec(i) = inverted_pendulum.x_(1);

	duration=toc;

	pause(inverted_pendulum.dt_-duration); %a crude way of making the visualization appear in real-time
end

pause; clf;
plot(1:length(t),x_vec, 'b-');
pause; clf;


function X = pendulum(x)
    K = [10.81 -2];
    X = (9.81)*sin(x(1)) - K*x;
end
