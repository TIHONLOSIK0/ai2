function [exitflag, w, d, margin, dists, alphas, sv] = maxMarg05( X, y )

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
% d        ... Bias of Separating Plane.
%
% margin   ... Margin.
%
% dists    ... Distances of each data point to the separating plane.
%
% alphas   ... Lagrange multipliers.
%
% sv       ... Indices of support vectors.

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

n = size(X,1);
Q = (y' * y) .* (X * X');
f = -1*ones([n,1]);
A = [];
b = [];
Aeq = y;
beq = 0;
lb = zeros([n,1]);
ub = [];

[alphas, ~, exitflag] = quadprog(Q,f,A,b,Aeq,beq,lb,ub);

w_nonnormalised = (alphas' .* y) * X;
w = w_nonnormalised / norm(w_nonnormalised);

d = -1/2*(min(w * X(y==1,:)') + max(w * X(y==-1,:)'));
margin = 1/norm(w_nonnormalised);

dists = abs(w*X' + d);
sv = find(alphas >= 1e-10);



end