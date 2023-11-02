function [v, pred] = bruteForce(X, Y, U)
    % X: Training data
    % Y: Labels for training data
    % U: Data points to be classified

    m = size(X, 1); % number of data points in the training set
    
    % initialize distance vector v and classification pred
    v = zeros(m, 1);
    pred = zeros(size(U, 1), 1);
    
    % loop through each data point in U
    for i = 1:size(U, 1)
        % loop through each data point in X to calculate distances
        for j = 1:m
            % calculate euclidean distance between U(i,:) and X(j,:)
            v(j) = sqrt(sum((U(i, :) - X(j, :)).^2));
        end
        
        % Find the class of the nearest neighbor (minimum distance)
        [~, minIdx] = min(v);
        pred(i) = Y(minIdx);
    end
end