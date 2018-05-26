%% EE362 HW#1 SPRING ?

%% NAME: _EMMETT BROWN_
%% STUDENT NUMBER: 1244453

%%
% Change your .m file name to the following:
% name_surname_ID_hw1.m

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
% your solution. Please submit a clean version without any unnecessary parts.

% Note that:
% Indexes in MATLAB start at 1, not 0
% Elementwise operations:
% http://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html
%% Q1)
%At same reason you want to buy 100hp (135kW) Y-connected 460V three-phase 4-pole 50-Hz induction 
%machine via Alibaba
%Link => https://bit.ly/2HBiWE2 
%Of course, as a smart engineer you never blind buy anything at the internet
%you request some test result from the company.
snapnow;
%No-load Test
P_nl=1.22*10^3; %Watts
V_nl=448; %line to line voltage
I_nl=32.1; %Ampere

%Locked Rotor Test for 50 Hz
P_lr=143*10^3; %Watts
V_lr=450; %line to line voltage
I_lr=727; %Ampere

%Per stator phase dc resistance
R_s=29.2*10^-3;

%Other Parameters
Vs=460 %Rated supply voltage (line to line)
q = 3; % Number of phases
fe = 50; %Hz
poles = 4;
%%
%%  PART A
%Calculate ac resistance of stator per phase for 50-Hz
%R_s_ac = ; 
%fprintf('Stator ac resistance is %d Ohm.\n', R_s_ac);

%Windage and friction losses are 82W. Find the core loss.
P_fw=82;
%P_core=;
%fprintf('Core loss is %d Watts.\n', P_core);

%Find R_core and X_m,  clearly indicate your assumption
%R_c =
%Xm =
%fprintf('Core resistance is %d ohm and core reactance is %d.\n', R_c,Xm);

%State your assumptions here

%Find winding paramaters X_1, X_2 and R_2. Assume X_1 = X=2
%R_2=
%X_2 =
%X_1=
%fprintf('X_1 = ,%d X_2 = %d, R_2 = %d\n', X_1,X_2,R_2);

%Calculate ns both rpm and rad/sec
%omegas=
%ns = 
%fprintf('ns is %d rpm and omegas is %d rad/sec.\n', ns, omegas)
%Find the thevenin equivalent parameters
%Z1eq =
%R1eq = 
%X1eq = 
%V1eq =
%fprintf('Equivalent impedance is %d, resistance %d ohm \n, reactance %d ohm \n, voltage, %d volts', Z1eq, R1eq, X1eq, V1eq)
%%
%%
%%  Part B
%   Now you know every circuit parameter of the induction machine.Calculate
% all the losses and build an pie-diagram when s = 0.05 at rated voltage and power.
% Assume current on magnetizing branch is negligible small.
P_rated = 135*10^3;
%Stator cupper loss 
%P_cu1=
%Air-gap power
%P_gap=
%Rotor cupper loss
%P_cu2=
%Mechanical power
%P_mech=

%Do not forget MATLAB pie function takes array as argument. First you
%should define an array that consist of data that you used.
%Data = [...]
%figure;
%legend('Mechanical Output','Rotor Cupper Loss','Stator Cupper Loss','Friction and Windage Loss','Core Loss')
%pie(...);

%Calculate the efficency, Now change the slip to 0.1 (%10). Comment on
%change. Comment relationship between slip and efficiency
%%  Comment here
%% Q2) 
% Plot torque vs speed graph with different thevenin voltages (Not supply voltages
%you can use variable that you found Q1). For loop can be helpful. Use 1000 data points slip vector.
%Give your labels and titles clearly.
% Vs_vector = [380/sqrt(3),320/sqrt(3),270/sqrt(3),200/sqrt(3),100/sqrt(3)]
load_linear(1:1000) = 150;
%figure;
%hold on;
%plot(...);
%hold off;
%%
%Plot torque vs speed graph with differents R_2 (0.1,0.2,0.5,1,1.5)
%For loop may help you.
load_linear(1:1000) = 300;
%figure;
%hold on;
%plot(...);
%hold off;
%%
%Plot torque vs speed graph using constant Vs/f topology. Take R_2 as 0.05 ohm%
R_2=0.05;
%figure;
%hold on;
%plot(...);
%hold off;

% Now you want to change your machine operation characteristic such as you
% want a high starting torque. Change the necessary parameter and plot new
% torque-speed graph

%figure;
%hold on;
%plot(...);
%hold off;
%%
%Comment on all control method considering the linear load? 
%Compare them briefly?

%% 
%Now you want to increase machine speed above the synchronous speed.
%Propose a method. Obtain 2000 rpm speed where 0<s<0.05. Plot torque-speed
%curve
%figure;
%plot(...);
%fprintf('Speed at s=0.05 is %d, ns is %d therefore 2000 rpm in this slip range',speed,ns)
%% After you finished
% Run the following command from Matlab terminal (command window)
% Generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

% publish('name_surname_ID_hw1.m','pdf')