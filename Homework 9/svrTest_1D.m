clear all;
close all;
clc;

% --------------------------------------------------
% Test instance 1-D data.
% --------------------------------------------------
nSamples = 11;
X = linspace(-16, 16, nSamples)';
noiseFactor = 20;
y = ((X-5).^2 + 2 + noiseFactor * (rand(size(X)) - 0.5))';

% Set up kernel.
K = @(x, y) (x*y'+1).^2;

% Set up parameters.
epsilon = 0.0001;
C = 1000000;
    
% Call dual QP with kernel.
[alphas, alphas_dash, d] = svrTrain(X, y, K, epsilon, C);

% Calculate regression line / regression plane.
x1 = -16:0.05:16;
f = svrProduce(X, K, alphas, alphas_dash, d, x1, []);

% Plot results.
svrPlot(x1, [], (x1-5).^2 + 2, X, y, f);

text(5, 450, 'K(x,y) = (x*y+1)^2', 'FontSize', 14, 'FontWeight', 'bold');
text(5, 400, ['Noise factor: ' num2str(noiseFactor)], 'FontSize', 14, 'FontWeight', 'bold');
text(5, 350, ['nSamples: ' num2str(nSamples)], 'FontSize', 14, 'FontWeight', 'bold');
text(5, 300, ['Sampling interval: ' num2str(X(1)) ' - ' num2str(X(end))], 'FontSize', 14, 'FontWeight', 'bold');

print('-dpng', '1D.png', '-r150');