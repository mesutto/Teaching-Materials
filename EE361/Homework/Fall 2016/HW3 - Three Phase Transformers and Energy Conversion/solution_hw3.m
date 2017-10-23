%% EE361 HW#3 FALL 2016

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 21436587

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
turns1 = 15/154;
turns2 = 154/34.5;

Ztline_ref = turns1^2*Ztline; % Ohms
Zt2_ref = (turns1^2)*Zt2/3; % Ohms
Zf2_ref = (turns1*turns2)^2*Zf2; % Ohms

Ztotal = Zf1+Zt1+Ztline_ref+Zt2_ref+Zf2_ref; % Ohms

Vs_ln = Vs/sqrt(3);
Iload_ref = Iload/(turns1*turns2);

Xtotal = imag(Ztotal);
Rtotal = real(Ztotal);

delta = asin(Xtotal*Iload_ref/Vs_ln);
delta_deg = 180*delta/pi;

Vload_ln_ref = Vs_ln*cos(delta)-Iload_ref*Rtotal;
Vload_ref = Vload_ln_ref*sqrt(3);

Vload = Vload_ref/(turns1*turns2);

%% Part A-(a)
fprintf('Magnitude of the load voltage (line-to-line) is %g Volts.\n',Vload);

%% Part A-(b)
fprintf('Load angle between source and load voltage is %g deg.\n',delta_deg);

%% Part A-(c)
Is = Iload_ref;
fprintf('Line current in feeder-1 is %g Amps.\n',Is);

%% Part A-(d)

time = 0:20e-6:0.04;
Vs_peak = Vs_ln*sqrt(2);
f = 50; % Hz
Vs_a = Vs_peak*sin(2*pi*f*time);
Vs_b = Vs_peak*sin(2*pi*f*time-2*pi/3);
Vs_c = Vs_peak*sin(2*pi*f*time-4*pi/3);

figure;
plot(time,Vs_a,'b -','Linewidth',1.5);
hold on;
plot(time,Vs_b,'k -','Linewidth',1.5);
hold on;
plot(time,Vs_c,'r -','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Voltage (Volts)','FontSize',12,'FontWeight','Bold')
legend('Phase-a','Phase-b','Phase-c');

%% Part A-(e)

Is_peak = Is*sqrt(2);
phase = delta;
Is_a = Is_peak*sin(2*pi*f*time-phase);
Is_b = Is_peak*sin(2*pi*f*time-phase-2*pi/3);
Is_c = Is_peak*sin(2*pi*f*time-phase-4*pi/3);

figure;
plot(time,Is_a,'b -','Linewidth',1.5);
hold on;
plot(time,Is_b,'k -','Linewidth',1.5);
hold on;
plot(time,Is_c,'r -','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Current (Amps)','FontSize',12,'FontWeight','Bold')
legend('Phase-a','Phase-b','Phase-c');


%% Part A-(f)

figure;
plot(time,Vs_a,'b -','Linewidth',1.5);
hold on;
plot(time,Is_a,'k -','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Voltage (Volts),Current (Amps)','FontSize',12,'FontWeight','Bold')
legend('Voltage','Current');


%% Part A-(g)

Vload_ln = Vload/sqrt(3);
Vload_peak = Vload_ln*sqrt(2);
Vload_a = Vload_peak*sin(2*pi*f*time-phase);
Iload_peak = Iload*sqrt(2);
Iload_a = Iload_peak*sin(2*pi*f*time-phase);

figure;
plot(time,Vload_a,'b -','Linewidth',1.5);
hold on;
plot(time,10*Iload_a,'k -','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Voltage (Volts),Current (Amps)','FontSize',12,'FontWeight','Bold')
legend('Voltage','Current');

%% Part A-(h)

pf = cos(delta);
fprintf('Power factor at source terminals is %.3g.\n',pf);

%%
% Power factor is not unity as expected. The inductive lines and
% transformers form a load which is inductive at the source terminals. 

%% Part A-(i)
% One can employ several power factor correction techniques. One example is
% connecting a capacitor which will deliver the amount of reactive power
% that is drawn by the system (lines-transformers and load).

%% Part A-(j)
% All the reactive components will have a greater impedance due to the
% equation: X = 2xpixfxL. This would mean: 1) Higher voltage drop, and hence
% worse regulation. 2) Worse power factor at the source terminals.

%% PArt B-(a)

data = xlsread('load_profile.xlsx');
iload = data(:,2);
hour = data(:,1);
iload2 = smooth(iload); % to smooth the curve

figure;
plot(hour,iload,'bx-','Linewidth',1.5);
hold on;
plot(hour,iload2,'rx-','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Load Current (Amps)','FontSize',12,'FontWeight','Bold')

%% Part B-(b)

iload_ref = iload2/(turns1*turns2);

delta = asin(Xtotal*iload_ref/Vs_ln);
delta_deg = 180*delta/pi;

Vload_ln_ref = Vs_ln*cos(delta)-Iload_ref*Rtotal;
Vload_ref = Vload_ln_ref*sqrt(3);

Vload = Vload_ref/(turns1*turns2);

figure;
plot(hour,Vload,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Load Voltage (Volts)','FontSize',12,'FontWeight','Bold')


%% Part B-(c)

Vrated = 34.5e3;
Vnoload = Vrated*ones(24,1);
regulation = 100*(Vnoload-Vload)/Vrated;

figure;
plot(hour,regulation,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Regulation (Percent)','FontSize',12,'FontWeight','Bold')
ylim([0 5]);

%%
% We want the regulation to be low. Regulation came out to be positive 
% at all times and nonzero since the load is purely resistive and the lines
% are inductive. As expected, regulation is better during the hours where
% less current is drawn by the load. At ruch hours, the system has 
% worse regulation as the voltage drop will be higher on the lines.

%% Part B-(d)

Pload = sqrt(3)*Vload.*iload;
is = iload_ref;
Ploss = is.^2*Rtotal;
efficiency = 100*Pload./(Pload+Ploss);

figure;
plot(hour,efficiency,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Efficiency (Percent)','FontSize',12,'FontWeight','Bold')
ylim([95 100]);

%%
% Similar to the regulation, efficiency is better (higher) at the hours
% where less current is drawn. The reason is that, the losses on the line
% are proportional to the square of the current. At rush hours, efficiency
% gets worse due to higher current.

%% Part B-(e)

energy = 1e-6*sum(Pload); % MWh
fprintf('Total energy delivered to the load is %g MWh.\n', energy);

%% Q.2.
% Given parameters
I = 45; % Amps
Nturn = 50;
A = 10e-4; % m^2
m = 0.1; % kg
k = 100; % N/m
g = 9.8;
u0 = 4*pi*1e-7; % H/m

x = 0:0.0001:0.2;

%% Part a)

%%
% RELUCTANCE
%%
% $R=x/(u_0A)$

R = x/(u0*A);

%%
% INDUCTANCE
%%
% $L=N^2/R$

L = Nturn^2./R;

%% part b) 

%%
% $W=(1/2)LI^2$

W = (1/2)*L*I^2;

figure;
plot(x,W,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Stored Magnetic energy (Joules)','FontSize',12,'FontWeight','Bold')
xlim([0.01 0.2]);

%% part c)

%% part c-i)

%%
% ELECTROMAGNETIC FORCE
%%
% $W=(1/2)LI^2$
%%
% $W=(1/2)(N^2/R)I^2$
%%
% $W=(1/2)(N^2AI^2u_0)/(x)$
%%
% $Fem = dW/dx$
%%
% $Fem=(1/2)(N^2AI^2u_0)/x^2$

Fem = 0.5*Nturn^2*I^2*u0*A./x.^2;

%% part c-ii)

%%
% MECHANICAL SPRING FORCE
%%
% $Fms = kx$

Fs = k*(x-0.1);

%% part c-iii)

%%
% GRAVITATIONAL FORCE
%%
% $Fg = mg$

Fg = m*g*ones(1,numel(x));

%% part c-iv)

% NET FORCE
%%
% $Fnet = -(Fem+Fms+Fg)$

Fnet = -(Fem+Fg+Fs);

%% part c-v) 

figure;
plot(x,Fem,'b -','Linewidth',1.5);
hold on;
plot(x,Fs,'g -','Linewidth',1.5);
hold on;
plot(x,Fg,'r -','Linewidth',1.5);
hold on;
plot(x,Fnet,'k -','Linewidth',1.5);
hold off;
grid on;
xlim([0.01,0.2]);
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Force (Newtons)','FontSize',12,'FontWeight','Bold')
legend('Fem','Fs','Fg','Fnet');

%% part d)

%%
% ACCELERATION

a = Fnet/m;

figure;
plot(x,a,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Accelration (m/s^2)','FontSize',12,'FontWeight','Bold')
xlim([0.01,0.2]);

%% part e)

%% part e-i)

%%
% AGAINST TIME

Ts = 1e-3; % time step (seconds)
t = 0:Ts:0.5; % time vector
N = numel(t); % number of elements
position = zeros(1,N);
velocity = zeros(1,N);
acceleration = zeros(1,N);
position(2) = 0.15;

for k = 2:N-1
    Fem = 0.5*Nturn^2*I^2*u0*A/position(k)^2;
    Fg = m*g;
    Fs = k*(position(k)-0.1);
    Fnet1 = Fem+Fg+Fs;
    acceleration(k) = -Fnet1/m;
    velocity(k) = velocity(k-1)+acceleration(k)*Ts;
    position(k+1) = position(k)+velocity(k)*Ts;
end


%% part e-ii)

figure;

subplot(3,1,1);
plot(t,position,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')

subplot(3,1,2);
plot(t,velocity,'r -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Velocity (m/s)','FontSize',12,'FontWeight','Bold')

subplot(3,1,3);
plot(t,acceleration,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Accelration (m/s^2)','FontSize',12,'FontWeight','Bold')



%% part f)

%%
% The device has an oscillatory behaviour such that the mass moves from one
% equilibrium point to another periodically. The device operation is
% similar to an LC resonant tank which has a similar oscillatory behaviour.
% The energy is transferred from one form to the other form. In our case, 
% it is stored on the spring and then stored on the electromechanical
% device periodically. The reson for the system to continue its oscillation
% is that there is no dissipative element. For example, it we had a
% resistor in the LC tank, the initial energy would eventually decrease to
% zero. In case of friction, the same is true. As the friction is some kind
% of dissipation, the oscillation will die out in time and the mass would
% stop eventually.




