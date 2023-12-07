% Define the function f(x1, x2)
f = @(x1, x2) -x1.^2 - 2.*x2.^2 + (15/2);
% Define the function g(x1, x2)
g = @(x1) (3/2) - x1;

% Define the contour levels
levels = 1:10;

% Define the range and grid of x1 and x2 values
x1 = linspace(-3, 3, 100);
x2 = linspace(-3, 3, 100);
[X1, X2] = meshgrid(x1, x2);

% Compute the values of f(x1, x2) at each point in the grid
Z = f(X1, X2);

% Create the contour plot
contourf(X1, X2, Z, levels);

% Plot the function g(x1, x2)
hold on; % keeps current plot when adding all contours
plot(x1, g(x1), 'r', 'LineWidth', 2);
title('Contour plot of f(x1, x2) and line plot of g(x1, x2)');
xlabel('x1');
ylabel('x2');
colorbar;


