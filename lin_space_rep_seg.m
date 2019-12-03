%% Problem 2.2 %%
syms TH dd_X ddTH u;

% constants
g = 9.81;
l = 1;
m = 1;
M = 1;

% small angle approx
sin_TH = TH;
cos_TH = 1;
dTH2 = 0;

ddTH = (g/l)*sin_TH+(1/l)*dd_X*cos_TH;
ddX = (1/(M+m))*(u + m*l*ddTH*cos_TH - m*l*dTH2*sin_TH);
% (9.81*TH)/2 + dd_X/2 + u/2
ddX = ddX*2 - dd_X;
% 9.81 * TH  + u

%% Problem 2.3 %%
% r = [B AB ... A^1 B] * [u_n-1;...;u_1;u_0]
% rank(r) = n

syms x dx th dth g_;
A = [0,1,0,0;0,0,9,0;0,0,0,1;0,0,2*g_,0];
x_ = [x;dx;th;dth];
B = [0;1;0;1];

r = [B A*B A*A*B A*A*A*B];
n = rank(r);
% n === 4
% therefore controlable...

%% Problem 2.4 %%
syms k1 k2 k3 k4 lambda;
I = eye(4); % the identity matrix
K = [k1,k2,k3,k4];
u = -K*x_;
Dx = A*x_+B*u;
% fx is equal to:
%                                           dx
%        9*th - dth*k4 - dx*k2 - k3*th - k1*x
%                                         dth
% (981*th)/50 - dth*k4 - dx*k2 - k3*th - k1*x

eigValMat = (A - B*K)-lambda*I; % calculate the matrix to be solved to obtain eigenvalues
% eigValMat is equal to:
%[ -lambda,             1,           0,             0]
%[     -k1, - k2 - lambda,      9 - k3,           -k4]
%[       0,             0,     -lambda,             1]
%[     -k1,           -k2, 981/50 - k3, - k4 - lambda]
det_eigMat = det(eigValMat); % take determinite
% 9*k1 - 2*g_*k1 + 9*k2*lambda - 2*g_*lambda^2 + k1*lambda^2 + k2*lambda^3 + k3*lambda^2 + k4*lambda^3 + lambda^4 - 2*g_*k2*lambda
%
some = det(lambda*I-A);
%lambda = sqrt(2*g_);
eig = -1;
l1=eig;l2=eig;l3=eig;l4=eig;
f_lam=expand((lambda-l1)*(lambda-l2)*(lambda-l3)*(lambda-l4));
%disp(f_lam);
% lambda^4 - 4*lambda^3 + 6*lambda^2 - 4*lambda + 1
%
% given f(lambda) = lambda^4 - 4*lambda^3 + 6*lambda^2 - 4*lambda + 1
% lambda^4 + (k2+k4)lambda^3 + (k3+k1-2*g)lambda^2 + (9*k2 - 2*g*k2)lambda + (9*k1 - 2*g*k1)
% -4 = k2+k4
% 6 = (k3+k1-2*g)
% -4 = (9*k2 - 2*g*k2)
% 1 = (9*k1 - 2*g*k1)

K_ = [0,1,0,1,-4;1,0,1,0,6+2*g_;0,9-2*g_,0,0,-4;9-2*g_,0,0,0,1];
k_rd = rref(K_);
%disp(k_rd);
% [ 1, 0, 0, 0,                      -1/(2*g_ - 9)]
% [ 0, 1, 0, 0,                       4/(2*g_ - 9)]
% [ 0, 0, 1, 0, -(- 4*g_^2 + 6*g_ + 53)/(2*g_ - 9)]
% [ 0, 0, 0, 1,           -(8*(g_ - 4))/(2*g_ - 9)]

k1 =   -0.0942;
k2 =    0.3766;
k3 =   25.7142;
k4 =   -4.3766;

% alt:
eig = -1;
l1=eig;l2=eig;l3=eig*2;l4=eig*2;
f_lam=expand((lambda-l1)*(lambda-l2)*(lambda-l3)*(lambda-l4));
%disp(f_lam);
% lambda^4 + 6*lambda^3 + 13*lambda^2 + 12*lambda + 4
l_4 = 1;
l_3 = 6;
l_2 = 13;
l_1 = 12;
l_0 = 4;

K_ = [0,1,0,1,l_3;1,0,1,0,l_2+2*g;0,9-2*g,0,0,l_1;9-2*g,0,0,0,l_0];
k_rd = rref(K_);
%disp(k_rd);
% [ 1, 0, 0, 0,                    -4/(2*g_ - 9)]
% [ 0, 1, 0, 0,                   -12/(2*g_ - 9)]
% [ 0, 0, 1, 0, (4*g_^2 + 8*g_ - 113)/(2*g_ - 9)]
% [ 0, 0, 0, 1,        (6*(2*g_ - 7))/(2*g_ - 9)]

k1 =   -0.3766;
k2 =   -1.1299;
k3 =   32.9966;
k4 =    7.1299;

% alt:
eig = -1;
l1=eig;l2=eig*2;l3=eig*3;l4=eig*4;
f_lam=expand((lambda-l1)*(lambda-l2)*(lambda-l3)*(lambda-l4));
%disp(f_lam);
% lambda^4 + 10*lambda^3 + 35*lambda^2 + 50*lambda + 24
l_4 = 1;
l_3 = 10;
l_2 = 35;
l_1 = 50;
l_0 = 24;

K_ = [0,1,0,1,l_3;1,0,1,0,l_2+2*g;0,9-2*g,0,0,l_1;9-2*g,0,0,0,l_0];
k_rd = rref(K_);
%disp(k_rd);
% [ 1, 0, 0, 0,                    -24/(2*g_ - 9)]
% [ 0, 1, 0, 0,                    -50/(2*g_ - 9)]
% [ 0, 0, 1, 0, (4*g_^2 + 52*g_ - 291)/(2*g_ - 9)]
% [ 0, 0, 0, 1,          (20*(g_ - 2))/(2*g_ - 9)]
k1 =   -2.2599;
k2 =   -4.7081;
k3 =   56.8799;
k4 =   14.7081;
