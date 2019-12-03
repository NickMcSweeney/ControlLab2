clear all; close all; clc;

segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

%segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate

%Simulation duration
tf=8;
t=linspace(0,tf,tf/segway.dt_);

k1 =   -2.2599;
k2 =   -4.7081;
k3 =   56.8799;
k4 =   14.7081;

K = [k1 k2 k3 k4];

C = [1 0 0 0; 0 0 1 0];
A = [0,1,0,0;0,0,9,0;0,0,0,1;0,0,2*9.81,0];

P = [-36 -36 1 1];
L = place(transpose(A),transpose(C),P).';
disp(L);

a_vec = zeros(1,length(t));
a_vec = zeros(2,length(t));

scale = 1.15;
%x_hat = [0.01; 0; 0.3; 0]*scale;
%segway.x_ = x_hat;
segway.x_ = [0.01; 0; 0.3; 0];
x_hat = segway.x_*scale;
for i=1:length(t)
	segway.u_ = -K*x_hat; %set the control input at the current time step
    tic;
    x_ = segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector

    segway.x_ = x_ + L*(C*x_-C*x_hat);

	x_hat = segway.x_;
	t=toc;

    a_vec(1,i) = segway.x_(1);
    a_vec(2,i) = segway.x_(3);

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end
close all; clf;
plot(1:length(a_vec(1,:)*segway.dt_),a_vec(1,:), 'g--');
pause; clf;
plot(1:length(a_vec(2,:)*segway.dt_),a_vec(2,:), 'b--');
