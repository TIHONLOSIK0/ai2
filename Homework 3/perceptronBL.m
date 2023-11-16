%--------------------------------------------------------------------------
% Submission of:
% Tikhon Riazantsev 382715
% Agastya Heryudhanto 286824
%--------------------------------------------------------------------------

function [ w, iter, exitflag ] = perceptronBL( X, w, eta, maxIter )

% Input
% -----
%
% X        ... Data points and class labels.
%              [ x_11, x_12, s_1;
%                x_21, x_22, s_2;
%                x_31, x_32, s_3;
%                ...              ]
%
% w        ... Initial weight vector.
%              [ w_1; w_2 ]
%
% eta      ... Step size.
%
% maxIter  ... Maximum number of iterations.

% Output
% ------
%
% w        ... Final weight vector.
%
% iter     ... Number of iterations needed.
%
% exitflag ... Exit flag.
%              0 = No solution found, maximum number of iterations reached.
%              1 = Solution found.

% Determine number of data points.
n = size(X, 1);

% Initialize iteration counter, exit condition and exit flag.
iter     = 0;
exit     = 0;
exitflag = 0;

% While exit condition not met... 
while ((~exit) && (iter < maxIter))
    % Increment iteration counter.
    iter = iter + 1;
    
    % ---------------------------------
    StartTime = 0;
    % additional exit condition, checks if process takes too much time
    StopTime = 8;  % 8 seconds
if StartTime == 0 
    StartTime = tic; % begins counting time.
end
        % Updates the weight vector, stores the current weight vector in
        % variable w_prev which will be used to check for convergence later
        w_prev = w;


        % begins loop to Iterate through each data point i in Matrix 'X'
        for i = 1:n
            
            x_i = X(i, 1:end-1);  % Get current data point i, stores in temporary variable
            s_i = X(i, end);      % get current label for data point i, stores in temporary variable

            % Calls perceptronOutput function for data point i
            y_i = perceptronOutput(x_i, w);

            % Update the weight adjustment vector
            sigma_w = sigma_w + (s_i - y_i) * x_i';

        end % This Loop only updates the weighting and accumulates in a summed vector

            % perceptron formula for learning. In batch learning, this is applied
            % only once with the sum of all adjustments made to the weight
            % vector
            w = w + eta * sigma_w;

        % Implementation for exit condition, check for convergence by
        % measuring the change/adjustment in the weight vector, taking the
        % norm of the vector. if improvements are miniscule, weight vector
        % is good enough.
        epsilon = 1e-2;
        if norm(w - w_prev) < epsilon 
            exit = 1; % exit variable set to true when epsilon is very small
        end
        fprintf('Iteration %d: norm(w - w_old) = %f\n', iter, norm(w - w_prev));

        % additional exit condition, time processed exceeds 8 seconds
    if toc(StartTime) >= StopTime
        disp('Process takes longer than 8 seconds, PBPL halted');
        exit = 1; % if algorithmn converges too slowly, exits
    end
   
    end

    % Set exitflag based on the exit condition
    if exit
        exitflag = 1;
        % Additional exit condition If the maximum number of iterations 
        % is reached without convergence, set exitflag to 0
    if iter == maxIter && ~exit
        exitflag = 0;
fprintf('Maximum iterations reached without convergence.\n');
    % ---------------------------------
    
end

end
