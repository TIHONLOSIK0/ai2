function [alphas, idx, d] = smoTrain( X, y, K, C, eps, maxIter )
% Input
% -----
%
% X        ... Data points.
%              [ x_11, x_12;
%                x_21, x_22;
%                x_31, x_32;
%                ...              ]
%
% y        ... Class labels.
%              [ s_1; s_2; s_3; ... ]
%
% K        ... Kernel.
%              @(x, y) ...
%
% C        ... SVM hyperparameter.
%
% eps      ... User-defined epsilon.
%
% maxIter  ... Maximum number of iterations.

% Output
% ------
%
% alphas   ... Lagrange multipliers.
%
% idx      ... Indices of non-zero alphas.
%
% d        ... Parameter d.

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

rng("shuffle");

% Initialise all variables
n = size(X,1);
d = 0;
alphas = zeros([n,1]);
numIter = 1;
KKT_met = false;

% Training
while (numIter <= maxIter) & (~KKT_met)
    numIter = numIter + 1;
    KKT_met = true;
    for i = 1:n
        alpha_old_i = alphas(i);

        % KKT conditions mentioned in the slides do not work here (as all
        % alphas are 0 in the first iteration). This is why we are using
        % (slightly) different KKT conditions from a Standford course
        % https://cs229.stanford.edu/materials/smo.pdf
        E_i = sum(alphas .* y' .* K(X, X(i,:))) + d - y(i);
        if ((y(i)*E_i < -eps) && (alpha_old_i < C)) || ...
                ((y(i)*E_i > eps) && (alpha_old_i > 0))
            
            KKT_met = false;
            
            % Randomly select j != i
            j = randi([1, n-1]);
            if j >= i 
                j = j + 1;
            end

            % Calculate alpha_old_j and E_j
            alpha_old_j = alphas(j);
            E_j = sum(alphas .* y' .* K(X, X(j,:))) + d - y(j);

            % Calculate eta and check for ability to compute new alphas
            eta = -K(X(i, :), X(i, :)) - K(X(j, :), X(j, :)) + 2 * K(X(i, :), X(j, :));
            if eta >= 0 
               continue;
            end

            % Calculate H and L and check for ability to compute new alphas
            if y(i) == y(j)
                L = max(0, alpha_old_i + alpha_old_j - C);
                H = min(C, alpha_old_i + alpha_old_j);
            else
                L = max(0, alpha_old_j - alpha_old_i);
                H = min(C, C + alpha_old_j - alpha_old_i);
            end
            if (L == H)
                continue;
            end

            % Calculate alpha j new and new clipped
            alpha_new_j = alpha_old_j - (y(j)*(E_i - E_j))/eta;
            
            if alpha_new_j >= H
                alpha_new_j_clipped = H;
            elseif alpha_new_j <= L
                alpha_new_j_clipped = L;
            else
                alpha_new_j_clipped = alpha_new_j;
            end
            
            if norm(alpha_new_j_clipped - alpha_old_j, 2) < eps
                continue 
            end

            % Calculate alpha i new
            alpha_new_i = alpha_old_i + y(i)*y(j)*(alpha_old_j - ...
                alpha_new_j_clipped);
            %{
            % Calculate d (once again a bit differently than in the slides)
            % If needed you can look in the previously linked pdf
            d1 = d - E_i - y(i)*(alpha_new_i - alpha_old_i)*K(X(i,:),X(i,:)) - ...
                    y(j)*(alpha_new_j_clipped - alpha_old_j)*K(X(i,:),X(j,:));
            d2 = d - E_j - y(i)*(alpha_new_i - alpha_old_i)*K(X(i,:),X(j,:)) - ...
                    y(j)*(alpha_new_j_clipped - alpha_old_j)*K(X(j,:),X(j,:));

            if (alpha_new_i > 0) && (alpha_new_i < C)
                d = d1;
            elseif (alpha_new_j_clipped > 0) && (alpha_new_j_clipped < C)
                d = d2;
            else
                d = (d1+d2)/2;
            end
            %}
            
            % Normal human way of calculating d
            d = 1/y(i) - sum(alphas .* y' .* K(X, X(i, :))); 

            % Store values in alphas array
            alphas(i) = alpha_new_i;
            alphas(j) = alpha_new_j_clipped;
        end
    end
end

% Find idx

idx = find(alphas >= eps);

end
