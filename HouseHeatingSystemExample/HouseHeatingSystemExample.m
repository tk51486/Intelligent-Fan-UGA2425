%% House Heating System
% 
% This example shows how to model a simple house heating system.  The model
% contains a heater, thermostat, and a house structure with four parts:
% inside air, house walls, windows, and roof.
% 
% The house exchanges heat with the environment through its walls, windows,
% and roof. Each path is simulated as a combination of a thermal
% convection, thermal conduction, and the thermal mass. The heater starts
% pumping hot air if room temperature falls below 18 degrees C and is
% turned off if the temperature exceeds 23 degrees C.  The simulation 
% calculates the heating cost and indoor temperatures.
% 
% The manual switch allows you to investigate system behavior with the
% heating system turned off.
% 
% 
% Copyright 2008-2015 The MathWorks, Inc.



%% Model

open_system('HouseHeatingSystem')

set_param(find_system(bdroot,'FindAll','on','type','annotation','Tag','ModelFeatures'),'Interpreter','off');

%% House Thermal Network Subsystem

open_system('HouseHeatingSystem/House Thermal Network','force')

%% Simulation Results from Scopes

set_param('HouseHeatingSystem/Heating Results','open','on');
sim('HouseHeatingSystem');

%% 

set_param('HouseHeatingSystem/Heating Results','open','off');
%% Simulation Results from Simscape Logging

HouseHeatingSystemPlotQS;

HouseHeatingSystemPlotTemps;

%%
