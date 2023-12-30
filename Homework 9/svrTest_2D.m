clear all;
close all;
clc;

% --------------------------------------------------
% Test instance 2-D data.
% --------------------------------------------------
x1 = -3:0.1:3;
x2 = -3:0.1:3;
[X1, X2] = meshgrid(x1, x2);
mu = [0, 0];
sigma = eye(2);
F = mvnpdf([X1(:) X2(:)], mu, sigma);
F = reshape(F, length(x1), length(x2));

nSamples = 40;
X = zeros(nSamples, 2);
y = zeros(1, nSamples);
for i = 1:nSamples
    xi = ceil(rand() * length(x1));
    yi = ceil(rand() * length(x2));
    X(i, 1) = x1(xi);
    X(i, 2) = x2(yi);
    y(i) = F(xi, yi);
end

% Set up kernel.
K = @(x, y) exp(-norm(x-y).^2);

% Set up parameters.
epsilon = 0.0001;
C = 1;

% Call dual QP with kernel.
[alphas, alphas_dash, d] = svrTrain(X, y, K, epsilon, C);

% Calculate regression line / regression plane.
x1 = -3:0.1:3;
x2 = -3:0.1:3;
f = svrProduce(X, K, alphas, alphas_dash, d, x1, x2);

% Plot results.
svrPlot(x1, x2, F, X, y, f);

text(0, 0, 0.21, 'K(x,y) = exp(-norm(x-y)^2)', 'FontSize', 14, 'FontWeight', 'bold');
text(0, 0, 0.20, ['nSamples: ' num2str(nSamples)], 'FontSize', 14, 'FontWeight', 'bold');

print('-dpng', '2D.png', '-r150');