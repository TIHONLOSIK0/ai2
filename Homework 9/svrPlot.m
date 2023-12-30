function svrPlot( x1, x2, F, X, y, f )

figure();
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
set(gcf, 'PaperOrientation', 'landscape');
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 29.7 21]);
set(gcf, 'PaperSize', [29.7 21.0]);
if (isempty(x2))
    plot(x1, F, 'k--', 'LineWidth', 2); hold on;
    plot(X, y, 'k*', 'MarkerSize', 15); 
    plot(x1, f, 'k-', 'LineWidth', 2); hold off;
    xlabel('x', 'FontSize', 14, 'FontWeight', 'bold');
    ylabel('f(x)', 'FontSize', 14, 'FontWeight', 'bold');
    legend('f(x)', 'Sample points', 'Regression line', 'Location', 'SouthEast');
    set(gca, 'FontSize', 14, 'FontWeight', 'bold');
    xlim([-18 18]);
    ylim([-100 500]);
else
    subplot(1, 2, 1);
    surf(x1, x2, F); hold on;
    plot3(X(:, 1), X(:, 2), y, 'r*', 'MarkerSize', 17, 'LineWidth', 2); hold off;
    view([-45 15]);
    xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
    ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
    zlabel('f(x_1, x_2)', 'FontSize', 14, 'FontWeight', 'bold'); 
    legend('f(x_1, x_2)', 'Sample points', 'Location', 'NorthEast');
    set(gca, 'FontSize', 14, 'FontWeight', 'bold');
    xlim([-5 5]);
    ylim([-5 5]);
    zlim([0 0.2]);    
    grid on;
    
    subplot(1, 2, 2);
    surf(x1, x2, f);
    view([-45 15]);
    xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
    ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
    zlabel('f(x_1, x_2)', 'FontSize', 14, 'FontWeight', 'bold'); 
    legend('Regression plane', 'Location', 'NorthEast');
    set(gca, 'FontSize', 14, 'FontWeight', 'bold');
    xlim([-5 5]);
    ylim([-5 5]);
    zlim([0 0.2]);
    grid on;
end
RMS = mean((F(:)-f(:)).^2);
title(['RMS: ' num2str(RMS)], 'FontSize', 14, 'FontWeight', 'bold');

end