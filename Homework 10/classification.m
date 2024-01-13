function [y] = classification( X, g, g_bias, h, h_bias )
% Input
% -----
%
% X                 ... Data point.
%                       [ x_1, x_2, x_3]
%
% g,h               ... weigths of layers.
%                       [ w_11, w_12, w_13, 
%                         w_21, w_22   ... ]
%
% g_bias, h_bias    ... bias of layers.
%                       [ b_1, b_2, ... ]

% Output
% ------
%
% y                 ... Network output.
%

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

% Calculating size of model
number_of_datapoints = size(X,1);
number_of_input_nodes = size(X,2);
number_of_hidden_nodes = size(h,1);
number_of_output_nodes = size(h,2);

% Initialising output of this function
y = zeros([size(X,1), number_of_output_nodes])';

% Initialising activation function
AF = @(x) 1 / (1 + exp(-x));


% Calculating...............................
for i = 1:number_of_datapoints

    % Initialising and zeroing nodes
    hidden_nodes = zeros([number_of_hidden_nodes,1]);
    output_nodes = zeros([number_of_output_nodes,1]);
    
    % Input data into input layer
    input_nodes = X(i,:)';

    % Calculating hidden layer values
    for j = 1:number_of_input_nodes
        for k = 1:number_of_hidden_nodes
            hidden_nodes(k) = hidden_nodes(k) + g(j,k)*input_nodes(j);
        end
    end

    % Applying activation function and bias
    for k = 1:number_of_hidden_nodes
        hidden_nodes(k) = AF(hidden_nodes(k) + g_bias(k));
    end

    % Calculating output layer values without activation function or bias
    for j = 1:number_of_hidden_nodes
        for k = 1:number_of_output_nodes
            output_nodes(k) = output_nodes(k) + h(j,k)*hidden_nodes(j);
        end
    end

    % Applying threshold function and bias (because output can be only 0 or 1)
    for k = 1:number_of_output_nodes
        y(k,i) = round(AF(output_nodes(k) + h_bias(number_of_output_nodes)));
    end
    
    % Applying a threshold function (because output can be only 0 or 1) 
    % for j = 1:number_of_output_nodes
    %     y(i,j) = round(output_nodes(j));
    % end
end
end