clear;
close all;
clc;

% STUDENT 1: Tikhon Riazantsev 382715
% STUDENT 2: Agastya Heryudhanto 286824

% Homework 6 Task 1

figure;
hold on;
grid on;
x1 = [];
x2_up = [];
x2_down = [];

for i = 1:7
    x1 = -sqrt(7.5 - i):0.01:sqrt(7.5 - i)+0.01;
    x2_up = real(sqrt(-1/2.*x1.^2 + 3.75 - i/2));
    x2_down = real(-sqrt(-1/2.*x1.^2 + 3.75 - i/2));
    plot(x2_up, x1, 'k');
    plot(x2_down, x1, 'k');
    text(-0.1, -(-0.15 + sqrt(7.5 - i)), 'c='+string(i), 'FontSize', 10);
end

x = -3.5:0.1:3.5;
g = -x + 1.5;
plot(g,x);
xlabel('X1');
ylabel('X2');
axis('equal');
xlim([-3 3]);
ylim([-3 3]);

saveas(gcf, 'Homework 6/task1_plot.pdf');


