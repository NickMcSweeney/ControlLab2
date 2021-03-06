clear all; close all; clc;

segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate

%Simulation duration
tf=2;
t=linspace(0,tf,tf/segway.dt_);

ak1 =   -0.0942;
ak2 =    0.3766;
ak3 =   25.7142;
ak4 =   -4.3766;

bk1 =   -0.3766;
bk2 =   -1.1299;
bk3 =   32.9966;
bk4 =    7.1299;

ck1 =   -2.2599;
ck2 =   -4.7081;
ck3 =   56.8799;
ck4 =   14.7081;

Ka = [ak1 ak2 ak3 ak4];
Kb = [bk1 bk2 bk3 bk4];
Kc = [ck1 ck2 ck3 ck4];

a_vec = zeros(1,length(t));
a_vec = zeros(2,length(t));

segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])

%for i=1:length(t)
%	segway.u_ = -Ka*segway.x_; %set the control input at the current time step
%    tic;
%	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
%	t=toc;
%
%    a_vec(1,i) = segway.x_(1);
%    a_vec(2,i) = segway.x_(3);
%
%	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
%end

clf;
segway=Segway; %create a 2D segway instance
axis([-3,3,-1.5,1.5]); pbaspect([3 1.5 1]); grid on; %adjust the visualization settings

segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate
tf=6;
t=linspace(0,tf,tf/segway.dt_);

b_vec = zeros(1,length(t));
b_vec = zeros(2,length(t));
for i=1:length(t)
	segway.u_ = -Kb*segway.x_; %set the control input at the current time step
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

segway.x_=[0.01; 0; 0.3; 0]; %set the initial state (x=[x; dx; theta; dtheta])
segway.dt_= 2*1e-3;   %set the sampling rate
tf=6;
t=linspace(0,tf,tf/segway.dt_);

c_vec = zeros(1,length(t));
c_vec = zeros(2,length(t));
for i=1:length(t)
	segway.u_ = -Kc*segway.x_; %set the control input at the current time step
    tic;
	segway.x_=segway.step; %integrate forward according to x_new=f(x,u,dt) and update the state vector
    c_vec(1,i) = segway.x_(1);
    c_vec(2,i) = segway.x_(3);
	t=toc;

	pause(segway.dt_-t); %a crude way of making the visualization appear in real-time
end
close all; clf;
plot(1:length(b_vec(1,:)*2*1e-3),b_vec(1,:), 'r-.');
hold on;
plot(1:length(c_vec(1,:)*2*1e-3),c_vec(1,:), 'g--');
hold off;
pause; clf;
plot(1:length(b_vec(2,:)*2*1e-3),b_vec(2,:), 'r-.');
hold on;
plot(1:length(c_vec(2,:)*2*1e-3),c_vec(2,:), 'g--');
hold off;
