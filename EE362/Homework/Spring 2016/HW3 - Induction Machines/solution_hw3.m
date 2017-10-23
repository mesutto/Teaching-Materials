%% EE362 HW#3

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 123456

%% Q.1)

%% a)
f = 50; % Hz
Nr_nl = 1480; % rpm
p = round(120*f/Nr_nl);
fprintf('Pole number of the machine is %d.\n',p);


%% b)
Ns = 120*f/p; % rpm
fprintf('Synchronous speed of the machine is %d rpm.\n',Ns);


%% c)
Nr = 0; % rpm
fr = p*(Ns-Nr)/120; % Hz
fprintf('Frequency of rotor induced currents is %d Hz.\n',fr);


%% d)
s = 0.05;
Nr = (1-s)*Ns; % rpm
fprintf('Speed of the rotor is %d rpm.\n',Nr);


%% e)
fr = p*(Ns-Nr)/120; % Hz
fprintf('Frequency of rotor induced currents is %d Hz.\n',fr);


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
Vphase = Vline/sqrt(3); % volts
X1 = L1*2*pi*frequency; % ohms
X2p = L2p*2*pi*frequency; % ohms
Xm = Lm*2*pi*frequency; % ohms
Nsync = 120*frequency/pole; % rpm
wsync = Nsync*2*pi/60; % rad/sec

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
Nr = Nsync*(1-s); % rpm
wr = Nr*2*pi/60; % rad/sec
num = numel(s);
Tm = zeros(1,num); % Nm

% Torque array using the calculated variables and slip variation
Tm = (3*abs(Vth)^2/wsync)*(1./ ( (Rth+R2p./s).^2 + (Xth+X2p)^2 ) )...
    .*(R2p./s); % Nm

% At synchronous speed, torque will be zero (avobe equation cannot calculate)
Tm((s==0)) = 0; % Nm

% Plot the torque-speed curve
figure;
plot(Nr,Tm,'k-','LineWidth',2.0);
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Torque (Nm)','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
grid on;

% Obtain the output power characteristics
Pm = Tm.*wr; % Watts

% Plot the output power-speed curve
fig = figure;
plot(Nr,Pm*1e-3,'k-','LineWidth',2.0);
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Output Power (kW)','Fontweight','Bold');
title ('Induction Motor Output Power-Speed Characteristic','Fontweight','Bold');
grid on;

% Store the torque characteristics for further usage
Toriginal = Tm; % Nm


%% Part b)

% Calculate the asked parameters using the torque characteristics

starting_torque = Tm((s==1)); % Nm
max_torque = max(Tm); % Nm
max_power = max(Pm); % Watts
slip_max_torque = s((Tm==max_torque));
slip_max_power = s((Pm==max_power));

fprintf('The starting torque is %d Nm.\n', starting_torque);
fprintf('The maximum torque is %d Nm.\n', max_torque);
fprintf('The maximum power is %d Watts.\n', max_power);
fprintf('The slip at maximum torque is %d.\n', slip_max_torque);
fprintf('The slip at maximum power is %d.\n', slip_max_power);

%%
% Maximum power does not occur at the slip where maximum torque occurs. In
% fact, slip of maximum power is smaller that the other. In other words,
% speed of maximum power is higher. The reason is that, since P = T*wr, as
% the speed increases further from the maximum torque point, the increase
% of speed overcomes the decrease of torque for a while. After a point
% (Pmax), torque decay is much rapid.


%% Part c)

%%
% No it is not. Because, Tload(wr=0) > Tstarting
%%
% Method : External rotor resistance


syms res
Tload_start = 1253; % Nm

add_resistance = double(solve((3*abs(Vth)^2/wsync)*((R2p+res)...
    /((Rth+R2p+res)^2+(Xth+X2p)^2))==Tload_start,...
    'IgnoreAnalyticConstraints',true));

fprintf('The possible external rotor resistance values are:\n');
fprintf('%d Ohms and\n',add_resistance(1));
fprintf('%d Ohms and\n',add_resistance(2));

add_res = add_resistance(2);
fprintf('Selected external rotor resistance is: %d Ohms\n',add_res);

% Calculate the new starting torque to check your solution
Tst_new = (3*abs(Vth)^2/wsync)*((R2p+add_res)/...
    ((Rth+R2p+add_res)^2+(Xth+X2p)^2));

fprintf('New starting torque is: %d Nm\n',Tst_new);

%%
% The equation provides two solutions: 2 Ohms and 10 mOhms. The 1st
% solution corresponds to a curve where maximum torque is in braking mode
% whereas the 2nd solution provides an increase on the starting torque by
% slightly shifting the curve to the left. Obviously, 1st solution is very
% inefficient and therefore the external resistance to be connected is
% chosen as 10 mOhms. After the startup, the external resistance should be
% removed (if possible) just after the original torque is higher than the
% load torque. After that point, the load torque should always be lower up
% to the steady state point. Otherwise, the motor may slow down and never
% reach the stable region of the torque-speed curve.


%% Part d)

% Torque with external resistance
Tm = (3*abs(Vth)^2/wsync)*(1./ ((Rth+(R2p+add_res)./s).^2+(Xth+X2p)^2))...
    .*((R2p+add_res)./s); % Nm
Tm((s==0)) = 0; % Nm

% Load torque
load_torque = 1253 + 0.0824*wr.^2; % Nm

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

% Using the graph:
Nr_op = 1159; % rpm
fprintf('Rotor speed at this operating point is %d rpm.\n',Nr_op);


%% Part e-2)

% This can both be calculated by using graph and using the load torque at
% the given speed:
Tm_op = 2467; % Nm
wr_op = Nr_op*2*pi/60; % rad/sec
Tm_op = 1253 + 0.0824*wr_op^2; % Nm
fprintf('Torque at this operating point is %d Nm.\n',Tm_op);


%% Part e-3)

slip = (Nsync-Nr_op)/Nsync;
Pm_op = Tm_op*wr_op; % watts
Pout = Pm_op; % watts
I2p = sqrt((slip/(1-slip))*(Pm_op/(3*R2p))); % amps
Pcur = 3*I2p^2*R2p; % watts
Pag = Pcur + Pm_op; % watts
I1 = I2p; % amps
Pcus = 3*I1^2*R1; % watts
Pc = 3*Vphase^2/Rc; % watts
Pin = Pag + Pcus + Pc; % watts
efficiency = Pout/Pin*100; % percent

fprintf('Efficiency at this operating point is %d %%\n',efficiency);


%% Part f)

%% Part f-1)

% Define new variables
frequency_new = 55; % hz
Vline_new = Vline*(frequency_new/frequency); % volts

% Calculate all the parameters to be used in the torque equation, with the
% new frequency and voltage:

Vphase = Vline_new/sqrt(3); % volts
X1 = L1*2*pi*frequency_new; % ohms
X2p = L2p*2*pi*frequency_new; % ohms
Xm = Lm*2*pi*frequency_new; % ohms
Nsync = 120*frequency_new/pole; % rpm
wsync = Nsync*2*pi/60; % rad/sec

Zm = (1j*Xm*Rc)/(1j*Xm+Rc); % ohms
Z1 = R1+1j*X1; % ohms
Vth = Vphase*Zm/(Z1+Zm); % volts
Zth = Z1*Zm/(Z1+Zm); % ohms
Rth = real(Zth); % ohms
Xth = imag(Zth); % ohms

% Define a new slip array and obtain a new speed array
% Note that the synchronous speed is now changed
s2 = -1:0.001:2;
s2 = fliplr(s2);
Nr2 = Nsync*(1-s2);
num = numel(s2);
Tm = zeros(1,num);

% Obtain the torque
Tm = (3*abs(Vth)^2/wsync)*(1./((Rth+R2p./s2).^2+(Xth+X2p)^2)).*(R2p./s2);
Tm((s2==0)) = 0;

% Plot the torque-speed curves
figure;
plot(Nr,Toriginal,'k-','LineWidth',2.0);
hold on;
plot(Nr2,Tm,'r-','LineWidth',2.0);
hold on;
plot(Nr,load_torque,'b-','LineWidth',2.0);
hold off;
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Torque (Nm)','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
grid on;
xlim([0 1500]);


%% Part f-2)

%%
% Just after the frequency (and voltage) reduction, the characteristics is
% shifted to the left as shown in Part 1. The electrical time constant is
% related to the inductances and resistances of the machine whereas the
% mechanical time constant is related to the inertia of the system. Also
% note that, change in the torque is directly related to change in the
% current and therefore the electrical time constant whereas change in the
% speed of a mechanical system is directly related to the mechanical time
% constant. Generally, mechanical time constants are much higher that
% electrical time constants such that electrical time constant can be
% neglected. All in all, torque of the machine can be altered suddenly.
%%
% In our case, as the characteristics is shifted, the operating point is
% moved down vertically to a new point which is in the generating region.
% This new point should be on the new machine torque curve. As time goes
% on, depending on the system inertia, the machine starts to slow down
% because, at the new point, net torque is negative. The operating point
% reaches the new synchronous speed (Tm = 0), but the machine continues to
% slow down since the net torque is still negative. The machine is now in
% the motoring region. Up to the point where Tnet = 0 which is denoted as
% point B, the machine speed decreases following the machine characteristics.


%% Part f-3)

% Let us call this point as C.
% Using the graph:
Nr_C = 1159; % rpm
Tm_C = -3497; % Nm

fprintf('Rotor apeed just after the frequency reduction is %d rpm\n',Nr_C);
fprintf('Torque just after the frequency reduction is %d Nm\n',Tm_C);


%% Part f-4)

% Using the graph:
Nr_B = 1063; % rpm
Tm_B = -2274; % Nm

fprintf('Rotor apeed at final operating point is %d rpm\n',Nr_B);
fprintf('Torque  at final operating point is %d Nm\n',Tm_B);


%% Part g)

%% Part g-1)

new_load_torque = -load_torque;

% Plot the torque-speed curves
figure;
plot(Nr,Toriginal,'k-','LineWidth',2.0);
hold on;
plot(Nr,load_torque,'r-','LineWidth',2.0);
hold on;
plot(Nr,new_load_torque,'b-','LineWidth',2.0);
hold off;
xlabel('Rotor speed (rpm)','Fontweight','Bold');
ylabel('Torque (Nm)','Fontweight','Bold');
title ('Induction Motor Torque-Speed Characteristic','Fontweight','Bold');
grid on;
xlim([0 1500]);


%% Part g-2)

%%
% The load characteristics is changed this time. Just after this, the net
% torque will be positive (Tm-TL > 0) so that the machine starts to
% accelerate. This acceleration will occur following the machine torque
% characteristics. It will reach the synchronous speed (Tm=0), but the
% acceleration will continue since the net torque is still positive. After
% that, the machine will operate in the generating region until it reaches
% the final operating point (pt B) where Tnet=0. the machine will remain at
% that point and generate power if no other change is applied to the
% system.


%% Part g-3)

% Using the graph:
Nr_B = 1242; % rpm
Tm_B = -2647; % Nm

fprintf('Rotor apeed at final operating point is %d rpm\n',Nr_B);
fprintf('Torque  at final operating point is %d Nm\n',Tm_B);

