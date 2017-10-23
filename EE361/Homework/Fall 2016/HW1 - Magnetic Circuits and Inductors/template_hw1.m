%% EE361 HW#1 FALL 2016

%% NAME: _JOSEPH HENRY_
%% STUDENT NUMBER: 654321

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
% your solution

% Note that:
% Indexes in MATLAB start at 1, not 0
% Elementwise operations:
% http://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html


%% Q.1)
% Given parameters

path_length = 145e-3; % m
core_area = 15.8e-6; % m^2
Bsat = 0.51; % Tesla
Lrequired = 220e-6; % H
relative_perm = 3000;
air_perm = 4*pi*1e-7; % H/m


%% Part I)
% Import the nonlinear B-H data

% BHdata = xlsread('B-H_char.xlsx');
% Hnonlinear = BHdata(:,1);
% Bnonlinear = BHdata(:,2);


%% Part A)
% Calculate the number of turns

% permeability = ?
% reluctance = ?
% turns = ?
% fprintf('Required number of turns is %d.\n',turns);
% HINT: Can the number of turns be a non-integer value? Be careful.


%% Part B)
% HINT: In order to sketch the linear B-H characteristics, first calculate the
% magnetic field intensity on the saturation point.

% Hsat = ?

% Create an H vector for linear case and an empty B vector as follows:

% Hlinear = 0:20:500; % A/m 
% Blinear = zeros(1,numel(Hlinear)); % Tesla

% There are many ways to obtain the B-H characteristics for linear case.
% The most simple one may be the following where B is H times permeability
% up to the saturation point and B is constant after saturation.

% for k = 1:numel(Hlinear)
%     if Hlinear(k)<=Hsat
%         Blinear(k) = Hlinear(k)*permeability;
%     else
%         Blinear(k) = Bsat;
%     end
% end

% Plot the B-H characteristics

% figure;
% plot(Hlinear,Blinear,'b-','LineWidth',2.0);
% hold on;
% plot(Hnonlinear,Bnonlinear,'r-','LineWidth',2.0);
% hold off;
% xlabel('Magnetic Field Intensity (A/m)','Fontweight','Bold');
% ylabel('Flux Density (Tesla)','Fontweight','Bold');
% title ('Linear B-H Characteristic','Fontweight','Bold');
% legend('Linear','Nonlinear');
% grid on;


%% Part C)
% Linear case:

% flux_density = 0.30; % Tesla
% current_linear = ?
% fprintf('The required inductor current for linear case is %d Amps.\n',current_linear);

% Nonlinear case:

% Hrequired = ?
% current_nonlinear = ?
% fprintf('The required inductor current for nonlinear case is %d Amps.\n',current_nonlinear);


%% Part D)
% Linear case:

% flux_density = 0.45; % Tesla
% current_linear = ?
% fprintf('The required inductor current for linear case is %d Amps.\n',current_linear);

% Nonlinear case:
% Hrequired = ?
% current_nonlinear = ?
% fprintf('The required inductor current for nonlinear case is %d Amps.\n',current_nonlinear);

% Insert your comment here.


%% Part II)
% HINT: Use the operating point where the inductor starts to saturate.

% Imax = ?
% fprintf('The maximum current that this inductor can carry without saturating the core is %d Amps.\n',Imax);


%% Part III)
% HINT: Use the inductance and maximum current found previously to calculate the
% stored energy:

% stored_energy = ?
% fprintf('Stored energy with this current is %d Joules.\n',stored_energy);

% Now, use the B and H values at the operating point where the core starts
% to saturate. The core volume can easily be calculated by using the given
% core geometry.

% stored_energy2 = ?
% fprintf('Stored energy found with B-H point is %d Joules.\n',stored_energy2);

% Insert your comment here.


%% Part IV)

% Insert your comment here.


%% Part V)

% Insert your comment here (relative permeability).

% Insert your comment here (reluctance).

% Insert your comment here (inductance).


%% Q.2)
% Given parameters

gap_length = 1e-2; % m
Bsat = 1; % Tesla
Hsat = 300; % A/m
core_area = 10e-4; % m^2
air_perm = 4*pi*1e-7; % H/m
turn = 30;


%% Part I)

% permeability = ?
% relative_perm = ?
% fprintf('Relative permeability of the core is %d.\n',relative_perm);


%% Part II)
% HINT: First draw a magnetic equivalent circuit where reluctances are
% modeled as resistors. Find the reluctance of each leg. Then solve the
% circuit with any method you would like (such as mesh analysis) to find
% the MMF created by the current source.

% reluctance_A = ?
% reluctance_B = ?
% reluctance_C = ?
% flux_B = ?
% flux_C = ?
% flux_A = ?
% MMF = ?
% current = ?
% fprintf('Coil-A current is %d Amps.\n',current);


%% Part III)
% HINT: Use the fact that core crossectional area is same everywhere.

% flux_density_gap = ?
% fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);


%% Part IV)
% HINT: Use the symmetry of the circuit to simplify it. 

% MMF = ?
% flux_A = ?
% flux_B = ?
% flux_C = ?
% flux_density_B = ?
% flux_density_gap = ?
% fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);
% fprintf('The flux density in leg-B is %d Tesla.\n',flux_density_B);


%% Part V)
% HINT: Be careful about the limitations of magnetic circuits!

% flux_density_B = ?
% flux_density_gap = ?
% fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);
% fprintf('The flux density in leg-B is %d Tesla.\n',flux_density_B);


%% Part VI)

% Insert your comment here


%% Part VII)

% Insert your comment here


%% PArt VIII)

% Insert your comment here


%% Part IX)

% Insert your comment here


%% After you finished
% Run the following command from Matlab terminal (command window)
% Generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

% publish('name_surname_ID_hw1.m','pdf')


