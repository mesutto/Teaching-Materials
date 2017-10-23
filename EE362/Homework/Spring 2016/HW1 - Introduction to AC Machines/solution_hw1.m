
%% EE362 HW#1

%% NAME: _SOLUTION_
%% STUDENT NUMBER: 123456

%%
% Q.1)

% PART A
%%
% a) Pole number is 2 (see figure).
pole = 2;

%%
% b) There are a total of 30 slots in one layer.
slot_number = 30;

%%
% c) Electrical angle of one slot is: $slot-angle = 2\pi/slot-number =
% \pi/15$
slot_angle = 2*pi/slot_number;

%%
% d) Phase belt angle is the electrical angle for one pole of one phase
% $Phase-belt = 2\pi/2pole/3phase = pi/3$
phase = 3;
phase_belt = 2*pi/(pole*phase);

%%
% e) Number of slots per phase per pole is: $q=slot-number/pole/phase=5$
q = slot_number/(phase*pole);

%%
% f) Coil span is the angle spanning one coil:
% $\lambda$ = $12\pi/15 = 4\pi/5$
coil_span = pi*4/5;

%%
% g) Total number of series turns per phase:
% $N_{ph} = turn-in-one-coil x layer x slot-number$
%%
% $N_{ph} = 8 x 2 x 5 = 80$
conductor = 8;
layer = 2;
Nph = q*conductor*layer*(pole/2);

%%
% h) Distribution factor: $k_d = 0.9567$
kd = sin(q*slot_angle/2)/(q*sin(slot_angle/2));

%%
% i) Pitch factor: $k_c = 0.9511$
kc = sin(coil_span/2);

%%
% j) Winding factor: $k_w = 0.91$
kw = kd*kc;

%%
% k) Mechanical speed of the air gap MMF: Nr = 3000 rpm
frequency = 50;
Nr = 120*frequency/pole;


%%
% PART B

%%
% Parts a, b, c, d)

peak_current = 2; % Amps

parts = 4;

% Define MMF components
mmfa = zeros(parts,slot_number);
mmfb = zeros(parts,slot_number);
mmfc = zeros(parts,slot_number);
mmftotal = zeros(parts,slot_number);

% Time array is the time instants at which MMF will be calculated
time_array = [0,6.67e-3,10e-3,13.33e-3];

for l = 1:parts
    
    % Define the time according the index l
    time = time_array(l);
    
    % Calculate the phase currents at that time instant
    Ia = peak_current*cos(2*pi*frequency*time);
    Ib = peak_current*cos(2*pi*50*time-2*pi/3);
    Ic = peak_current*cos(2*pi*50*time-4*pi/3);
    
    MMFa_layer1 = conductor*[Ia,Ia,Ia,Ia,Ia,0,0,0,0,0,0,0,0,0,0,-Ia,-Ia,...
        -Ia,-Ia,-Ia,0,0,0,0,0,0,0,0,0,0];
    MMFa_layer2 = conductor*[Ia,Ia,0,0,0,0,0,0,0,0,0,0,-Ia,-Ia,-Ia,-Ia,...
        -Ia,0,0,0,0,0,0,0,0,0,0,Ia,Ia,Ia];
    
    MMFb_layer1 = conductor*[0,0,0,0,0,0,0,0,0,0,Ib,Ib,Ib,Ib,Ib,0,0,0,0,0,...
        0,0,0,0,0,-Ib,-Ib,-Ib,-Ib,-Ib];
    MMFb_layer2 = conductor*[0,0,0,0,0,0,0,Ib,Ib,Ib,Ib,Ib,0,0,0,0,0,0,0,0,...
        0,0,-Ib,-Ib,-Ib,-Ib,-Ib,0,0,0];
    
    MMFc_layer1 = conductor*[0,0,0,0,0,-Ic,-Ic,-Ic,-Ic,-Ic,0,0,0,0,0,0,0,...
        0,0,0,Ic,Ic,Ic,Ic,Ic,0,0,0,0,0];
    MMFc_layer2 = conductor*[0,0,-Ic,-Ic,-Ic,-Ic,-Ic,0,0,0,0,0,0,0,0,0,0,...
        Ic,Ic,Ic,Ic,Ic,0,0,0,0,0,0,0,0];
    
    for k = 1:slot_number
        mmfa(l,k) = sum(MMFa_layer1(1:k))+sum(MMFa_layer2(1:k));
        mmfb(l,k) = sum(MMFb_layer1(1:k))+sum(MMFb_layer2(1:k));
        mmfc(l,k) = sum(MMFc_layer1(1:k))+sum(MMFc_layer2(1:k));
    end
    
    % To get rid of the offset on the MMF waveforms, use the following
    % routine for each phase MMF
    average = sum(mmfa(l,:))/slot_number;
    mmfa(l,:) = mmfa(l,:)-average;
    average = sum(mmfb(l,:))/slot_number;
    mmfb(l,:) = mmfb(l,:)-average;
    average = sum(mmfc(l,:))/slot_number;
    mmfc(l,:) = mmfc(l,:)-average;
    
    mmftotal(l,:) = mmfa(l,:)+mmfb(l,:)+mmfc(l,:);
    
end


%%
% Part e)

subplot(4,1,1)
stairs(mmfa(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')

subplot(4,1,2)
stairs(mmfa(2,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 6.67 msec','FontSize',10,'FontWeight','Bold')

subplot(4,1,3)
stairs(mmfa(3,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 10 msec','FontSize',10,'FontWeight','Bold')

subplot(4,1,4)
stairs(mmfa(4,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 13.33 msec','FontSize',10,'FontWeight','Bold')


%%
% Since the MMF is due to phase-A (1 phase), it is pulsating over time. We
% can observe that the maximum peak-to-peak is obtained at "t=0" which is
% the instant where phase-A current is maximum. We can also observe that
% at "t = 10msec" which is the half period for a 50 Hz voltage, the
% waveform is completely reversed.


%%
% Parf f)

subplot(3,1,1)
stairs(mmfa(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')


subplot(3,1,2)
stairs(mmfb(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase B MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')


subplot(3,1,3)
stairs(mmfc(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase C MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


%%
% At "t=0", phase A current is maximum which can also be observed on the
% MMF waveforms of each phase. Phase-B and Phase-C MMF's are at their
% negative half-cycles with half of the peak-to-peak value compared to
% Phase-A MMF.

%%
% Parf g)

subplot(3,1,1)
stairs(mmfa(2,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 6.67 msec','FontSize',10,'FontWeight','Bold')

subplot(3,1,2)
stairs(mmfb(2,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase B MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 6.67 msec','FontSize',10,'FontWeight','Bold')

subplot(3,1,3)
stairs(mmfc(2,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase C MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 6.67 msec','FontSize',10,'FontWeight','Bold')
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


%%
% At "t=6.67msec", phase B current is maximum and its MMF waveform has its
% maximum peak-to-peak value. Phase-A and Phase-C MMF's are at their
% negative half-cycles this time, with half of the peak-to-peak value
% compared to Phase-B MMF.


%%
% Parf h)


subplot(3,1,1)
stairs(mmfa(4,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 13.33 msec','FontSize',10,'FontWeight','Bold')

subplot(3,1,2)
stairs(mmfb(4,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase B MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 13.33 msec','FontSize',10,'FontWeight','Bold')

subplot(3,1,3)
stairs(mmfc(4,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase C MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 13.33 msec','FontSize',10,'FontWeight','Bold')
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


%%
% The situation is very similar to the previous cases, only Phase-C MMF is
% at its maximum at "t=13.33 msec" as expected.


%%
% Parf i)

subplot(4,1,1)
stairs(mmfa(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')

subplot(4,1,2)
stairs(mmfb(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase B MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')

subplot(4,1,3)
stairs(mmfc(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('Phase C MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')

subplot(4,1,4)
stairs(mmftotal(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold')
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');



%%
% Here, it is observed that at each instant (say "t=0"), sum of the three
% MMF waveforms of individual phases (the resultant or the total MMF) is
% a near-sinusoidal waveform with a better shape and peak-value 3/2 times
% the peak value of phase-A. 


%%
% Parf j)


subplot(4,1,1)
stairs(mmftotal(1,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 0','FontSize',10,'FontWeight','Bold');

subplot(4,1,2)
stairs(mmftotal(2,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 6.67 msec','FontSize',10,'FontWeight','Bold');

subplot(4,1,3)
stairs(mmftotal(3,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 10 msec','FontSize',10,'FontWeight','Bold');

subplot(4,1,4)
stairs(mmftotal(4,:),'b- ','Linewidth',1.5)
grid on;
set(gca,'FontSize',12);
ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[0:2:30]);
title('t = 13.33 msec','FontSize',10,'FontWeight','Bold');
xlabel('Slot Number','FontSize',8,'FontWeight','Bold');



%%
% It can be observed that the resultant MMF is a rotating MMF (its phase
% is shifted at each time instant). The peak value does not change, which
% is 3/2 times the maximum peak value of the pulsating MMF waveforms. The
% frequency of the total MMF can also be observed as 50 Hz as the
% difference between positive half cycle and negative half cycle is 10
% msec. This was also expected since the machine has 2 poles.


%%
% Parf k)
%%
% Phase sequence should be A-C-B

%%
% Q.2)

%%
% All parts)

% Define parameters
length = 0.5;
radius = 0.3;

flux_density = [1,0.3,0.18,0.11,0.09];

% Define harmonic order variable
harmonic = 1:2:9;

% Define variables
kd = zeros(1,numel(harmonic));
kc = zeros(1,numel(harmonic));
kw = zeros(1,numel(harmonic));
flux = zeros(1,numel(harmonic));
induced_voltage = zeros(1,numel(harmonic));

for k = 1:numel(harmonic)
    flux(k) = 4*flux_density(k)*radius*length/(pole*harmonic(k));
    frequency = 50;
    slot_angle_rad = slot_angle;
    kd(k) = sin(harmonic(k)*q*slot_angle_rad/2)/...
        (q*sin(harmonic(k)*slot_angle_rad/2));
    kc(k) = sin(harmonic(k)*coil_span/2);
    kw(k) = kc(k)*kd(k);
    induced_voltage(k) = 4.44*Nph*flux(k)*frequency*harmonic(k)*kw(k);
end


%%
% Pard a)


figure;
bar(harmonic,flux,'k','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Flux Per Pole (Weber)','FontSize',10,'FontWeight','Bold');
set(gca,'xtick',[1:2:9]);
xlabel('Harmonic Order','FontSize',10,'FontWeight','Bold');


%%
% Pard b)

figure;
subplot(3,1,1);
bar(harmonic,kd,'k','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Distribution Factor','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[1:2:9]);
set(gca,'ytick',[-1:0.2:1]);

subplot(3,1,2);
bar(harmonic,kc,'k','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Chording (Pitch) Factor','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[1:2:9]);
set(gca,'ytick',[-1:0.2:1]);

subplot(3,1,3);
bar(harmonic,kw,'k','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Winding Factor','FontSize',8,'FontWeight','Bold');
set(gca,'xtick',[1:2:9]);
xlabel('Harmonic Order','FontSize',8,'FontWeight','Bold');
set(gca,'ytick',[-1:0.2:1]);


%%
% The distribution factor decreases as the harmonic order increase, which
% is desired to reduce the harmonic components on the induced voltages. On
% the other hand, due to the utilization of distributed windings, the
% distribution factor for the fundamental also decreases which will result
% in a reduction on the fundamental voltages.
%%
% The pitch (or chording) factor is zero for the 5th harmonic as expected.
% It is below 1 for the fundamental component which will also contribute to
% the reduction on the fundamental voltages.
%%
% From the winding factor plot, it can be observed that, the 5th harmonic
% can completely be eliminated. Although chording factor is high for 7th
% and 9th harmonics, they are reduced by their distribution factor
% significantly. The 3rd harmonic winding factor still seems to be an
% issue. The fundamental component reduction on the fundamental voltages is
% at acceptable levels.
%% 
% The negative winding factor components are expected to result in out of
% phase waveforms for those particular harmonics.


%%
% Pard c)

figure;
bar(harmonic,abs(induced_voltage),'k','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Induced Voltage RMS (Volts)','FontSize',10,'FontWeight','Bold');
set(gca,'xtick',[1:2:9]);
xlabel('Harmonic Order','FontSize',10,'FontWeight','Bold');


%%
% On the line-to-neutral voltages, 5th, 7th and 9th harmonic components are
% reduced significantly, on the other hand, 3rd harmonic component (around
% 13 % of the fundamental component) is still an issue to be dealt with.


%%
% Part d)

% Define angle array
theta = 0:pi/180:2*pi;

% Define flux for each harmonic
flux_harmonic = zeros(numel(harmonic),numel(theta));
flux_actual = zeros(1,numel(theta));

for m = 1:numel(harmonic)
    flux_function(m,:) = flux(m)*sin(harmonic(m)*theta);
end

flux_actual(1,:) = sum(flux_function(:,:));

figure;
plot(theta*180/pi,flux_actual,'b- ','Linewidth',1.5);
hold on;
plot(theta*180/pi,flux_function(1,:),'r- ','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
ylabel('Overall Flux Per Pole (Weber)','FontSize',10,'FontWeight','Bold');
xlabel('Electrical Angle (Degrees)','FontSize',10,'FontWeight','Bold');


%%
% Part e, f)

% Define time array
t = 0:1e-5:20e-3;

voltage_harmonic_a = zeros(numel(harmonic),numel(t));
voltage_harmonic_b = zeros(numel(harmonic),numel(t));
voltage_actual_a = zeros(1,numel(t));
voltage_actual_b = zeros(1,numel(t));

for m = 1:numel(harmonic)
    voltage_function_a(m,:) = induced_voltage(m)*sqrt(2)*...
        sin(2*pi*harmonic(m)*50*t);
    voltage_function_b(m,:) = induced_voltage(m)*sqrt(2)*...
        sin(harmonic(m)*(2*pi*50*t-2*pi/3));
end

voltage_actual_a(1,:) = sum(voltage_function_a(:,:));
voltage_actual_b(1,:) = sum(voltage_function_b(:,:));

linetoline = voltage_actual_a-voltage_actual_b;


figure;
plot(t,voltage_actual_a(1,:),'b- ','Linewidth',1.5);
hold on;
plot(t,voltage_function_a(1,:),'r- ','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
ylabel('Line to Neutral Voltage(Volts)','FontSize',10,'FontWeight','Bold');
xlabel('Time (Seconds)','FontSize',10,'FontWeight','Bold');

figure;
plot(t,linetoline(1,:),'k- ','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylabel('Line to Line Voltage (Volts)','FontSize',10,'FontWeight','Bold');
xlabel('Time (Seconds)','FontSize',10,'FontWeight','Bold');


%%
% Part g)

%%
% The actual line-to-neutral waveform seems highly distorted due to mostly
% 3rd harmonic and some 9th harmonic. One adverse effect of the harmonic
% content is the increase of the peak value as the peak difference between
% the actual and fundamental is around 1 kV.
%%
% It can be observed from the line-to-line voltage waveform that, the
% triplen harmonics (3rd and 9th) are eliminated and the resultant
% waveform is lowly distorted. This is one of the advantages of using Y
% connected machines.
%%
% All in all, the four harmonic components on the air gap flux density have
% been eliminated by different methods.


%%
% Q.3)

%%
% Part a)


%%
% Since the rotor rotation dirction and the MMF waveform direction produced
% by the stator windings are the same, the induced voltage frequency can be
% calculated by the relative speed (their difference) as following:

%%
% $f$ = $f_{stator}-f_{rotor}$

%%
% $f$ = $50 - Nr*p/120$

%%
% Nr = 1400, p = 4

%%
% $f$ = $50 - 1400*4/120$

%%
% f = 3.33 Hz


%%
% Part b)

%%
% Using the same procedure in (a):

%%
% f = 13.33 Hz


%%
% Part c)

%%
% When the rotor direction is reversed, the relative speed will be the sum 
% of two frequencies which can be calcuulated as follows:

%%
% $f$ = $f_{stator}+f_{rotor}$

%%
% $f$ = $50 + Nr*p/120$

%%
% Nr = 1400, p = 4

%%
% $f$ = $50 + 1400*4/120$

%%
% f = 96.67 Hz


%%
% Part d)

%%
% Using the same procedure in (c):

%%
% f = 86.67 Hz

