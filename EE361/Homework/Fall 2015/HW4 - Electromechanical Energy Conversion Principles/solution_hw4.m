function []=solution_hw4()

%% EE361 HW#4

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 123456

%%
% PARAMETERS
%define the constant parameters
I = 15; % Amps
Nturn = 150; % turns
A = 10e-4; % m^2
lr = 1e-2; % m
m = 0.5; % kg
kspring = 20; % N/m
u0 = 4*pi*1e-7; % H/m

x = -0.1:0.0001:0.1; % meters

%%
% part a

%%
% RELUCTANCE
%%
% $R=l/(u_0A)$
%%
% $R=(0.1-x+l_r)/(u_0A)$

R = (0.1-x+lr)/(u0*A);

%%
% INDUCTANCE
%%
% $L=N^2/R$

L = Nturn^2./R;

%%
% part b

%%
% STORED MAGNETIC ENERGY
%%
% $W=(1/2)LI^2$

W = (1/2)*L*I^2;

figure;
plot(x,W,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Stored Magnetic energy (Joules)','FontSize',12,'FontWeight','Bold')


%%
% part c

%%
% part c-i

%%
% ELECTROMAGNETIC FORCE
%%
% $W=(1/2)LI^2$
%%
% $W=(1/2)(N^2/R)I^2$
%%
% $W=(1/2)(N^2AI^2u_0)/(0.1-x+l_r)$
%%
% $Fem = dW/dx$
%%
% $Fem=(1/2)(N^2AI^2u_0)/(0.1-x+l_r)^2$

Fem = (1/2)*(Nturn^2*A*I^2*u0)./(0.1-x+lr).^2;

%%
% part c-ii

%%
% MECHANICAL SPRING FORCE
%%
% $Fms = kx$

Fms = kspring*x;

%%
% the direction is to the right

%%
% part c-iii

%%
% NET FORCE
%%
% $Fnet = Fem-Fms$

Fnet = Fem-Fms;

%%
% net force is defined in the direction of displacement

%%
% part c-iv

figure;
plot(x,Fem,'b -','Linewidth',1.5);
hold on;
plot(x,Fms,'r -','Linewidth',1.5);
hold on;
plot(x,Fnet,'k -','Linewidth',1.5);
hold off;
grid on;
ylim([-5,5]);
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Force (Newtons)','FontSize',12,'FontWeight','Bold')
legend('Fem','Fms','Fnet');


%%
% part c-v

%%
% The net force is positive (in the direction of +x) in
% interval1: [-0.1 - 0.02] and interval2: [0.057 - 0.1]
% The net force is negative (in the direction of -x) in
% interval3: [0.02 - 0.057]
% In intervals 1 and 2, the electromagnetic device overcomes the the spring
% force. In interval 3, the spring force is stronger.


%%
% part d

%%
% ACCELERATION

%%
% $a = [(1/2)(N^2AI^2u_0)/(0.1-x+l_r)^2-kx]/m$

a = Fnet/m;

figure;
plot(x,a,'b -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Displacement (Meters)','FontSize',12,'FontWeight','Bold')
ylabel('Accelration (m/s^2)','FontSize',12,'FontWeight','Bold')


%%
% part e

%%
% part e-i
%%
% AGAINST TIME

Ts = 1e-3; % time step (seconds)
t = 0:Ts:5; % time vector
N = numel(t); % number of elements
position = zeros(1,N);
velocity = zeros(1,N);
ivme = zeros(1,N);

for k = 2:N-1
    acceleration = calculate_acceleration(position(k));
    velocity(k) = velocity(k-1)+acceleration*Ts;
    position(k+1) = position(k)+velocity(k)*Ts;
    ivme(k) = acceleration;
end


%%
% part e-ii

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
plot(t,ivme,'k -','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Time (Seconds)','FontSize',12,'FontWeight','Bold')
ylabel('Accelration (m/s^2)','FontSize',12,'FontWeight','Bold')


%%
% part f

%%
% As the name suggests, it has an oscillatory behaviour. Since the net
% force is in the direction of +x at initial position, the mass moves to
% the left. At some point, the force becomes negative and starts to slow
% down. When it stops, it starts to go back until its initial position. It
% cannot go further since there is no disspated energy. The oscillation
% does not end theoretically since the system is lossless.

 

%%

    function [acc] = calculate_acceleration(pos)
        
        Fm = (u0*Nturn^2*A*I^2)./(2*(0.1-pos+lr).^2);
        Fs = kspring*pos;
        Fnet1 = Fm-Fs;
        acc = Fnet1/m;
   
    end


end