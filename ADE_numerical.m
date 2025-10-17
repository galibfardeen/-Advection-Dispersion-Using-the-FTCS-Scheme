% Numerical solution of 1D ADE using FTCS scheme

% Parameters
L = 2;          % Length of domain (m)
nx = 200;       % Number of spatial steps
dx = L / (nx - 1);  % Spatial step
x = linspace(0, L, nx); % Spatial grid

D = 0.01;       % Dispersion coefficient (m^2/s)
v = 0.1;        % Advection velocity (m/s)
M = 1;          % Mass of solute (for initial condition)

t_max = 80;     % Maximum time (s)
dt = 0.001;      % Time step (s)
nt = round(t_max / dt);  % Number of time steps

% Stability condition check (optional warning)
alpha = D * dt / dx^2;
beta = v * dt / (2 * dx);
if alpha > 0.5
    warning('Unstable: Decrease dt or increase dx for numerical stability');
end

% Initial condition: Pulse at x = 0 (or near the left boundary)
C = zeros(1, nx);  % Initial concentration
C(5) = M / dx;     % Approximate Dirac delta

% Save solution at selected time steps
t_values = [10, 20, 40, 80];
C_solutions = zeros(length(t_values), nx);
time_index = 1;

% Time stepping loop
for n = 1:nt
    C_new = C;
    for i = 2:nx-1
        C_new(i) = C(i) ...
            - beta * (C(i+1) - C(i-1)) ...
            + alpha * (C(i+1) - 2*C(i) + C(i-1));
    end

    % Update concentration
    C = C_new;

    % Store if it's a selected time
    current_time = n * dt;
    if abs(current_time - t_values(time_index)) < dt/2
        C_solutions(time_index, :) = C;
        time_index = time_index + 1;
        if time_index > length(t_values)
            break;
        end
    end
end

% Plotting
figure;
hold on;
colors = lines(length(t_values));

for i = 1:length(t_values)
    plot(x, C_solutions(i, :), 'DisplayName', ['t = ' num2str(t_values(i)) ' s'], ...
        'Color', colors(i,:), 'LineWidth', 2);
end

xlabel('Distance (m)');
ylabel('Concentration (kg/m)');
title('Numerical Solution of 1D ADE using FTCS Scheme');
legend;
grid on;
