clear all; close all; clc;

segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]*3.35; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate

%Simulation duration
tf=3;
t=linspace(0,tf,tf/segway.dt_);

k1 =   -2.2599;
k2 =   -4.7081;
k3 =   56.8799;
k4 =   14.7081;

K = [k1 k2 k3 k4];

a_vec = zeros(1,length(t));
a_vec = zeros(2,length(t));

for i=1:length(t)
	segway.u_ = -K*segway.x_; %set the control input at the current time step
    tic;
	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
	t=toc;

    a_vec(1,i) = segway.x_(1);
    a_vec(2,i) = segway.x_(3);

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end

clf;
segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]*3.34; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate
tf=4;
t=linspace(0,tf,tf/segway.dt_);

b_vec = zeros(1,length(t));
b_vec = zeros(2,length(t));
for i=1:length(t)
	segway.u_ = -K*segway.x_; %set the control input at the current time step
    tic;
	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
    b_vec(1,i) = segway.x_(1);
    b_vec(2,i) = segway.x_(3);
	t=toc;

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end

clf;
segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]*3.33; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate
tf=6;
t=linspace(0,tf,tf/segway.dt_);

c_vec = zeros(1,length(t));
c_vec = zeros(2,length(t));
for i=1:length(t)
	segway.u_ = -K*segway.x_; %set the control input at the current time step
    tic;
	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
    c_vec(1,i) = segway.x_(1);
    c_vec(2,i) = segway.x_(3);
	t=toc;

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end
close all; clf;
plot(1:length(a_vec(1,:)*2*1e-3),a_vec(1,:), 'g--');
hold on;
plot(1:length(b_vec(1,:)*2*1e-3),b_vec(1,:), 'r-.');
plot(1:length(c_vec(1,:)*2*1e-3),c_vec(1,:), 'k--.');
hold off;
pause; clf;
plot(1:length(a_vec(2,:)*2*1e-3),a_vec(2,:), 'g--');
hold on;
plot(1:length(b_vec(2,:)*2*1e-3),b_vec(2,:), 'r-.');
plot(1:length(c_vec(2,:)*2*1e-3),c_vec(2,:), 'k--.');
hold off;
