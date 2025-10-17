% Analytical Solution of 1D ADE with pulse input

% Parameters
M = 1;              % mass of solute (kg)
D = 0.01;           % dispersion coefficient (m^2/s)
u = 0.1;            % advection velocity (m/s)
x = linspace(0, 2, 200);   % distance (m)
t_values = [10, 20, 40, 80];   % time points (s) for plotting

% Plotting
figure;
hold on;
colors = lines(length(t_values));

for i = 1:length(t_values)
    t = t_values(i);
    C = (M ./ sqrt(4 * pi * D * t)) .* exp(-((x - u * t).^2) ./ (4 * D * t));
    plot(x, C, 'DisplayName', ['t = ' num2str(t) ' s'], 'Color', colors(i,:), 'LineWidth', 2);
end

xlabel('Distance (m)');
ylabel('Concentration (kg/m)');
title('Analytical Solution of 1D Advection-Dispersion Equation');
legend;
grid on;