function [exitflag, w, d, margin, dists] = maxMarg( X, y )
   

% Input
% -----
%
% X        ... Data points and class labels.
%              [ x_11, x_12;
%                x_21, x_22;
%                x_31, x_32;
%                ...              ]
%
% y        ... Class labels.
%              [ s_1; s_2; s_3; ... ]

% Output
% ------
%
% exitflag ... Exitflag of quadprog.
%
% w        ... Weight vector.
%
% d        ... Distance from the origin.
%
% margin   ... Margin.
%
% dists    ... Distances of each data point to the separating plane.

%--------------------------------------------------------------------------
% Submission of:
% Tikhon Riazantsev 382715
% Agastya Heryudhanto 286824
%--------------------------------------------------------------------------
% YOUR IMPLEMENTATION GOES HERE...
% Setup Ax =< b || Ax + b >= 0
A = -diag(y) * X; % Inequality constraints matrix  
n = size(X, 1); % set size of inequality constraint vector b, 
b = -ones(n, 1); % Vector b

%Objective function: f(w)= 1/2*w^T*H*w
% Utilizing the quadprog solver function in MATLAB needs input arguments:
H = eye(size(X, 2)); % Hessian Quadratic term of objective function
f = zeros(size(X, 2), 1); % Linear term, a zero vector because there is no
%linear term in the objective function.

% Solve the quadratic programming problem, other arguments can be set by []
[w, fval, exitflag] = quadprog(H, f, A, b); %outputs weight, fval, exitflag
% w = weights, used to determine separation plane, fval is end value to
% solution found and isn't needed, exitflag outputs 1 if solution found,
% else 0

% Distance from origin (0,0) calculated by square root (X^2 + y^2). 1/abs(w)
d = 1 / norm(w); % same as taking 1/norm if w is a normal vector to 
% the sepparating plane

% maximum margin calculated by w^T*x + d = +-1, 1/abs(w)
margin = 2 / norm(w); %take range of values from plane

% Calculating distances from each data point to the separating plane
dists = abs(A * w + b);


end
