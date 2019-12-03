syms k1 k2 lambda Theta dTheta;


l = 1; % length of pendulum
g = 9.81; % gravity
c = 1; % control constant
K = [k1 k2]; % gain matrix <-- what we want to know;
x = [Theta;dTheta];
u = -K*x;

% Using the function: x_dot = A*x - B*K*x
%   solve for the vector k by obtaining the eigenvalues.

% ddTheta = (g/l)*sin(Theta) + c*u;
% by small angle theorem sin(Th) --> Th
% ddTheta = (g/l)*Theta + c*u;

% calculate A and B values plugging in the above equation
A = [0,1;(g/l),0];
B = [0;c];

% calculate THETA dot
THETA = A*x + B*u;
% THETA:
% [                 dTheta,                 dTheta]
% [ (981*Theta)/100 - k1*x, (981*Theta*x)/100 - k2]

I = eye(2); % the identity matrix

eigValMat = (A - B*K)-lambda*I; % calculate the matrix to be solved to obtain eigenvalues
% eigValMat:
% [      -lambda,             1]
% [ 981/100 - k1, - k2 - lambda]
det_eigMat = det(eigValMat); % take determinite
% det_eigMat:
% lambda^2 + k2*lambda + k1 - 981/100
%
% given f(lam) = (lam - lam1)(lam - lam2)
% lam1 = -1, lam2 = -2
% equivicate to determinite:
% lambda^2 + 3*lambda + 2 ==> lambda^2 + k2*lambda + k1 - 981/100
% k1 = 2+9.81 = 11.81;
% k2 = 3
