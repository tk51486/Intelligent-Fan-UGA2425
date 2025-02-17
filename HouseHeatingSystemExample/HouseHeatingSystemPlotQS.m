% Code to plot simulation results (heat flow rates) from HouseHeatingSystem

% Copyright 2015-2018 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlog_HouseHeatingSystem', 'var')
    sim('HouseHeatingSystem')
end

% Reuse figure if it exists, else create new figure
if ~exist('h2_HouseHeatingSystem', 'var') || ...
        ~isgraphics(h2_HouseHeatingSystem, 'figure')
    h2_HouseHeatingSystem = figure('Name', 'h2_HouseHeatingSystem');
end
figure(h2_HouseHeatingSystem)
clf(h2_HouseHeatingSystem)

plotHeatFlow(simlog_HouseHeatingSystem)



% Create plot from simulation results
function plotHeatFlow(simlog)

% Get simulation results
t = simlog.House_Thermal_Network.Atm_Wall_Convection.Q.series.time;
QWall = simlog.House_Thermal_Network.Atm_Wall_Convection.Q.series.values('kW');
QWindow = simlog.House_Thermal_Network.Atm_Window_Convection.Q.series.values('kW');
QRoof = simlog.House_Thermal_Network.Atm_Roof_Convection.Q.series.values('kW');

% Plot results
plot(t/60, QWall, 'LineWidth', 1)
hold on
plot(t/60, QWindow, 'LineWidth', 1)
plot(t/60, QRoof, 'LineWidth', 1)
hold off
grid on
title('Heat Flow Rate to Atmosphere')
xlabel('Time (min)')
ylabel('Heat Flow Rate (kW)')
legend('Wall', 'Window', 'Roof', 'Location', 'Best')

end