% Code to plot simulation results (temperatures) from HouseHeatingSystem

% Copyright 2015-2018 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_HouseHeatingSystem', 'var')
    sim('HouseHeatingSystem')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_HouseHeatingSystem', 'var') || ...
        ~isgraphics(h1_HouseHeatingSystem, 'figure')
    h1_HouseHeatingSystem = figure('Name', 'h2_HouseHeatingSystem');
end
figure(h1_HouseHeatingSystem)
clf(h1_HouseHeatingSystem)

plotTemperature(simlog_HouseHeatingSystem)



% Create plot from simulation results
function plotTemperature(simlog)

% Get simulation results
t = simlog.House_Thermal_Network.Thermal_Mass_Wall.T.series.time;
Twall = simlog.House_Thermal_Network.Thermal_Mass_Wall.T.series.values('degC');
Twndw = simlog.House_Thermal_Network.Thermal_Mass_Window.T.series.values('degC');
Troof = simlog.House_Thermal_Network.Thermal_Mass_Roof.T.series.values('degC');

% Plot results
plot(t/60, Twall, 'LineWidth', 1)
hold on
plot(t/60, Twndw, 'LineWidth', 1)
plot(t/60, Troof, 'LineWidth', 1)
hold off
grid on
title('Temperature (House Heating System)')
xlabel('Time (min)')
ylabel('T (C)')
legend('Wall', 'Window', 'Roof', 'Location', 'Best')

end