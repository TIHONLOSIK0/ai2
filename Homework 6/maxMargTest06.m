clear all;
close all;
clc;

if (exist('output.txt', 'file'))
    delete('output.txt');
end

diary('output.txt');

% ------------------------------------------------------------------------
% Test instance #1.
X = [1 1; 0 1; 2 2; 1 2];
y = [1 -1 1 -1];

[exitflag, w, d, margin, dists, alphas, sv] = maxMarg06( X, y );

disp('Test instance #1.');
disp('-----------------');
if (exitflag ~= 1)
    disp('No solution found.');
    disp(' ');
else
    disp('Weight vector w = ');
    disp(w);
    disp('Distance d = ');
    disp(d);
    disp('Margin = ');
    disp(margin);
    disp('Distances = ');
    disp(dists);
    disp('Lagrange multipliers = ');
    disp(alphas);
    disp('Support vectors = ');
    disp(sv);
end

figure(1);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 3], 1), X([1 3], 2), 'b.', 'MarkerSize', 23); hold on; 
plot(X([2 4], 1), X([2 4], 2), 'r.', 'MarkerSize', 23);
if (exitflag ~= 1)
    text(3, 3, 'No solution found.', 'FontSize', 16, 'FontWeight', 'bold');
else
    x1 = -0.25:0.01:5.25;
    x2 = -w(1)/w(2) * x1 - d/w(2);
    plot(x1, x2, 'k', 'LineWidth', 2);
end
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Test instance #1', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-0.25 5.25]);
ylim([-0.25 5.25]);
grid on;

saveas(gcf, '1.pdf');

% ------------------------------------------------------------------------
% Test instance #2.
X = [0 1; 1 1; 2 2; 1 2];
y = [1 -1 1 -1];

[exitflag, w, d, margin, dists, alphas, sv] = maxMarg06( X, y );

disp('Test instance #2.');
disp('-----------------');
if (exitflag ~= 1)
    disp('No solution found.');
    disp(' ');
else
    disp('Weight vector w = ');
    disp(w);
    disp('Distance d = ');
    disp(d);
    disp('Margin = ');
    disp(margin);
    disp('Distances = ');
    disp(dists);
    disp('Lagrange multipliers = ');
    disp(alphas);
    disp('Support vectors = ');
    disp(sv);
end

figure(2);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 3], 1), X([1 3], 2), 'b.', 'MarkerSize', 23); hold on;
plot(X([2 4], 1), X([2 4], 2), 'r.', 'MarkerSize', 23);
if (exitflag ~= 1)
    text(3, 3, 'No solution found.', 'FontSize', 16, 'FontWeight', 'bold');
else
    x1 = -0.25:0.01:5.25;
    x2 = -w(1)/w(2) * x1 - d/w(2);
    plot(x1, x2, 'k', 'LineWidth', 2);
end
hold off;
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Test instance #2', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-0.25 5.25]);
ylim([-0.25 5.25]);
grid on;

saveas(gcf, '2.pdf');

% ------------------------------------------------------------------------
% Test instance #3.
X = [1 1; 0 1; 2 2; 1 2.5];
y = [1 -1 1 -1];

[exitflag, w, d, margin, dists, alphas, sv] = maxMarg06( X, y );

disp('Test instance #3.');
disp('-----------------');
if (exitflag ~= 1)
    disp('No solution found.');
    disp(' ');
else
    disp('Weight vector w = ');
    disp(w);
    disp('Distance d = ');
    disp(d);
    disp('Margin = ');
    disp(margin);
    disp('Distances = ');
    disp(dists);
    disp('Lagrange multipliers = ');
    disp(alphas);
    disp('Support vectors = ');
    disp(sv);
end

figure(3);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 3], 1), X([1 3], 2), 'b.', 'MarkerSize', 23); hold on; 
plot(X([2 4], 1), X([2 4], 2), 'r.', 'MarkerSize', 23);
if (exitflag ~= 1)
    text(3, 3, 'No solution found.', 'FontSize', 16, 'FontWeight', 'bold');
else
    x1 = -0.25:0.01:5.25;
    x2 = -w(1)/w(2) * x1 - d/w(2);
    plot(x1, x2, 'k', 'LineWidth', 2);
end
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Test instance #3', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-0.25 5.25]);
ylim([-0.25 5.25]);
grid on;

saveas(gcf, '3.pdf');

diary off;