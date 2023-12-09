function [alphas, idx] = maxMarg07( X, y, K )
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
%              [ s_1, s_2, s_3, ... ]
%
% K        ... Kernel.
%              @(x, y) ...

% Output
% ------
%
% alphas   ... Lagrange multipliers.
%
% idx      ... Indices of non-zero alphas.

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824


n = size(X,1);
Q = (y' * y) .* K(X,X);
f = -1*ones([n,1]);
A = [];
b = [];
Aeq = y;
beq = 0;
lb = zeros([n,1]);
ub = 1000*ones([n,1]);

[alphas, ~, ~] = quadprog(Q,f,A,b,Aeq,beq,lb,ub);
idx = find(alphas >= 1e-9);

end