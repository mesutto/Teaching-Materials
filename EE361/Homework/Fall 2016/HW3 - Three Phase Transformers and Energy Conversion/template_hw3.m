%% EE361 HW#3 FALL 2016

%% NAME: _James Prescott Joule_
%% STUDENT NUMBER: 21436587

%%
% Change your .m file name to the following:
% name_surname_ID_hw3.m

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


%% Q.1.
%% PART A
% Given parameters
Vs = 15e3; % V
Iload = 836; % A
Zf1 = 1e-3*(5+1j*45); % Ohms
Zt1 = 1e-3*(20+1j*225); % Ohms
Ztline = 1+1j*9.5; % Ohms
Zt2 = 15+1j*60; % Ohms
Zf2 = 1e-3*(25+1j*240); % Ohms
% Note that, the given ratios below are line-to-line voltage ratio
turns1 = 15/154;
turns2 = 154/34.5;

% Refer all the impedances to generator side.
% Use line-to-line voltage ratios for simplicity
% Be careful about the delta connection in Transformer-2 primary side

% Ztline_ref = ?
% Zt2_ref = ?
% Zf2_ref = ?

% Now, as all the impedances are referred to the generator side, one can
% obtain the total impedance.

% Ztotal = ?

% Since the system is dropped down to a single phase equivalent single line
% diagram, line-to netral voltage should be used. Moreover, load current
% should also be referred to generator side.

% Line-to-neutral source voltage:
% Vs_ln = ?
% Referred load current (line):
% Iload_ref = ? 
% Source current (line):
% Is = ?

% Calculate the total reactance and resistance on the line.

% Xtotal = ?
% Rtotal = ?

% A this stage, drawing a phasor diagram on a piece of paper will
% help you a lot!!!

% Calculate the load angle between the source voltage and referred load
% voltage (both line-to-neutral):

% delta = ?

% Note that, the calculated angle will be in radians if trigonometric
% functions are used. In case you need, you may convert it to degrees:

% delta_deg = ?

% By using the load angle information, calculate the referred load voltage
% magnitude.
% Vload_ln_ref = ?

% Convert it to its line to line value.
% Vload_ref = ?

% Calculate the actual load voltage magnitude (line-to-line)
% Vload = ?

%% Part A-(a)

% fprintf('Magnitude of the load voltage (line-to-line) is %g Volts.\n',Vload);

%% Part A-(b)

% fprintf('Load angle between source and load voltage is %g deg.\n',delta_deg);

%% Part A-(c)

% fprintf('Line current in feeder-1 is %g Amps.\n',Is);

%% Part A-(d)
% To plot the voltages in time domain, first create a time axis with
% sampling time of 10 usec. Two fundamental cycles correspond to 40 msec
% for a 50 Hz system.

time = 0:20e-6:0.04;

% Now, create the voltages by using the time array.

% Vs_peak = ?
% f = 50; % Hz
% Vs_a = Vs_peak*sin(2*pi*f*time);
% Vs_b = ?
% Vs_c = ?

% figure;
% plot(time,Vs_a,'b -','Linewidth',1.5);
% hold on;
% plot(time,Vs_b,'k -','Linewidth',1.5);
% hold on;
% plot(time,Vs_c,'r -','Linewidth',1.5);
% hold off;
% grid on;
% set(gca,'FontSize',12);
% xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
% ylabel('Voltage (Volts)','FontSize',12,'FontWeight','Bold')
% legend('Phase-a','Phase-b','Phase-c');


%% Part A-(e)
% Same time array can be used. Create the currents by considering the phase
% difference between source voltage and current.

% Is_peak = ?
% phase = ?
% Is_a = Is_peak*sin(2*pi*f*time-phase);
% Is_b = ?
% Is_c = ?

% Insert your code below for plot.

% figure;
% plot(.....
%    
% 


%% Part A-(f)
% Both waveforms are obtained previously.

% Insert your code below for plot.

% figure;
% plot(.....
%    
% 


%% Part A-(g)
% Same time array can be used.
% Line-to-neutral load voltage will be used.

% Vload_ln = ?
% Vload_peak = ?
% Vload_a = Vload_peak*sin(2*pi*f*time-phase);
% Iload_peak = ?
% Iload_a = Iload_peak*sin(2*pi*f*time-phase);

% Insert your code below for plot.

% figure;
% plot(.....
%    
% 

%% Part A-(h)

% pf = ?
% fprintf('Power factor at source terminals is %.3g.\n',pf);


% Insert your comment below:
% ...
% ..
% .

%% Part A-(i)

% Insert your comment below:
% ...
% ..
% .

%% Part A-(j)

% Insert your comment below:
% ...
% ..
% .

%% PArt B-(a)

data = xlsread('load_profile.xlsx');
iload = data(:,2);
hour = data(:,1);
iload2 = smooth(iload); % to smooth the curve

% figure;
% plot(.....
%    
% 


%% Part B-(b)
% Same calculation methodology in part A can be used. Load current is now
% an array, not a scalar, as it contains 24 data points. Use the variable
% "iload2" which was declared above.

% iload_ref = ?

% delta = ?
% delta_deg = ?

% Vload_ln_ref = ?
% Vload_ref = ?

% Vload = ?

% figure;
% plot(hour,Vload,'bx-','Linewidth',1.5);
% grid on;
% set(gca,'FontSize',12);
% xlabel('Hour','FontSize',12,'FontWeight','Bold')
% ylabel('Load Voltage (Volts)','FontSize',12,'FontWeight','Bold')


%% Part B-(c)

% Vrated = ?
% Vnoload = ?
% regulation = ?

% figure;
% plot(hour,regulation,'bx-','Linewidth',1.5);
% grid on;
% set(gca,'FontSize',12);
% xlabel('Hour','FontSize',12,'FontWeight','Bold')
% ylabel('Regulation (Percent)','FontSize',12,'FontWeight','Bold')
% ylim([0 5]);


% Insert your comment below:
% ...
% ..
% .


%% Part B-(d)
% To calculate efficiency, one can calculate the output power and the power
% loss on the line.
% Use the fact that the load is purely resistive.

% Pout = ?
% Ploss = ?
% efficiency = ?

% figure;
% plot(hour,efficiency,'bx-','Linewidth',1.5);
% grid on;
% set(gca,'FontSize',12);
% xlabel('Hour','FontSize',12,'FontWeight','Bold')
% ylabel('Efficiency (Percent)','FontSize',12,'FontWeight','Bold')
% ylim([95 100]);


% Insert your comment below:
% ...
% ..
% .


%% Part B-(e)

% I believe, you will do this part on your own :)



%% Q.2.
% Given parameters

I = 45; % Amps
Nturn = 50;
A = 10e-4; % m^2
m = 0.1; % kg
k = 100; % N/m
g = 9.8;
u0 = 4*pi*1e-7; % H/m


% Create position array. Use 0.1 mm step. Assume maximum position is 20cm.

x = 0:0.0001:0.2;

% IMPORTANT NOTE: All your plots against position should be between 1 cm
% and 20 cm.

%% Part a)

% Use the syntax below to show your derivations and expressions
% (reluctance, inductance, energy, force, etc)

%%
% RELUCTANCE
%%
% $R=x/(u_0A)$

% R = ?

%%
% INDUCTANCE

% Insert the expression here

% L = ?

%% part b) 

%%
% Insert the expression here

% W = ?


% "xlim" function defines the range of position axis on the plot. It should
% be between 1 cm and 20 cm.

% figure;
% plot(x,W,'b -','Linewidth',1.5);
% grid on;
% set(gca,'FontSize',12);
% xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
% ylabel('Stored Magnetic energy (Joules)','FontSize',12,'FontWeight','Bold')
% xlim([0.01 0.2]);

%% part c)

%% part c-i)

%%
% ELECTROMAGNETIC FORCE

% Insert the derivation here

% Insert the expression here


% Define Fem in downwards direction.

% Fem = ?


%% part c-ii)

%%
% MECHANICAL SPRING FORCE

% Insert the expression here

% Define Fs in downwards direction.

% Fs = ?


%% part c-iii)

%%
% GRAVITATIONAL FORCE

% Insert the expression here

% Define Fg in downwards direction.

% Fg = ?


%% part c-iv)

%%
% NET FORCE

% Insert the expression here

% Define Fnet in upwards direction.

% Fnet = ?

% Net force is defined in the direction of displacement now. It is actually
% the sum of all the forces acting on the mass, but be careful about its
% sign.


%% part c-v) 

% Insert your code below for plot.

% figure;
% plot(.....
%    
% 


%% part d)

%%
% ACCELERATION

% a = ?

% Insert your code below for plot.

% figure;
% plot(.....
%    
% 


%% part e)

%% part e-i)

%%
% AGAINST TIME

% Time step:
Ts = 1e-3; % sec

% Time vector (0.5 seconds):
% t = ?

% Parameter definition:

% N = numel(t);
% position = zeros(1,N);
% velocity = zeros(1,N);
% acceleration = zeros(1,N);

% Initial position:

% position(2) = 0.15;


% Implement a subroutine here, which calculates the new position
% of the mass using the acceleration, velocity and previous position data
% One way to do this is using "for" loops
% Displacement, velocity and acceleration should be treated as arrays.
% You may use the following code:


% for k = 2:N-1
%     Fem = ?
%     Fg = ?
%     Fs = ?
%     Fnet = ?
%     acceleration(k) = ?
%     velocity(k) = ?
%     position(k+1) = ?
% end


%% part e-ii)


% Insert your code below for plot.

% figure;
% plot(.....
%    
% 



%% After you finished
% Run the following command from Matlab terminal (command window)
% Generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

% publish('name_surname_ID_hw1.m','pdf')


