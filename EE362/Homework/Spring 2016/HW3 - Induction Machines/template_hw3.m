%% EE362 HW#3

%% NAME: _ALESSANDRO VOLTA_
%% STUDENT NUMBER: 123456

%%
% Change your .m file name to the following:
% name_surname_ID_hw3.m

% Use "fprintf" function to display results
% Do not display the results of long arrays!!!

% Please add axis names, legends, titles etc. in all your plots

% Use the already defined variable names whenever possible

% Show the unit for each variable

% Examine the whole template before you start

% Delete the hints, guidelines etc. given in this template when you prepare
% your solution

% Note that, MATLAB trigonometric functions use radians, not degrees
% Indexes in MATLAB start at 1, not 0
% Elementwise operations:
% http://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html


%% Q.1)

%% a)
f = 50; % Hz
Nr_nl = 1480; % rpm
% p = ?;
% fprintf('Pole number of the machine is %d.\n',p);


%% b)
% Ns = ?
% fprintf('Synchronous speed of the machine is %d rpm.\n',Ns);


%% c)
% Nr = ?
% fr = ?
% fprintf('Frequency of ...


%% d)
s = 0.05;
% Nr = ?
% fprintf...


%% e)
% fr = ?
% fprintf...


%% Q.2)

% Define given variables
R1 = 0.015; % ohms
R2p = 0.033; % ohms
L1 = 0.41e-3; % henry
L2p = 0.4e-3; % henry
Lm = 13.5e-3; % henry
Rc = 49.5; % ohms
Vline = 600; % volts
frequency = 60; % hz
Prated = 300e3; % watts
pole = 6;


%% Part a)

% Obtain the variables that will be used in the torque equation:

% Vphase = ?
% X1 = ?
% X2p = ?
% Xm = ?
% Nsync = ?
% wsync = ?

% Thevenin variables
Zm = (1j*Xm*Rc)/(1j*Xm+Rc); % ohms
Z1 = R1+1j*X1; % ohms
Vth = Vphase*Zm/(Z1+Zm); % volts
Zth = Z1*Zm/(Z1+Zm); % ohms
Rth = real(Zth); % ohms
Xth = imag(Zth); % ohms

% Slip (and rotor speed) array
s = -1:0.001:2;
s = fliplr(s);
% Nr = ?
% wr = ?
num = numel(s);
Tm = zeros(1,num); % Nm

% Torque array using the calculated variables and slip variation

% Tm = ?

% Be careful about the "elementwise array operations"
% http://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html


% At synchronous speed, torque will be zero (above equation cannot calculate)
Tm((s==0)) = 0; % Nm

% Plot the torque-speed curve
figure;
plot(Nr,Tm,'k-','LineWidth',2.0);
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Torque (Nm)','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
grid on;


% Obtain the output power characteristics
% Pm = ?

% Plot the output power-speed curve
% INSERT YOUR CODE HERE

% Store the torque characteristics for further usage
Toriginal = Tm; % Nm


%% Part b)

% Calculate the asked parameters using the torque characteristics

% HINT: a==b will give the index of a at which a is equal to b
% HINT: you may use "max" function

starting_torque = Tm((s==1)); % Nm
% max_torque = ?
% max_power = ?
% slip_max_torque = ?
% slip_max_power = ?

% fprintf('The starting torque 
% fprintf('The maximum torque 
% fprintf('The maximum power 
% fprintf('The slip at maximum 
% fprintf('The slip at maximum 


% INSERT YOUR COMMENT HERE


%% Part c)

% INSERT YOUR ANSWER HERE
% GIVE REASONING

% In this part, an implicit equation has to be solved to calculate the
% required external rotor resistance. "solve" function will be used as
% follows. Just put the new torque equation (with the symbolic variable
% "res") inside the solve function where ? stands.

syms res

% Tload_start = ?

% add_resistance = double(solve( ? == Tload_start,'IgnoreAnalyticConstraints',true));

% This equation will give you two solutions. Choose one and explain your
% resoning.

% fprintf('The possible external rotor resistance values are:\n');
% fprintf('%d Ohms and\n',add_resistance(1));
% fprintf('%d Ohms and\n',add_resistance(2));

% EXPLAIN YOUR REASONING

% add_res = add_resistance(?);

% fprintf('Selected external rotor resistance is: %d Ohms\n',add_res);

% Calculate the new starting torque to check your solution
% Tst_new = ?

% fprintf('New starting torque is: %d Nm\n',Tst_new);

% INSERT YOUR COMMENT HERE


%% Part d)

% Torque with external resistance

% Tm = ?
Tm((s==0)) = 0; % Nm

% Load torque
% load_torque = ?

% Plot the torque-speed curves
figure;
plot(Nr,Toriginal,'k-','LineWidth',2.0);
hold on;
plot(Nr,Tm,'r-','LineWidth',2.0);
hold on;
plot(Nr,load_torque,'b-','LineWidth',2.0);
hold off;
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Torque (Nm)','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
grid on;
xlim([0 1200]);


%% Part e)

%% Part e-1)

% Cursors are useful on MATLAB plots to determine a specific point.
% Using the graph:

% Nr_op = ?
% fprintf('Rotor speed


%% Part e-2)

% This can both be calculated by using graph and using the load torque at
% the given speed:

% Tm_op = ?
% wr_op = ?
% Tm_op = ?
% fprintf('Torque 


%% Part e-3)

% Note that to calculate efficiency, you need to calculate several
% variables. 

% slip = ?
% Pm_op = ?
% Pout = ?
% I2p = ?
% Pcur = ?
% Pag = ?
% I1 = ?
% Pcus = ?
% Pc = ?
% Pin = ?
% 
% efficiency = ?
% 
% fprintf('Efficiency 


%% Part f)

%% Part f-1)

% Define new variables

% frequency_new = ?
% Vline_new = ?

% Calculate all the parameters to be used in the torque equation, with the
% new frequency and voltage:

% Vphase = ?
% X1 = ?
% X2p = ?
% Xm = ?
% Nsync = ?
% wsync = ?
% 
% Zm = ?
% Z1 = ?
% Vth = ?
% Zth = ?
% Rth = ?
% Xth = ?

% Define a new slip array and obtain a new speed array
% Note that the synchronous speed is now changed

s2 = -1:0.001:2;
s2 = fliplr(s2);
Nr2 = Nsync*(1-s2);
num = numel(s2);
Tm = zeros(1,num);

% Obtain the torque

% Tm = ?
Tm((s2==0)) = 0;

% Plot the torque-speed curves

% INSERT YOUR CODE HERE
% figure;
% .....
% ...
% ..
% xlim([0 1500]);


%% Part f-2)

% EXPLAIN IN DETAIL WITH REASONING
% HINT: Consider the electrical and mechanical time constants.


%% Part f-3)

% Cursors are useful on MATLAB plots to determine a specific point.
% Let us call this point as C.

% Using the graph:
% Nr_C = ?
% Tm_C = ?

% fprintf('Rotor apeed just after the frequency reduction
% fprintf('Torque just after the frequency reduction


% A more professional way is to use "find" function. If you want, you may
% utilize it.


%% Part f-4)

% Cursors are useful on MATLAB plots to determine a specific point.

% Using the graph:
% Nr_B = ?
% Tm_B = ?

% fprintf('Rotor apeed at final operating point
% fprintf('Torque  at final operating point


%% Part g)

%% Part g-1)

% new_load_torque = ?

% Plot the torque-speed curves

% INSERT YOUR CODE HERE
% figure;
% .....
% ...
% ..
% xlim([0 1500]);


%% Part g-2)

% EXPLAIN IN DETAIL WITH REASONING


%% Part g-3)

% Cursors are useful on MATLAB plots to determine a specific point.

% Using the graph:
% Nr_B = ?
% Tm_B = ?
% 
% fprintf('Rotor apeed at final operating point 
% fprintf('Torque  at final operating point 



%% After you finished
% Run the following command from Matlab terminal (command window)
% Generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

% publish('name_surname_ID_hw3.m','pdf')


