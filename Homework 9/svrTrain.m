function [alphas, alphas_dash, d] = svrTrain( X, y, K, epsilon, C )
% Input
% -----
%
% X          ... Data points.
%                [ x_11, x_12;
%                  x_21, x_22;
%                  x_31, x_32;
%                  ...              ]
%
% y          ... Class labels.
%                [ s_1; s_2; s_3; ... ]
%
% K          ... Kernel.
%                @(x, y) ...
%
% epsilon    ... SVR parameter.
%
%
% C          ... SVR parameter.

% Output
% ------
%
% alphas     ... Lagrange multipliers.
%
% alphas_dash... Lagrange multipliers.
%
% d          ... Distance from the origin.

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824


m = size(X,1);
Q = zeros([m,m]);
for i = 1:m
    for j = 1:m
        Q(i,j) = K(X(i,:),X(j,:));
    end
end

H = [Q, -Q; -Q, Q];
f = epsilon.*ones([2*m, 1]) - [y'; -y'];
A = [];
b = [];
Aeq = [ones([m,1]); -ones([m,1])]';
beq = 0;
lb = zeros([2*m,1]);
ub = C.*ones([2*m,1]);

alphas_merged = quadprog(H,f,A,b,Aeq,beq,lb,ub);
alphas = alphas_merged(1:m,1);
alphas_dash = alphas_merged(m+1:end,1);
idx_alphas = find(alphas >= 1e-9);
idx_alphas_dash = find(alphas_dash >= 1e-9);

d_alphas = y(idx_alphas)' - ...
    sum((alphas - alphas_dash).*Q(:,idx_alphas))' - epsilon;
d_alphas_dash = y(idx_alphas_dash)' - ...
    sum((alphas - alphas_dash).*Q(:,idx_alphas_dash))' + epsilon;

d = (sum(d_alphas_dash) + sum(d_alphas)) / ...
    (length(d_alphas_dash) + length(d_alphas));

end