clear all; close all; clc;

dT = 5*1e-3;
tf=4;
t = length(linspace(0,tf,tf/dT));
tspan = [0 50];
x_0 = [0.3;0];

%[T, X] = ode45(@pendulum, tspan, x_0);
[T, X] = rk4(@pendulum, tspan, x_0, dT);

pause; clf;
plot(T,X(:,1), 'b-');

function X = pendulum(t,x)
    K = [11.81 3];
    X = (9.81)*sin(x(1)) - K*x;
end
