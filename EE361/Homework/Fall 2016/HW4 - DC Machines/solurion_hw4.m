
%% EE361 Fall 2016 HW#4

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 123456

%% Q1)

%% Motor-1

%% a.
% It is constant. As the rotor rotates, the reluctance does not change.
%% b.
% It is varying. The linkage of the flux by one coil to the other changes
% as the rotor rotates.
%% c.
% It is constant. As the rotor rotates, the reluctance does not change.
%% d.
% Both coils should have currents so that this motor can produce torque.
% The answer is NO.
%% e.
% Both coils should have currents so that this motor can produce torque.
% The answer is NO.
%% f.
% Both coils should have currents so that this motor can produce torque.
% The answer is NO.


%% Motor-2

%% a.
% It is varying. As the rotor rotates, the reluctance which the flux of
% stator coil changes.
%% b.
% It is varying. The linkage of the flux by one coil to the other changes
% as the rotor rotates.
%% c.
% It is constant. As the rotor rotates, the reluctance does not change.
%% d.
% Stator coil current is enough for this motor to produce torque due to L11
% term.
% The answer is YES.
%% e.
% L22 term cannot produce torque.
% The answer is NO.
%% f.
% Stator coil should have current so that this motor can produce torque.
% The answer is NO.


%% Motor-3

%% a.
% It is varying. As the rotor rotates, the reluctance which the flux of
% stator coil changes.
%% b.
% It is varying. The linkage of the flux by one coil to the other changes
% as the rotor rotates.
%% c.
% It is varying. As the rotor rotates, the reluctance which the flux of
% rotor coil changes.
%% d.
% Having current on only one coil is enough as all the terms can produce
% torque.
% The answer is YES.
%% e.
% The answer is YES.
%% f.
% If neither of the coils have current, the motor cannot produce any
% torque.
% The answer is NO.


%% Motor-4

%% a.
% It is constant. As the rotor rotates, the reluctance does not change.
%% b.
% It is varying. The linkage of the flux by one coil to the other changes
% as the rotor rotates.
%% c.
% It is varying. As the rotor rotates, the reluctance which the flux of
% rotor coil changes.
%% d.
% Rotor coil should have current so that this motor can produce torque.
% The answer is NO.
%% e.
% Having current on rotor coil will produce torque.
% The answer is YES.
%% f.
% If neither of the coils have current, the motor cannot produce any
% torque.
% The answer is NO.



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


%% Part I

wheel_radius = wheel_diameter/2; % m
wrated = vrated/wheel_radius; % rad/sec
Trated = Prated/wrated; % Nm
Irated = Trated/Ka; % A

fprintf('Rated speed of the motor is %g rad/sec.\n',wrated);
fprintf('Rated torque of the motor is %g Nm.\n',Trated);
fprintf('Rated current of the motor is %g A.\n',Irated);

%% Part II

Fdrag = 0.5*p*A*Cd*vrated^2; % N
Ffriction = K*vrated; % N
Fnet = 0; % N
Fmotor = Fnet + Fdrag + Ffriction; % N 

Tmotor = Fmotor*wheel_radius; % Nm

Ia = Tmotor/Ka; % A

wm = vrated/wheel_radius; % rad/sec
Ea = Ka*wm; % V
Vt = Ra*Ia+Ea; % V

Pin = Vt*Ia; % W
Pout = Ea*Ia; % W
efficiency = 100*Pout/Pin;

fprintf('The drag force at rated speed is %g N.\n',Fdrag);
fprintf('The frictional force at rated speed is %g N.\n',Ffriction);
fprintf('The net force at rated speed is %g N.\n',Fnet);
fprintf('The motor torque (T2) is %g N.\n',Tmotor);
fprintf('The armature current is %g A.\n',Ia);
fprintf('The back emf is %g V.\n',Ea);
fprintf('The terminal voltage is %g V.\n',Vt);
fprintf('The efficiency is %g %%.\n',efficiency);


%% Part III

Fdrag = 0.5*p*A*Cd*vrated^2; % N
Ffriction = K*vrated; % N
Fgravitation = weight*g*sin(2*pi/180); % N
Fnet = 0; % N
Fmotor = Fnet + Fdrag + Ffriction + Fgravitation; % N 

Tmotor = Fmotor*wheel_radius; % Nm

Ia = Tmotor/Ka; % A

wm = vrated/wheel_radius; % rad/sec
Ea = Ka*wm; % V
Vt = Ra*Ia+Ea; % V

Pin = Vt*Ia; % W
Pout = Ea*Ia; % W
efficiency = 100*Pout/Pin;

fprintf('The gravitational force is %g N.\n',Fgravitation);
fprintf('The drag force at rated speed is %g N.\n',Fdrag);
fprintf('The frictional force at rated speed is %g N.\n',Ffriction);
fprintf('The net force at rated speed is %g N.\n',Fnet);
fprintf('The motor torque (T2) is %g N.\n',Tmotor);
fprintf('The armature current is %g A.\n',Ia);
fprintf('The back emf is %g V.\n',Ea);
fprintf('The terminal voltage is %g V.\n',Vt);
fprintf('The efficiency is %g %%.\n',efficiency);


%% Part IV

Fdrag = 0.5*p*A*Cd*vrated^2; % N
Ffriction = K*vrated; % N
Fgravitation = weight*g*sin(2*pi/180); % N
Fnet = 0; % N
Fmotor = Fgravitation + Fnet - Fdrag - Ffriction; % N 

Tmotor = Fmotor*wheel_radius; % Nm

Ia = Tmotor/Ka; % A

wm = vrated/wheel_radius; % rad/sec
Ea = Ka*wm; % V
Vt = -Ra*Ia+Ea; % V

Pout = Vt*Ia; % W
Pin = Ea*Ia; % W
efficiency = 100*Pout/Pin;

fprintf('The gravitational force is %g N.\n',Fgravitation);
fprintf('The drag force at rated speed is %g N.\n',Fdrag);
fprintf('The frictional force at rated speed is %g N.\n',Ffriction);
fprintf('The net force at rated speed is %g N.\n',Fnet);
fprintf('The motor torque (T2) is %g N.\n',Tmotor);
fprintf('The armature current is %g A.\n',Ia);
fprintf('The back emf is %g V.\n',Ea);
fprintf('The terminal voltage is %g V.\n',Vt);
fprintf('The efficiency is %g %%.\n',efficiency);

%% Part V

%% a.
% From standstill to rated speed, it is a common practice to accelerate the
% motor at rated torque. It is done by keeping the current constant. As the
% speed increases from zero to its rated value, back emf also increases as
% such. Therefore, the terminal voltage is controlled such that, it should
% start from a small value and increase up to rated voltage. This is done
% by the adjustable DC supply. If rated terminal voltage was applied from
% the beginnig, as the back emf is very small, huge amount of currents
% would flow which would damage the motor and the DC/DC converter.

%% b.
% Between B and C, the motor operates at constant speed and constant
% torque. The torque only has drag and friction components. The mode is
% motoring mode of operation.

%% c.
% During this interval, the power drawn from the input was calculated
% (Pin). The speed and torque do not change so this power is constant. If
% the operation takes 4 minutes, the energy delivered can be calculated
% from the power (Ein). From the capacitor energy change, final voltage can
% be calculated.

Pin = 216.92; % W
duration = 4*60; % sec
Ein = Pin*duration; % Joules
Vinitial = 36; % V
Cap = 1000; % F
Vfinal = sqrt(Vinitial^2-2*Ein/Cap); % V

fprintf('The final voltages is %g V.\n',Vfinal);

%% d.
% During this interval, to travel at constant speed, motor torque is
% increased since gravitational force is also present in addition to drag
% and frictional force. It is not wise to use such kind of operation since
% high torque means high motor current. Motor currents above rated will
% cause higher loss and hence worse efficiency. They may also damage the
% motor windings as well as the converter. One can decrease the speed
% (let the bicycle decelerate a while) so that the friction and drag force
% will decrease. That way, it is possible to climb the slope at rated
% torque.

%% e. 
% Between E and F, the gravitational force is in the direction of the
% speed. To operate at constant speed, the motor torque is in the reverse
% direction so that the net force is zero. Therefore, the mode is
% generating mode of operation. The armature current is in the reverse
% direction and back emf is higher than the terminal voltage. The super
% capacitor is charged during this interval.

%% f.
% This part is similar to part (c) whereas the capacitor will charge this
% time. During this interval, the power supplied to the terminals was 
% calculated (Pin). The speed and torque do not change so this power is
% constant. If the operation takes 8 minutes, the energy delivered can be
% calculated from the power (Ein). From the capacitor energy change,
% final voltage can be calculated.

Pin = 83.81; % W
duration = 8*60; % sec
Ein = Pin*duration; % Joules
Vinitial = 30; % V
Cap = 1000; % F
Vfinal = sqrt(Vinitial^2+2*Ein/Cap); % V

fprintf('The final voltages is %g V.\n',Vfinal);


