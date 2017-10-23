%% EE361 HW#1 FALL 2016

%% NAME: _SOLUTION_

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

BHdata = xlsread('B-H_char.xlsx');
Hnonlinear = BHdata(:,1);
Bnonlinear = BHdata(:,2);


%% Part A)
% Calculate the number of turns

permeability = relative_perm*air_perm; % H/m
reluctance = path_length/(permeability*core_area);
turns = sqrt(reluctance*Lrequired);
turns = round(turns);
fprintf('Required number of turns is %d.\n',turns);


%% Part B)

permeability = relative_perm*air_perm; % H/m
Hsat = Bsat/permeability; % A/m

Hlinear = 0:20:500; % A/m 
Blinear = zeros(1,numel(Hlinear)); % Tesla
for k = 1:numel(Hlinear)
    if Hlinear(k)<=Hsat
        Blinear(k) = Hlinear(k)*permeability;
    else
        Blinear(k) = Bsat;
    end
end

figure;
plot(Hlinear,Blinear,'b-','LineWidth',2.0);
hold on;
plot(Hnonlinear,Bnonlinear,'r-','LineWidth',2.0);
hold off;
xlabel('Magnetic Field Intensity (A/m)','Fontweight','Bold');
ylabel('Flux Density (Tesla)','Fontweight','Bold');
title ('Linear B-H Characteristic','Fontweight','Bold');
legend('Linear','Nonlinear');
grid on;


%% Part C)
% Linear case:

flux_density = 0.30;
current_linear = (flux_density*path_length)/(permeability*turns);
fprintf('The required inductor current for linear case is %d Amps.\n',current_linear);

%%
% Nonlinear case:

Hrequired = 75; % A/m
current_nonlinear = (Hrequired*path_length)/(turns);
fprintf('The required inductor current for nonlinear case is %d Amps.\n',current_nonlinear);


%% Part D)
% Linear case:

flux_density = 0.45;
current_linear = (flux_density*path_length)/(permeability*turns);
fprintf('The required inductor current for linear case is %d Amps.\n',current_linear);

% Nonlinear case:

Hrequired = 180; % A/m
current_nonlinear = (Hrequired*path_length)/(turns);
fprintf('The required inductor current for nonlinear case is %d Amps.\n',current_nonlinear);

%%
% As it can be observed from the B-H curves for linear and nonlinear cases,
% the operating points are very close for 0.3 Tesla whereas there is a
% larger deviation for 0.45 Tesla. This result shows that linear
% approximation is a good practice and can estimate in the vicinity of the
% operating point; however, the estimation may fail when the inductor
% operates at a different point.


%% Part II)

Imax = (Bsat*path_length)/(permeability*turns);
fprintf('The maximum current without saturating the core is %d Amps.\n',Imax);


%% Part III)
stored_energy = (1/2)*Lrequired*Imax^2; % Joules
fprintf('Stored energy with this current is %d Joules.\n',stored_energy);

core_volume = core_area*path_length; % m^3
stored_energy2 = (Bsat^2/(2*permeability))*core_volume;
fprintf('Stored energy found with B-H point is %d Joules.\n',stored_energy2);


%%
% energy stored on an inductor can be calculated by using both electrical
% parameters and magnetic parameters. Calculation with electrical
% parameters is usually performed for the selection of the core using the
% design specifications (required inductance and maximum current).
% Calculation with magnetic parameters is more useful when hysteresis
% losses are to be calculated or core material is to be selected.


%% Part IV)
% One may insert an air gap to the core. Air has a relative permeability of
% 1 so that, even a small air gap will result in a large reluctance. If the
% same inductance is to be achieved, reqired number of turns will increase.
% For the same flux (and flux density, note that area is not changing), a
% larger reluctance will yield a higher current at saturation point.
% Therefore, more energy can be stored if inductance is the same.


%% Part V)
% As the core saturates; the relative permeability of the core will drop
% because flux density cannot be made larger with a higher magnetic field
% intensity. The reluctance of the core will increase since the relative
% permeability decreases. Inductance will decrease since the reluctance
% increases. An inductor, thus, cannot be considered to have a constant
% inductance at all times. Depending on the application, if the design is
% not well enough such that some of the operation lies in the saturation
% region, inductance will be variable.


%% Q.2)
% Given parameters

gap_length = 1e-2; % m
Bsat = 1; % Tesla
Hsat = 300; % A/m
core_area = 10e-4; % m^2
air_perm = 4*pi*1e-7; % H/m
turn = 30;


%% Part I)

permeability = Bsat/Hsat; % H/m
relative_perm = permeability/air_perm;
fprintf('Relative permeability of the core is %d.\n',relative_perm);


%% Part II)

BlegB = 0.9; % Tesla
length_B = 0.3; % m
length_C = 0.09; % m
reluctance_B = length_B/(permeability*core_area);
reluctance_C = length_C/(permeability*core_area)+gap_length/(air_perm*core_area);
reluctance_A = reluctance_B;
flux_B = BlegB*core_area; % Weber
flux_C = flux_B*(reluctance_B/reluctance_C);
flux_A = flux_B+flux_C;
MMF = flux_A*reluctance_A+flux_C*reluctance_C;
current = MMF/turn;
fprintf('Coil-A current is %d Amps.\n',current);


%% Part III)

flux_density_gap = flux_C/core_area;
fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);


%% Part IV)
% If one applies superposition, it will be seen that flux due to coil-A is
% cancelled by flux due to coil-B in the air gap. Therefore, flux density
% in the air gap will be zero. Moreover, flux due to coil A only is the
% same as the one found in part II in leg-B. Flux created in leg-B due to
% coil-B will be the same (in magnitude) flux created in leg-A due to
% coil-A, which was found also in part II. As they will have the same
% direction because of the current directions in the coils, total flux in
% leg-B can be found as follows:

flux_B_duetoA = flux_B;
flux_B_duetoB = flux_A;
flux_B = flux_B_duetoA + flux_B_duetoB;
flux_density_B = flux_B/core_area;

%%
% Then again, the core will be saturated, so flux density will be 1 Tesla
% (Bsat).

flux_density_gap = 0;
flux_density_B = 1;

fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);
fprintf('The flux density in leg-B is %d Tesla.\n',flux_density_B);


%% Part V)
% When the current is doubled, it is obvious that leg-A which has the
% highest flux will be saturated. Therefore, its flux density will be 1
% Tesla (Bsat). 
flux_density_A = 1;
flux_A = flux_density_A * core_area;
flux_C = flux_A/(1+reluctance_C/reluctance_B);
flux_B = flux_A/(1+reluctance_B/reluctance_C);
flux_density_gap = flux_C/core_area;
flux_density_B = flux_B/core_area;

fprintf('The flux density in the gap is %d Tesla.\n',flux_density_gap);
fprintf('The flux density in leg-B is %d Tesla.\n',flux_density_B);


%% Part VI)
% A DC excitation will result in a constant magnetic field on the core. In
% order to dissipate power on the resistor, current should be induced which
% can be achieved by inducing voltage on coil-B. It is not possible to
% induce voltage on coil-B with constant magnetic field since e = Ndphi/dt.

%% Part VII)
% With sinusoidal excitation, a time-varying magnetic field is created so
% that voltage can be induced on coil-B. The induced voltage will result in
% a current on the resistor so that power can be dissipated. Actually, this
% is how a transformer works. 

%% PArt VIII)
% Since the excitation is doubled, the core will saturate as the previous
% flux density was close to the saturation point. Therefore, the current on
% the resistor will not increase proportionally.

%% Part IX)
% Removal of the gap will result in reduction on the reluctance of the
% center leg (where the gap was present). Therefore, more flux will flow
% through the center leg as its reluctance decreased so that the mutual
% inductance will decrease.



