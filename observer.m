% Observability
%% 3.1
% the system is observable if the rank of the observability matrix is such that
syms g_;
A = [0,1,0,0;0,0,9,0;0,0,0,1;0,0,2*g_,0];
C = [1 0 0 0];
O = [C;C*A;C*(A*A);C*(A*A*A)];
% O =
%   [ 1, 0, 0, 0]
%   [ 0, 1, 0, 0]
%   [ 0, 0, 9, 0]
%   [ 0, 0, 0, 9]
% rank(O) = 4
% n = 4 == rank(O) = 4
% Observable? yes.

%% 3.2
syms x dx th dth g_ x_hat L u;
A = [0,1,0,0;0,0,9,0;0,0,0,1;0,0,2*g_,0];
A_ = [0,1,0,0;0,0,9,0;0,0,0,1;0,0,2*9.81,0];
B = [0;1;0;1];
C = [1 0 0 0];
x_ = [x;dx;th;dth];
y = C*x_;


Dx_hat = A*x_hat + B*u + L*(y-C*x_hat);

syms k1 k2 k3 k4 lambda l1 l2 l3 l4 e_;
I = eye(4); % the identity matrix
K = [k1,k2,k3,k4];
u = -K*x_;
Dx = A*x_+B*u;

e = (x_-x_hat);
L = [l1;l2;l3;l4];
De = (A-L*C)*e_;
%(A-L*C) =
% [ -l1, 1,    0, 0]
% [ -l2, 0,    9, 0]
% [ -l3, 0,    0, 1]
% [ -l4, 0, 2*g_, 0]

p = det((A-L*C)-lambda*I);
% ACTUAL: p = 9*l4 - 2*g_*l2 + 9*l3*lambda - 2*g_*lambda^2 + l1*lambda^3 + l2*lambda^2 + lambda^4 - 2*g_*l1*lambda
% DESIRED: (lambda + 1)^4 = lambda^4 + 4*lambda^3 + 6*lambda^2 + 4*lambda + 1
L_ = [1,0,0,0,4;0,-2*g_,0,0,6;-2*g_,0,9,0,4;0,-2*g_,0,9,1];
l_rd = rref(L_);
% [ 1, 0, 0, 0,              4]
% [ 0, 1, 0, 0,          -3/g_]
% [ 0, 0, 1, 0, (8*g_)/9 + 4/9]
% [ 0, 0, 0, 1,           -5/9]
l1 = 4;
l2 = -3/9.81;
l3 = (8*9.81)+4/9;
l4 = -5/9;

L = [l1;l2;l3;l4];
