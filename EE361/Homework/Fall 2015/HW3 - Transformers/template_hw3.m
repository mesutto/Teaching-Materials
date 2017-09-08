
%% EE361 HW#3

%% NAME: _NICOLA TESLA_
%% STUDENT NUMBER: 123456

%% Q.1.
% The parameters that are used:
n = 10;
fs = 50;
R1 = 1.6;
R2 = 16e-3;
L1 = 7e-3;
X1 = L1*2*pi*fs;
L2 = 70e-6;
X2 = L2*2*pi*fs;
Rc = 32e3;
Lm = 14.6;
Xm = Lm*2*pi*fs;


%%
% Load current vector creation (magnitude)

%Insert your code here

%there will be equations as following
%pay attention to the syntax
%%
% $N*I=B*l/u_0$
%%
% $E_2 = V_2+i_{load}*(R_2+j*X_2)$


%HINTS
% Irated = ?;
% Use "linspace"
% Use j variable to do complex math
% EXAMPLE: E2 = V2+iload*(R2+j*X2);

%%
% At unity pf

%Insert your code here

%HINTS
% E2 = ?;
% V1 = ?;
% use complete equivalent circuit

%%
% pf = 0.8 lagging

%Insert your code here

%%
% pf = 0.8 lagging

%Insert your code here


%% PART (a)
% source voltages

%Insert your code here

% some useful functions
%plot(iload,eff1...
%hold on
%grid on
%set(gca,'FontSize....
%xlim([0 ...
%ylim([95 ....
%xlabel('Load Curr.....
%ylabel('Efficiency (Per....
%legend('pf = 1','pf = .....


% your graph will be here
% do not forget to plot on same figure

%% PART (b)
% voltage regulations

%Insert your code here

% your graph will be here
% do not forget to plot on same figure

%% PART (c)
% efficiency

%Insert your code here

% your graph will be here
% do not forget to plot on same figure

%% PART (d)
% comment

%Insert
%your
%comment
%here
%and
%there
%...

%% PART (e)
% comment

%Insert
%your
%comment
%here
%and
%there
%...

%% Q.2.
%% PART A

%% PART a

%Insert your code here

% your graph will be here
% do not forget to plot on same figure
% two fundamental cycles is 40 msec

%% PART b

%Define parameters
%Zline1 = ...
%Zline2 = ...
%Ztrans = ...
%turns_ratio = ...

%Insert your code here (calculations)
% It is advised to take the load voltage
% as reference phasor
% throughout the question

% ILoad_mag = ?
% ILoad_phase = ?
% Isource_mag = ?
% Isource_phase = ?

%Insert your code here (plot)

% your graph will be here
% do not forget to plot on same figure

%% PART c

%Insert your code here (calculations)
% VLoad_mag = ?
% HINTS
% model the system
% the easiest solution would be to obtain the single phase-Y equivalent circuit
% and refer all parameters either to high voltage or low voltage side
% obtain an equation relating source and load voltage
% there will be two unknowns:
% 1.load voltage magnitude
% 2.source voltage phase
% first, obtain VLoad_mag
% you can solve the equation by separately
% calculating the voltage magnitude and phase angle


% your result will be here


%% PART d

%Insert your code here (calculations)
% Vsource_phase = ?
% Use the VLoad_mag info and the model (equation) in (c)


% your result will be here


%Insert your code here (plot)

% your graph will be here

%% PART e

%Insert your code here (calculations)
% Isource_phase = ?
% Vsource_phase = ?
% pf_source = ?

% your result will be here


%% PART B
%% Part a
% Data import
data = xlsread('load_profile_METU.xlsx');
iload = data(2:25,2);
hour = data(2:25,1);

%Insert your code here

% your graph will be here

%% Part b
%load voltage vs hour

%Insert your code here (calculations)
% HINTS:
% Use the same model and method in Part A
% This time, you will make the calculation
% for all current values simultaneously
% It is advised to treat the current (ILoad)
% as a vector (1x24 array)

%Insert your code here (plot)

% your graph will be here

%% Part c
%regulation vs hour

%Insert your code here (calculations)

%Insert your code here (plot)

% your graph will be here

%% Part d
%efficiency vs hour

%Insert your code here (calculations)

%Insert your code here (plot)

% your graph will be here


%% After you are finished
% Run the following command from Matlab terminal
% generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

%publish('name_surname_ID_hw3.m', 'pdf')

