%--------------------------------------------------------------------------
% Submission of:
% Tikhon Riazantsev 382715
% Agastya Heryudhanto 286824
%--------------------------------------------------------------------------

function [ f ] = perceptronOutput( x, w )

% Input
% -----
%
% x ... Data point.
%
% w ... Weight vector.
%       [ w_1; w_2 ]

% Output
% ------
%
% f ... Perceptron output characteristic.

% ---------------------------------
% If dot product of x and w is less than 0, output -1, else output 1

if dot(x,w) < 0 
    f = -1;
else
    f = 1;
end

% ---------------------------------

end