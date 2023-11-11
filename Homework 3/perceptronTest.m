clear all;
close all;
clc;

if (exist('output.txt', 'file'))
    delete('output.txt');
end

diary('output.txt');

% ------------------------------------------------------------------------
% Perceptron test instance #1 (Pattern-by-pattern learning).
X       = [0 1 1; 1 0 -1; 0 -1 -1; -1 0 1];
w       = [0; -1];
eta     = 0.5;
maxIter = 10;

figure(1);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 4], 1), X([1 4], 2), 'k+', 'MarkerSize', 15, 'LineWidth', 2); hold on;
plot(X([2 3], 1), X([2 3], 2), 'ko', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Perceptron test instance #1 (Pattern-by-pattern learning).', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.25 1.25]);
ylim([-1.25 1.25]);

[wNew, iter, exitflag] = perceptronPBPL(X, w, eta, maxIter);

if (exitflag)
    x1 = [-1.25 1.25];
    x2 = -wNew(1) / wNew(2) * x1;
    plot(x1, x2, 'r-', 'LineWidth', 2); hold off;
else
    text(0, 0, 'No solution found.', 'FontSize', 14, 'FontWeight', 'bold');
    hold off;
end

saveas(gcf, '1-PBPL.pdf');

disp('Perceptron test instance #1 (Pattern-by-pattern learning).');
disp('----------------------------------------------------------');
disp(['           Exit flag:  ' num2str(exitflag)]);
disp(['       Weight vector:  ' num2str(wNew')]);
disp(['Number of iterations:  ' num2str(iter)]);


% ------------------------------------------------------------------------
% Perceptron test instance #1 (Batch learning).
figure(2);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 4], 1), X([1 4], 2), 'k+', 'MarkerSize', 15, 'LineWidth', 2); hold on;
plot(X([2 3], 1), X([2 3], 2), 'ko', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Perceptron test instance #1 (Batch learning).', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.25 1.25]);
ylim([-1.25 1.25]);

[wNew, iter, exitflag] = perceptronBL(X, w, eta, maxIter);

if (exitflag)
    x1 = [-1.25 1.25];
    x2 = -wNew(1) / wNew(2) * x1;
    plot(x1, x2, 'r-', 'LineWidth', 2); hold off;
else
    text(0, 0, 'No solution found.', 'FontSize', 14, 'FontWeight', 'bold');
    hold off;
end

saveas(gcf, '1-BL.pdf');

disp([13 'Perceptron test instance #1 (Batch learning).']);
disp('---------------------------------------------');
disp(['           Exit flag:  ' num2str(exitflag)]);
disp(['       Weight vector:  ' num2str(wNew')]);
disp(['Number of iterations:  ' num2str(iter)]);


% ------------------------------------------------------------------------
% Perceptron test instance #2 (Pattern-by-pattern learning). 
X       = [0 1 1; 1 0 -1; 0 -1 1; -1 0 -1];

figure(3);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 3], 1), X([1 3], 2), 'k+', 'MarkerSize', 15, 'LineWidth', 2); hold on;
plot(X([2 4], 1), X([2 4], 2), 'ko', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Perceptron test instance #2 (Pattern-by-pattern learning).', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.25 1.25]);
ylim([-1.25 1.25]);

[wNew, iter, exitflag] = perceptronPBPL(X, w, eta, maxIter);

if (exitflag)
    x1 = [-1.25 1.25];
    x2 = -wNew(1) / wNew(2) * x1;
    plot(x1, x2, 'r-', 'LineWidth', 2); hold off;
else
    text(0, 0, 'No solution found.', 'FontSize', 14, 'FontWeight', 'bold');
    hold off;
end

saveas(gcf, '2-PBPL.pdf');

disp([13 'Perceptron test instance #2 (Pattern-by-pattern learning).']);
disp('----------------------------------------------------------');
disp(['           Exit flag:  ' num2str(exitflag)]);
disp(['       Weight vector:  ' num2str(wNew')]);
disp(['Number of iterations:  ' num2str(iter)]);


% ------------------------------------------------------------------------
% Perceptron test instance #2 (Batch learning). 
figure(4);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
plot(X([1 3], 1), X([1 3], 2), 'k+', 'MarkerSize', 15, 'LineWidth', 2); hold on;
plot(X([2 4], 1), X([2 4], 2), 'ko', 'MarkerSize', 15, 'LineWidth', 2);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Perceptron test instance #2 (Batch learning).', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.25 1.25]);
ylim([-1.25 1.25]);

[wNew, iter, exitflag] = perceptronBL(X, w, eta, maxIter);

if (exitflag)
    x1 = [-1.25 1.25];
    x2 = -wNew(1) / wNew(2) * x1;
    plot(x1, x2, 'r-', 'LineWidth', 2); hold off;
else
    text(0, 0, 'No solution found.', 'FontSize', 14, 'FontWeight', 'bold');
    hold off;
end

saveas(gcf, '2-BL.pdf');

disp([13 'Perceptron test instance #2 (Batch learning).']);
disp('---------------------------------------------');
disp(['           Exit flag:  ' num2str(exitflag)]);
disp(['       Weight vector:  ' num2str(wNew')]);
disp(['Number of iterations:  ' num2str(iter)]);

diary off;