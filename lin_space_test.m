clear all; close all; clc;

K = [10.81:2];

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
    K = [2;10.81];
    X = (9.81)*sin(x(1)) - K.*x;
end
