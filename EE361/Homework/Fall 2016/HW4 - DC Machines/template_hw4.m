
%% EE361 Fall 2016 HW#4

%% NAME: _TEMPLATE_
%% STUDENT NUMBER: 123456

%%
% Change your .m file name to the following:
% name_surname_ID_hw4.m

% Most of the operations are already given to you for simplicity.
% Uncomment the already given solutions to use them, i.e, Delete the "%" in
% front of such lines.

% Use "fprintf" function to display results
% Do not display the results of long arrays!!!

% Please add axis names, legends, titles etc. in all your plots

% Use the already defined variable names whenever possible

% Show the unit for each variable

% Examine the whole template before you start

% Delete the hints, guidelines etc. given in this template when you prepare
% your solution

% Note that:
% Indexes in MATLAB start at 1, not 0
% Elementwise operations:
% http://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html


%% Q1)

%% Motor-1

%% a.

%% b.

%% c.

%% d.

%% e.

%% f.

%% Motor-2

%% a.

%% b.

%% c.

%% d.

%% e.

%% f.

%% Motor-3

%% a.

%% b.

%% c.

%% d.

%% e.

%% f.

%% Motor-4

%% a.

%% b.

%% c.

%% d.

%% e.

%% f.


%% Q2)

%%
% PARAMETERS

% drag force
p = 1.225; % kg/m^3
A = 0.5; % m^2
Cd = 0.8;

% friction
K = 0.8; % kg/s

% gravity
g = 9.8; % m/s^2

% motor
Ka = 1; % V/(rad/sec)
Ra = 0.285; % ohm
Prated = 350; % watt
Vrated = 28; % volts

% bicycle
vrated = 30/3.6; % m/s
weight = 100; % kg
wheel_diameter = 0.7; % m
C = 1000; % F


% HINT: What would be the value of net force when travelling at constant
% speed? Consider Newton physics.

% HINT: Consider the direction of each force component at each part. 
% Drawing a free-body diagram will be helptful.

% HINT: Think about the mode of operation of the DC machine before you
% calculate the efficiency.


%% Part I

% wrated = ?
% Trated = ?
% Irated = ?
% 
% fprintf('Rated speed of the motor is %g rad/sec.\n',wrated);
% fprintf('Rated torque ...
% fprintf('Rated current ...

%% Part II

% Fdrag = ?
% Ffriction = ?
% Fnet = ?
% 
% Tmotor = ?
% 
% Ia = ?
% 
% wm = ?
% Ea = ?
% Vt = ?
% 
% Pin = ?
% Pout = ?
% efficiency = ?
% 
% fprintf('The drag force at rated speed is %g N.\n',Fdrag);
% fprintf('The frictional
% fprintf('The net 
% fprintf('The motor 
% fprintf('The armature 
% fprintf('The back emf 
% fprintf('The terminal 
% fprintf('The efficiency


%% Part III

% Fdrag = ?
% Ffriction = ?
% Fgravitation = ?
% Fnet = ?
% 
% Tmotor = ?
% 
% Ia = ?
% 
% wm = ?
% Ea = ?
% Vt = ?
% 
% Pin = ?
% Pout = ?
% efficiency = ?
% 
% fprintf('The drag force at rated speed is %g N.\n',Fdrag);
% fprintf('The frictional
% fprintf('The gravitational
% fprintf('The net 
% fprintf('The motor 
% fprintf('The armature 
% fprintf('The back emf 
% fprintf('The terminal 
% fprintf('The efficiency


%% Part IV

% Fdrag = ?
% Ffriction = ?
% Fgravitation = ?
% Fnet = ?
% 
% Tmotor = ?
% 
% Ia = ?
% 
% wm = ?
% Ea = ?
% Vt = ?
% 
% Pin = ?
% Pout = ?
% efficiency = ?
% 
% fprintf('The drag force at rated speed is %g N.\n',Fdrag);
% fprintf('The frictional
% fprintf('The gravitational
% fprintf('The net 
% fprintf('The motor 
% fprintf('The armature 
% fprintf('The back emf 
% fprintf('The terminal 
% fprintf('The efficiency


%% Part V

%% a.


%% b.


%% c.

% HINT: Consider the change in the energy of capacitor.

% HINT: Will the capacitor voltage increase or decrease? Think about it.

Vinitial = 36; % V


% Vfinal = ?

fprintf('The final voltages is %g V.\n',Vfinal);

%% d.


%% e. 


%% f.

% HINT: Consider the change in the energy of capacitor.

% HINT: Will the capacitor voltage increase or decrease? Think about it.

Vinitial = 30; % V


% Vfinal = ?

fprintf('The final voltages is %g V.\n',Vfinal);

%% After you finished

% RUN THE FOLLOWING COMMAND FROM MATLAB TERMINAL (COMMAND WINDOW). DO NOT
% LEAVE IT IN YOUR .M FILE !!!

% publish('name_surname_ID_hw4.m','pdf')

% A report will be generated in pdf format. ONLY UPLOAD THIS PDF FILE !!!

