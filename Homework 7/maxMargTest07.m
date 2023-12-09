% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

clear all;
close all;
clc;

% Load data.
load('07.mat');

% Set up kernel.
K = @(x, y) (x*y').^2;

% Call dual QP with kernel.
[alphas, idx] = maxMarg07( X, y, K );

% Consider only data points corresponding to non-zero alphas.
alphas_idx = alphas(idx);
X_idx = X(idx, :);
y_idx = y(idx);

% Initialize average d_0.
d_0 = 0;

% Initialize G(x) and grid.
x1 = -1:0.02:1;
x2 = -1:0.02:1;
G = zeros(length(x1), length(x2));

% Calculate average d_0.
D = 1./y_idx - sum(alphas_idx.*y_idx'.*K(X_idx,X_idx));
d_0 = sum(D)/length(D);

% Calculate G(x) on grid.
[X1,X2] = meshgrid(x1,x2);
G = sign(sum(alphas_idx.*y_idx'.*K(X_idx,[X1(:),X2(:)])) + d_0);
G = reshape(G,length(x1),length(x2));

% Plot given data and classification results.
figure(1);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
set(gcf, 'PaperOrientation', 'landscape');
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 29.7 21]);
set(gcf, 'PaperSize', [29.7 21.0]);
subplot(1, 2, 1);
plot(X(y ==  1, 1), X(y ==  1, 2), 'k+', 'MarkerSize', 15); hold on;
plot(X(y == -1, 1), X(y == -1, 2), 'kx', 'MarkerSize', 15);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Given data', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.1 1.1]);
ylim([-1.1 1.1]);
legend('+1', '- 1', 'Location', 'NorthEast') 
subplot(1, 2, 2);
surface(x1, x2, G, 'EdgeColor', 'none');
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Classification results', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1 1]);
ylim([-1 1]);
colormap([0.75 0.75 0.75; 0.25 0.25 0.25]);
colorbar('YTick', [-0.5 0.5], 'YTickLabel', {' - 1', ' +1'}, 'FontSize', 14, 'FontWeight', 'bold');

print('-dpng', '1.png', '-r150');