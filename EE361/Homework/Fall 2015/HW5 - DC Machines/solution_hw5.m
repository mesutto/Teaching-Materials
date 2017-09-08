
%% EE361 HW#5

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 123456

%%
% PARAMETERS

% drag force
p = 1.225; % kg/m^3
A = 10; % m^2
Cd = 0.8;

% friction
K = 10; % kg/s

% gravity
g = 9.8; % m/s^2

% motor
Km = 4; % V/(rad/sec)
Ra = 0.027; % ohm
Prated = 240*1e3; % watt
Nrated = 673; % rpm
Vrated = 300; % volts
Irated = 800; % amps

% train
gear_ratio = 0.72;
wheel_radius = 0.4; % m
mass = 70*1e3; % kg


%%
%Part I

%%
% Part I-a

Ts = 1; % time step (seconds)
t = 0:Ts:1e3; % time vector
Num = numel(t);

Ts = 1; %seconds
t = 0:Ts:1e3; %seconds
Num = numel(t);
final = 0;
Fnet = zeros(1,Num);
acceleration = zeros(1,Num);
velocity = zeros(1,Num);
position = zeros(1,Num);
Ea = zeros(1,Num);
Ia = zeros(1,Num);
Vt = zeros(1,Num);
wmotor = zeros(1,Num);
Nmotor = zeros(1,Num);
efficiency = zeros(1,Num);


%%
% part a-(i)

%%
% $w_{rated}=N_{rated}2\pi/60$
%%
% $T_{rated}=P_{rated}/w_{rated}$

%%
% $F_{train}=2T_{rated}gear/radius$

%%
% $F_{drag}=1/2C_dApv^2$

%%
% $F_{friction}=Kv^2$

%%
% $F_{net}=F_{train}-F_{drag}-F_{friction}$

%%
% $a=F_{net}/m$

%%
% $v(k+1)=v(k)+a(k)T_s$

%%
% $x(k+1)=x(k)+v(k)T_s$

%%
% $w_{motor}=v*gear/radius$

%%
% $N_{motor}=w_{motor}60/(2\pi)$

%%
% $E_a=K_mw_{motor}$

%%
% $I_a=T_{rated}/K_m$

%%
% $V_t=E_a + I_aR_a$

%%
% $P_{in}=V_tI_a$

%%
% $P_{out}=E_aI_a$

%%
% $efficiency=100*P_{out}/P_{in}$


wrated = Nrated*2*pi/60;
Trated = Prated/wrated;
Ftrain = Trated*2*gear_ratio/(wheel_radius);


k = 0;
while (1)
    k = k+1;
    
    Fdrag = (1/2)*Cd*A*p*velocity(k)^2;
    Ffriction = K*velocity(k);
    Fnet(k) = Ftrain-Fdrag-Ffriction;
    
    acceleration(k) = Fnet(k)/mass;
    velocity(k+1) = velocity(k) + acceleration(k)*Ts;
    position(k+1) = position(k) + velocity(k)*Ts;
    
    wmotor(k) = (velocity(k)/wheel_radius)*gear_ratio;
    Nmotor(k) = wmotor(k)*60/(2*pi);
    Ea(k) = Km*wmotor(k);
    Ia(k) = Trated/Km;
    Vt(k) = Ia(k)*Ra + Ea(k);
    Pin = Vt(k)*Ia(k);
    Pout = Ea(k)*Ia(k);
    efficiency(k) = 100*Pout/Pin;
    
    if velocity(k) >= 140/3.6;
        final = k;
        break;
    end
    if k > Num;
        break;
    end
end


%%
% part a-(ii)

figure;
plot(t,Fnet,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Net Force (N)');
title('Net Force Against Time');


%%
% part a-(iii)

figure;
subplot(3,1,1);
plot(t,acceleration,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Acceleration (m/s^2)');

subplot(3,1,2);
plot(t,velocity*3.6,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Velocity (km/h)');

subplot(3,1,3);
plot(t,position,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Position (m)');


%%
% part a-(iv)

figure;
subplot(3,1,1);
plot(t,Ia,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Armature Current (Amps)');

subplot(3,1,2);
plot(t,Ea,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Back EMF (Volts)');

subplot(3,1,3);
plot(t,Vt,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Terminal Voltage (Volts)');


%%
% part a-(v)

figure;
plot(t,efficiency,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Efficiency');
ylim([0 100]);

%%
% part a-(vi)

time_length = t(final);
disp(time_length);

%%
% part a-(vii)

position_length = position(final);
disp (position_length);


%%
% part a-(viii)

%%
% The traction machines are operated in motoring mode
%%
% Ia is in positive direction
%%
% Vt and Ea have positive polarity


%%
% Part I-b

Ts = 1; %seconds
t = 0:Ts:1e3; %seconds
Num = numel(t);
final = 0;
Fnet = zeros(1,Num);
deceleration = zeros(1,Num);
velocity = 140/3.6*ones(1,Num);
position = zeros(1,Num);
Ea = zeros(1,Num);
Ia = zeros(1,Num);
Vt = zeros(1,Num);
wmotor = zeros(1,Num);
Nmotor = zeros(1,Num);
efficiency = zeros(1,Num);


%%
% All parameters found in part (a) are valid at this operating condition
% except net force. All force components are against (reverse direction to)
% the speed during acceleration.

%%
% The acceleration direction is reversed (deceleration) so that speed
% formula has a '-' sign.

%%
% The machine is in generating mode so that Ea is leading (Ea = Vt+RaIa).
% Efficiency is calculated such that EaIa is input power and VtIa is
% output power.


%%
% $F_{net}=F_{train}+F_{drag}+F_{friction}$

%%
% $v(k+1)=v(k)-a(k)T_s$

%%
% $V_t = E_a - I_aR_a$

%%
% $P_{in}=V_tI_a$

%%
% $P_{out}=E_aI_a$

%%
% $efficiency=100*P_{out}/P_{in}$


% part a-(i)
wrated = Nrated*2*pi/60;
Trated = Prated/wrated;

Ftrain = Trated*2*gear_ratio/(wheel_radius);

k = 0;
while (1)
    k = k+1;
    
    Fdrag = (1/2)*Cd*A*p*velocity(k)^2;
    Ffriction = K*velocity(k);
    Fnet(k) = Ftrain+Fdrag+Ffriction;
    
    deceleration(k) = Fnet(k)/mass;
    velocity(k+1) = velocity(k) - deceleration(k)*Ts;
    position(k+1) = position(k) + velocity(k)*Ts;
    
    wmotor(k) = (velocity(k)/wheel_radius)*gear_ratio;
    Nmotor(k) = wmotor(k)*60/(2*pi);
    Ea(k) = Km*wmotor(k);
    Ia(k) = Trated/Km;
    Vt(k) = -Ia(k)*Ra + Ea(k);
    if Vt(k) >= 0
        Pout = abs(Vt(k)*Ia(k));
        Pin = abs(Ea(k)*Ia(k));
    else
        Pout = abs(Vt(k)*Ia(k));
        Pin = abs(Ea(k)*Ia(k));
    end
    efficiency(k) = 100*Pout/Pin;
    
    if velocity(k) <= 0;
        final = k;
        break;
    end
    if k > Num;
        break;
    end
end



%%
% part b-(i)

figure;
plot(t,Fnet,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Net Force (N)');


%%
% part b-(ii)

figure;
subplot(3,1,1);
plot(t,deceleration,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Deceleration (m/s^2)');

subplot(3,1,2);
plot(t,velocity*3.6,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Velocity (km/h)');

subplot(3,1,3);
plot(t,position,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Position (m)');


%%
% part b-(iii)

figure;
subplot(3,1,1);
plot(t,Ia,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Armature Current (Amps)');

subplot(3,1,2);
plot(t,Ea,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Back EMF (Volts)');

subplot(3,1,3);
plot(t,Vt,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Terminal Voltage (Volts)');


%%
% part b-(iv)

figure;
plot(t,efficiency,'k -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Efficiency');
ylim([0 100]);


%%
% part b-(v)

time_length = t(final);
disp(time_length);


%%
% part b-(vi)

position_length = position(final);
disp (position_length);


%%
% part b-(vii)

%%
% The traction machines are operated in generating mode (braking)
%%
% Ia is in negative direction
%%
% Vt and Ea have positive polarity for most of the operation. For very low
% speeds, since Ea is close to zero, Vt should be reversed by the DC/DC
% converter (reversed polarity)


%%
% Part II

Ts = 1; %seconds
t = 0:Ts:1e5; %seconds
Num = numel(t);
final = 0;
Fnet = zeros(1,Num);
acceleration = zeros(1,Num);
velocity = 140/3.6*ones(1,Num);
position = zeros(1,Num);
Ea = zeros(1,Num);
Ia = zeros(1,Num);
Vt = zeros(1,Num);
wmotor = zeros(1,Num);
Nmotor = zeros(1,Num);
efficiency = zeros(1,Num);


%%
% All parameters found in part (a) are valid at this operating condition
% except gravitational force. The force produced by the train (traction
% motors) is against all force components (friction, drag, gravitational)


%%
% $F_{net}=F_{train}-F_{drag}-F_{friction}-F_{gravitational}$

%%
% $F_{gravitational}=mgsin(0.5)$


wrated = Nrated*2*pi/60;
Trated = Prated/wrated;

Ftrain = Trated*2*gear_ratio/(wheel_radius);

k = 0;
while (1)
    k = k+1;
    
    Fdrag = (1/2)*Cd*A*p*velocity(k)^2;
    Ffriction = K*velocity(k);
    Fgravity = mass*g*sin(0.5*pi/180);
    Fnet(k) = Ftrain-Fdrag-Ffriction-Fgravity;
    
    acceleration(k) = Fnet(k)/mass;
    velocity(k+1) = velocity(k) + acceleration(k)*Ts;
    position(k+1) = position(k) + velocity(k)*Ts;
    
    wmotor(k) = (velocity(k)/wheel_radius)*gear_ratio;
    Nmotor(k) = wmotor(k)*60/(2*pi);
    Ea(k) = Km*wmotor(k);
    Ia(k) = Trated/Km;
    Vt(k) = Ia(k)*Ra + Ea(k);
    Pin = Vt(k)*Ia(k);
    Pout = Ea(k)*Ia(k);
    efficiency(k) = 100*Pout/Pin;
    
    if position(k) >= 40000;
        final = k;
        break;
    end
    if k > Num;
        break;
    end
end



%%
% part II-(i)

figure;
plot(t,Fnet,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Net Force (N)');


%%
% part II-(ii)

figure;
subplot(3,1,1);
plot(t,acceleration,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Acceleration (m/s^2)');

subplot(3,1,2);
plot(t,velocity*3.6,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Velocity (km/h)');

subplot(3,1,3);
plot(t,position,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Position (m)');


%%
% part II-(iii)

figure;
subplot(3,1,1);
plot(t,Ia,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Armature Current (Amps)');

subplot(3,1,2);
plot(t,Ea,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Back EMF (Volts)');

subplot(3,1,3);
plot(t,Vt,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Terminal Voltage (Volts)');


%%
% part II-(iv)

figure;
plot(t,efficiency,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Efficiency');
ylim([0 100]);


%%
% part II-(v)

time_length = t(final);
disp(time_length);


%%
% part II-(vi)

%%
% The traction machines are operated in motoring mode
%%
% Ia is in positive direction
%%
% Vt and Ea have positive polarity


%%
% Part III

Ts = 1; %seconds
t = 0:Ts:1e5; %seconds
Num = numel(t);
final = 0;
Fnet = zeros(1,Num);
acceleration = zeros(1,Num);
velocity = 50/3.6*ones(1,Num);
%velocity = zeros(1,Num);
position = zeros(1,Num);
Ea = zeros(1,Num);
Ia = zeros(1,Num);
Vt = zeros(1,Num);
wmotor = zeros(1,Num);
Nmotor = zeros(1,Num);
efficiency = zeros(1,Num);


%%
% In this part, initial speed and electromagnetic torque (which produces
% Ftrain) are changed.

%%
% During downhill railroad, Ftrain, Fdrag anfd Ffriction are in the
% opposite direction with the speed whereas gravitational force is in the
% same direction. Thus net force changes as below.

%%
% As in part (I-b), the generation mode formulas are used.


%%
% $F_{train}=(1/5)2T_{rated}gear/radius$

%%
% $v(0) = 50/3.6 m/s$

%%
% $F_{net}=-F_{train}-F_{drag}-F_{friction}+F_{gravitational}$

%%
% $F_{gravitational}=mgsin(0.5)$

%%
% $V_t = E_a - I_aR_a$

%%
% $P_{in}=V_tI_a$

%%
% $P_{out}=E_aI_a$

%%
% $efficiency=100*P_{out}/P_{in}$


wrated = Nrated*2*pi/60;
Trated = Prated/wrated;

Ftrain = (0.2)*Trated*2*gear_ratio/(wheel_radius);

k = 0;
while (1)
    k = k+1;
    
    Fdrag = (1/2)*Cd*A*p*velocity(k)^2;
    Ffriction = K*velocity(k);
    Fgravity = mass*g*sin(0.5*pi/180);
    Fnet(k) = -Ftrain-Fdrag-Ffriction+Fgravity;
    
    acceleration(k) = Fnet(k)/mass;
    velocity(k+1) = velocity(k) + acceleration(k)*Ts;
    position(k+1) = position(k) + velocity(k)*Ts;
    
    wmotor(k) = (velocity(k)/wheel_radius)*gear_ratio;
    Nmotor(k) = wmotor(k)*60/(2*pi);
    Ea(k) = Km*wmotor(k);
    Ia(k) = Trated/(5*Km);
    Vt(k) = -Ia(k)*Ra + Ea(k);
    Pin = Ea(k)*Ia(k);
    Pout = Vt(k)*Ia(k);
    efficiency(k) = 100*Pout/Pin;
    
    if position(k) >= 40000;
        final = k;
        break;
    end
    if k > Num;
        break;
    end
end


%%
% part III-(i)

figure;
plot(t,Fnet,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Net Force (N)');


%%
% part III-(ii)

figure;
subplot(3,1,1);
plot(t,acceleration,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Acceleration (m/s^2)');

subplot(3,1,2);
plot(t,velocity*3.6,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Velocity (km/h)');

subplot(3,1,3);
plot(t,position,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Position (m)');


%%
% part III-(iii)

figure;
subplot(3,1,1);
plot(t,Ia,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Armature Current (Amps)');

subplot(3,1,2);
plot(t,Ea,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
ylabel('Back EMF (Volts)');

subplot(3,1,3);
plot(t,Vt,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlim([0,t(final)]);
xlabel('Time (s)');
ylabel('Terminal Voltage (Volts)');


%%
% part III-(iv)

figure;
plot(t,efficiency,'b -','Linewidth',1.5);
grid on;
xlim([0,t(final)]);
set(gca,'FontSize',12);
xlabel('Time (s)');
ylabel('Efficiency');
ylim([0 100]);


%%
% part III-(v)

time_length = t(final);
disp(time_length);


%%
% part III-(vi)

%%
% The traction machines are operated in generating mode (braking)
%%
% Ia is in negative direction
%%
% Vt and Ea have positive polarity


%%
%publish('solution_hw5.m', 'pdf')

