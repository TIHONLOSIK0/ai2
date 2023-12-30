function f = svrProduce( X, K, alphas, alphas_dash, d, x1, x2 )
% Input
% -----
%
% X          ... Data points.
%                [ x_11, x_12;
%                  x_21, x_22;
%                  x_31, x_32;
%                  ...              ]
%
% K          ... Kernel.
%                @(x, y) ...
%
% alphas     ... Lagrange multipliers.
%
% alphas_dash... Lagrange multipliers.
%
% d          ... Distance from the origin.
%
% x1         ... Domain of x1, e.g. [-3 -2 -1 0 1 2 3].
%
% x2         ... Domain of x2, e.g. [-3 -2 -1 0 1 2 3].

% Output
% ------
%
% f          ... Approximated values of f(x) on the domain(s) of x1 and x2.

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

x_domain = [x1' x2'];
n = size(x_domain,1);


if size(x_domain, 2) == 1
    f = zeros([n,1]);
    for i = 1:n
        f(i) = sum((alphas - alphas_dash) .* K(X,x_domain(i,:))) + d;
    end
else
    f = zeros([size(x1,2), size(x2,2)]);
    for i = 1:size(x1,2)
        for j = 1:size(x2,2)
            f_sum = 0;
            for k = 1:size(alphas,1)
                f_sum = f_sum + ((alphas(k) - alphas_dash(k)) .* K(X(k,:), [x1(i),x2(j)])); 
            end
            f(i,j) = f_sum + d;
        end
    end
end
end