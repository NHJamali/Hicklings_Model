% Define constants
PEEP = 0;
PIP = 10;
TOP = 0;
total_units = 9000 * 30; % Total number of units (constant)
compliance_per_unit = 0.0002; % Compliance per alveolar unit

% Modify the step size of SP
step_size = 0.5; % Example step size, you can change this

% Calculate number of layers and units per layer
num_layers = 15 / step_size; % Number of layers based on step size
units_per_layer = total_units / num_layers; % Units per layer to keep total units constant

% Triangle distribution of units
units_per_layer_triangle = linspace(0, 2*units_per_layer, num_layers/2);
units_per_layer_triangle = [units_per_layer_triangle, fliplr(units_per_layer_triangle)];

% Sinusoidal distribution of units
% Sinusoidal distribution of units - Adjusted
units_per_layer_sinusoidal = (sin(linspace(0, pi, num_layers))) * units_per_layer;
current_total_units_sinusoidal = sum(units_per_layer_sinusoidal);
scaling_factor = 270000 / current_total_units_sinusoidal;
units_per_layer_sinusoidal = units_per_layer_sinusoidal * scaling_factor;


% Gaussian distribution of units
sigma = num_layers / 6; % Adjust sigma for desired spread
mu = num_layers / 2; % Mean layer index
units_per_layer_gaussian = units_per_layer * exp(-(linspace(1, num_layers, num_layers) - mu).^2 / (2 * sigma^2));
current_total_units_gaussian = sum(units_per_layer_gaussian);
scaling_factor_gaussian = 270000 / current_total_units_gaussian;
units_per_layer_gaussian = units_per_layer_gaussian * scaling_factor_gaussian;

% Initialize arrays for volume and pressure
pressure = PEEP:PIP;
volume_triangle = zeros(size(pressure));
volume_sinusoidal = zeros(size(pressure));
volume_gaussian = zeros(size(pressure));

% Calculate volume for each pressure value - Triangle distribution
% Calculate volume for each pressure value - Triangle distribution
for j = 1:length(pressure)
    PRESS = pressure(j);
    VOLTOT = 0;
    for i = 1:length(units_per_layer_triangle) % Iterate up to the length of units_per_layer_triangle
        SP = (i - 1) * step_size; % layer position
        if PRESS > (SP + TOP)
            VOL = (PRESS - SP) * units_per_layer_triangle(i) * compliance_per_unit;
        elseif PIP > (SP + TOP) && PEEP > SP
            VOL = (PRESS - SP) * units_per_layer_triangle(i) * compliance_per_unit;
        else
            VOL = 0;
        end
        VOLTOT = VOLTOT + VOL;
    end
    volume_triangle(j) = VOLTOT;
end


% Calculate volume for each pressure value - Sinusoidal distribution
for j = 1:length(pressure)
    PRESS = pressure(j);
    VOLTOT = 0;
    for i = 1:num_layers
        SP = (i - 1) * step_size; % layer position
        if PRESS > (SP + TOP)
            VOL = (PRESS - SP) * units_per_layer_sinusoidal(i) * compliance_per_unit;
        elseif PIP > (SP + TOP) && PEEP > SP
            VOL = (PRESS - SP) * units_per_layer_sinusoidal(i) * compliance_per_unit;
        else
            VOL = 0;
        end
        VOLTOT = VOLTOT + VOL;
    end
    volume_sinusoidal(j) = VOLTOT;
end

% Calculate volume for each pressure value - Gaussian distribution
for j = 1:length(pressure)
    PRESS = pressure(j);
    VOLTOT = 0;
    for i = 1:num_layers
        SP = (i - 1) * step_size; % layer position
        if PRESS > (SP + TOP)
            VOL = (PRESS - SP) * units_per_layer_gaussian(i) * compliance_per_unit;
        elseif PIP > (SP + TOP) && PEEP > SP
            VOL = (PRESS - SP) * units_per_layer_gaussian(i) * compliance_per_unit;
        else
            VOL = 0;
        end
        VOLTOT = VOLTOT + VOL;
    end
    volume_gaussian(j) = VOLTOT;
end

% Calculate compliance for each layer
compliance_triangle = units_per_layer_triangle * compliance_per_unit;
compliance_sinusoidal = units_per_layer_sinusoidal * compliance_per_unit;
compliance_gaussian = units_per_layer_gaussian * compliance_per_unit;


diff_compliance_triangle = diff(compliance_triangle);
diff_compliance_gaussian = diff(compliance_gaussian);
diff_compliance_sinusoidal = diff(compliance_sinusoidal);

% Calculate pressure levels for each layer
pressure_levels = (0:num_layers-1) * step_size;

% Plot system compliance vs. pressure
figure;
plot(pressure_levels, compliance_triangle, 'b-', 'LineWidth', 1.5);
hold on;
plot(pressure_levels, compliance_sinusoidal, 'r--', 'LineWidth', 1.5);
plot(pressure_levels, compliance_gaussian, 'g-.', 'LineWidth', 1.5);
hold off;
xlabel('Pressure (cmH2O)');
ylabel('System Compliance (L/cmH2O)');
title('System Compliance vs. Pressure for Different Distributions');
legend('Triangle', 'Sinusoidal', 'Gaussian', 'Location', 'Best');
grid on;

% Calculate delta volume and pressure for system compliance
delta_volume_triangle = volume_triangle(end) - volume_triangle(1);
delta_volume_sinusoidal = volume_sinusoidal(end) - volume_sinusoidal(1);
delta_volume_gaussian = volume_gaussian(end) - volume_gaussian(1);
delta_pressure = pressure(end) - pressure(1);

% Calculate system compliance for each distribution
system_compliance_triangle = delta_volume_triangle / delta_pressure;
system_compliance_sinusoidal = delta_volume_sinusoidal / delta_pressure;
system_compliance_gaussian = delta_volume_gaussian / delta_pressure;

% Display system compliance results
disp(['System Compliance (Triangle Distribution): ' num2str(system_compliance_triangle) ' L/cmH2O']);
disp(['System Compliance (Sinusoidal Distribution): ' num2str(system_compliance_sinusoidal) ' L/cmH2O']);
disp(['System Compliance (Gaussian Distribution): ' num2str(system_compliance_gaussian) ' L/cmH2O']);

% Plot pressure-volume curves
figure;
plot(pressure, volume_triangle, 'b-', 'LineWidth', 1.5);
hold on;
plot(pressure, volume_sinusoidal, 'r--', 'LineWidth', 1.5);
plot(pressure, volume_gaussian, 'g-.', 'LineWidth', 1.5);
hold off;
xlabel('Pressure (cmH2O)');
ylabel('Volume (L)');
title(['Pressure-Volume Curves for Different Distributions (Number of layers = ' num2str(num_layers) ')']);
legend('Triangle', 'Sinusoidal', 'Gaussian', 'Location', 'Best');
grid on;

% Plot distributions of units per layer
figure;
subplot(3, 1, 1);
bar(units_per_layer_triangle);
title('Triangle Distribution');
xlabel('Layer');
ylabel('Units');

subplot(3, 1, 2);
bar(units_per_layer_sinusoidal);
title('Sinusoidal Distribution');
xlabel('Layer');
ylabel('Units');

subplot(3, 1, 3);
bar(units_per_layer_gaussian);
title('Gaussian Distribution');
xlabel('Layer');
ylabel('Units');




% Plot compliance vs. pressure levels for each distribution
figure;
plot(pressure_levels, compliance_triangle, 'b-', 'LineWidth', 1.5);
hold on;
plot(pressure_levels, compliance_sinusoidal, 'r--', 'LineWidth', 1.5);
plot(pressure_levels, compliance_gaussian, 'g-.', 'LineWidth', 1.5);
hold off;
xlabel('Pressure (cmH2O)');
ylabel('Compliance (L/cmH2O)');
title('Compliance vs. Pressure Levels for Different Distributions');
legend('Triangle', 'Sinusoidal', 'Gaussian', 'Location', 'Best');
grid on;

% Plot differences as bar graph
figure;
plot(1:29, [diff_compliance_triangle', diff_compliance_sinusoidal', diff_compliance_gaussian']);
xlabel('Pressure (cmH2O)');
ylabel('Change in Compliance (L/cmH2O)');
title('Change in Compliance vs. Pressure for Different Distributions');
legend('Triangle', 'Sinusoidal', 'Gaussian', 'Location', 'Best');
grid on;




