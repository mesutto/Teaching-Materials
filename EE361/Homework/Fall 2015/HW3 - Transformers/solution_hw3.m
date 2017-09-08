
%% EE361 HW#3

%% NAME: _SOLUTION_
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

Irated = 30e3/220;
Imax = Irated*1.1;
iload = linspace(0,Imax,100);
V2 = 220;
Sload = iload*V2;
V1rated = 2200;

%%
% At unity pf

pf = 1;
Pload1 = Sload*pf;
V2 = 220;

%%
% $E_2=V_2+I_L(R_2+jX_2)$
%%
% $E_1 = nE_2$
%%
% $Z_m = 1/((1/R_c)-j(1/X_m))$
%%
% $I_m = E_1/Z_m$
%%
% $I_m = E_1/Z_m$
%%
% $I_1 = I_m+I_L/n$
%%
% $V_1 = I_1(R_1+jX_1)+E_1$
%%
% $reg = 100|V_{1mag}-V_{1rated}|/V_{1rated}$
%%
% $loss = I_{1mag}^2 R_1 + I_{Lmag}^2 R_2 + E_{1mag}^2/R_c$
%%
% $eff = 100 P_{load}/(P_{load} + P_{loss})$


E2 = V2+iload*(R2+j*X2);
E1 = E2*n;
Zm = 1/((1/Rc)-j*(1/Xm));
Im = E1/Zm;
I1 = Im+iload/n;
V1 = I1*(R1+j*X1)+E1;
V1m1 = abs(V1);
I1m1 = abs(I1);

reg1 = 100*abs(V1m1-V1rated)/V1rated;
loss1 = abs(I1).^2*R1+abs(iload).^2*R2+abs(E1).^2/Rc;
eff1 = 100*(Pload1)./(Pload1+loss1);


%%
% pf = 0.8 lagging

pf = 0.8;
Pload2 = Sload*pf;
i2 = iload*0.8-j*iload*0.6;
V2 = 220;
E2 = V2+i2*(R2+j*X2);
E1 = E2*n;
Zm = 1/((1/Rc)-j*(1/Xm));
Im = E1/Zm;
I1 = Im+i2/n;
V1 = I1*(R1+j*X1)+E1;
V1m2 = abs(V1);
I1m2 = abs(I1);

reg2 = 100*abs(V1m2-V1rated)/V1rated;
loss2 = abs(I1).^2*R1+abs(iload).^2*R2+abs(E1).^2/Rc;
eff2 = 100*(Pload2)./(Pload2+loss2);

%%
% pf = 0.8 lagging

pf = 0.8;
Pload3 = Sload*pf;
i2 = iload*0.8+j*iload*0.6;
V2 = 220;
E2 = V2+i2*(R2+j*X2);
E1 = E2*n;
Zm = 1/((1/Rc)-j*(1/Xm));
Im = E1/Zm;
I1 = Im+i2/n;
V1 = I1*(R1+j*X1)+E1;
V1m3 = abs(V1);
I1m3 = abs(I1);

reg3 = 100*abs(V1m3-V1rated)/V1rated;
loss3 = abs(I1).^2*R1+abs(iload).^2*R2+abs(E1).^2/Rc;
eff3 = 100*(Pload3)./(Pload3+loss3);


%% PART (a)
% source voltages

figure;
plot(iload,V1m1,'bx-','Linewidth',1.5);
hold on;
plot(iload,V1m2,'rx-','Linewidth',1.5);
hold on;
plot(iload,V1m3,'kx-','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlim([0 150]);
ylim([2000 2500]);
xlabel('Load Current (Amps)','FontSize',12,'FontWeight','Bold')
ylabel('Source Voltage (Voltss)','FontSize',12,'FontWeight','Bold')
set(gca,'xtick',[0:15:150]);
set(gca,'ytick',[2000:50:2500]);
legend('pf = 1','pf = 0.8 lagging','pf = 0.8 leading');


%% PART (b)
% voltage regulations

figure;
plot(iload,reg1,'bx-','Linewidth',1.5);
hold on;
plot(iload,reg2,'rx-','Linewidth',1.5);
hold on;
plot(iload,reg3,'kx-','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlim([0 150]);
%ylim([0 1]);
xlabel('Load Current (Amps)','FontSize',12,'FontWeight','Bold')
ylabel('Rgeulation (Percents)','FontSize',12,'FontWeight','Bold')
set(gca,'xtick',[0:15:150]);
%set(gca,'ytick',[0:1:5]);
legend('pf = 1','pf = 0.8 lagging','pf = 0.8 leading');


%% PART (c)
% efficiency

figure;
plot(iload,eff1,'bx-','Linewidth',1.5);
hold on;
plot(iload,eff2,'rx-','Linewidth',1.5);
hold on;
plot(iload,eff3,'kx-','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlim([0 150]);
ylim([95 100]);
xlabel('Load Current (Amps)','FontSize',12,'FontWeight','Bold')
ylabel('sEfficiency (Percents)','FontSize',12,'FontWeight','Bold')
set(gca,'xtick',[0:15:150]);
%set(gca,'ytick',[0:1:5]);
legend('pf = 1','pf = 0.8 lagging','pf = 0.8 leading');


%% PART (d)
%%
% Since transformer is an inductive element, regulation is worst at
% inductive load. With capacitive load, power factor at the source terminal
% is corrected so that regulation is best. Note that, the load impedance at
% capacitive load is adjusted for almost perfect regulation in our case.
% At same load current, the loss on copper elements will be nearly same. On
% the other hand, unity power factor means more real power delivery to
% the load at the same current magnitude. Therefore, best efficiency is
% obtained with unity pf.


%% PART (e)
% As loading increase, regulation increases (gets worsen) for all power
% factor conditions since the voltage drop on the series elements of the
% transformer gets higher.
% As loading increase, efficiency increases up to a point since low output
% power yields losses comparable to the delivered power. After a point,
% efficiency decreases with loading. This is because that the increasing
% current will yield mote power loss on the series resistive elements. Note
% that, the maximum efficiency point corresponds to the maximum power
% transfer point (where line impedance is equal to load impedance).



%% Q.2.
%% PART A

%% PART a

%%
% $v_{an} = V_{peak} sin(2 \pi ft)$
%%
% $v_{bn} = V_{peak} sin(2 \pi ft-2 \pi /3)$
%%
% $v_{cn} = V_{peak} sin(2 \pi ft+2 \pi /3)$


Vpeak = sqrt(2)*34500/sqrt(3);
Fs = 1e5;
fs = 50;
t = 0:1/Fs:0.04;
van = Vpeak*sin(2*pi*fs*t);
vbn = Vpeak*sin(2*pi*fs*t-2*pi/3);
vcn = Vpeak*sin(2*pi*fs*t+2*pi/3);

%Insert your code here
figure;
plot(t,van,'b -','Linewidth',1.5);
hold on;
plot(t,vbn,'r -','Linewidth',1.5);
hold on;
plot(t,vcn,'k -','Linewidth',1.5);
hold on;
grid on;
set(gca,'FontSize',12);
xlabel('Time (sec)','FontSize',12,'FontWeight','Bold')
ylabel('Source Voltages (volts)','FontSize',12,'FontWeight','Bold')
legend('van','vbn','vcn');


%% PART b

%Define parameters
Zline1 = 12+102*j;
Zline2 = 0.6e-3+5e-3*j;
Ztrans = 27+403*j;
turns_ratio = 34500/(400/sqrt(3));

%%
% $i_{source} = i_{load} (sqrt(3)/n) e^{(-j\pi/6)}$


Iload_mag = 1050;
Iload_phase = 0;
[re1,im1] = pol2cart(Iload_phase,Iload_mag);
Iload = re1+j*im1;
Isource = (1/turns_ratio)*(cos(30*pi/180)-j*sin(30*pi/180))*Iload*sqrt(3);
Isource_mag = abs(Isource);
Isource_phaser = phase(Isource);
Isource_phase = phase(Isource)*180/pi;


%%
% $i_{a} = I_{peak} sin(2 \pi ft + \phi)$
%%
% $i_{b} = I_{peak} sin(2 \pi ft + \phi - 2 \pi /3)$
%%
% $i_{c} = I_{peak} sin(2 \pi ft + \phi + 2 \pi /3)$

Isource_peak = Isource_mag*sqrt(2);

ia = Isource_peak*sin(2*pi*fs*t+Isource_phaser);
ib = Isource_peak*sin(2*pi*fs*t+Isource_phaser-2*pi/3);
ic = Isource_peak*sin(2*pi*fs*t+Isource_phaser+2*pi/3);

%Insert your code here (plot)
figure;
plot(t,ia,'b -','Linewidth',1.5);
hold on;
plot(t,ib,'r -','Linewidth',1.5);
hold on;
plot(t,ic,'k -','Linewidth',1.5);
hold on;
grid on;
set(gca,'FontSize',12);
xlabel('Time (sec)','FontSize',12,'FontWeight','Bold')
ylabel('Source Currents (volts)','FontSize',12,'FontWeight','Bold')
legend('ia','ib','ic');


%% PART c

%%
% $Z_{total} = (Z_{line1}(sqrt(3)/n)^2) + (Z_{trans}(1/n)^2) + Z_{line2}$
%%
% $R_{total} = Re(Z_{total})$
%%
% $X_{total} = Im(Z_{total})$
%%
% $V_{load-mag} = sqrt(V_{source-mag}^2-I_{load}^2X_{line}^2)-I_{load}R_{line}$

Vsource_mag = 34500/turns_ratio;
Ztotal = (Zline1/(turns_ratio/sqrt(3))^2)+(Ztrans/(turns_ratio^2))+Zline2;
Rline = real(Ztotal);
Xline = imag(Ztotal);
Vload_mag = sqrt(Vsource_mag^2-Iload^2*Xline^2)-Iload*Rline;

disp(Vload_mag);



%% PART d

%%
% $V_{source_ref} = I_{load}Z_{total}+V_{load}$
%%
% $V_{source-ll} = V_{source-ref}n$
%%
% $V_{source-ln} = (V_{source-ll}/(sqrt(3)))e^{-j\pi/6}$


Vload = Vload_mag;
Vsource_ref = Iload*Ztotal + Vload;
Vsource_ref_phase = phase(Vsource_ref)*180/pi;

% your result will be here
disp(Vsource_ref_phase);

%Insert your code here (plot)
% actual line-to-line source voltage
Vsource = Vsource_ref*turns_ratio;
% actual line-to-neutral source voltage
Vsource_ln = Vsource/sqrt(3)*exp(-j*(pi/6));
Vsource_ln_mag = abs(Vsource_ln);
Vsource_ln_phase = phase(Vsource_ln)*180/pi;
Vsource_ln_phaser = Vsource_ln_phase*pi/180;
Vsource_peak = Vsource_ln_mag*sqrt(2);

isa = Isource_peak*sin(2*pi*fs*t+Isource_phaser);
vsan = Vsource_peak*sin(2*pi*fs*t+Vsource_ln_phaser);

figure;
plot(t,vsan,'b -','Linewidth',1.5);
hold on;
plot(t,isa*1000,'r -','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Time (sec)','FontSize',12,'FontWeight','Bold')
ylabel('Source Current (Amps) & Source Voltage (Volts)','FontSize',12,'FontWeight','Bold')
legend('vsan','isa*1000');


%% PART e

phase_dif = Vsource_ln_phase-Isource_phase;
pf = cos(phase_dif*pi/180);

disp(pf);


%% PART B

%% Part a
% Data import
data = xlsread('load_profile_METU.xlsx');
iload = data(2:25,2);
hour = data(2:25,1);

%Insert your code here
iload2 = smooth(iload); %to smooth the curve
figure;
plot(hour,iload,'bx-','Linewidth',1.5);
hold on;
plot(hour,iload2,'rx-','Linewidth',1.5);
hold off;
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Load Current (Amps)','FontSize',12,'FontWeight','Bold')


%% Part b
%load voltage vs hour

% use smoothed characteristics
clear Iload;
turns_ratio = 34500/(400/sqrt(3));
Iload = iload2';
n = numel(Iload);
Vsource_mag = ones(1,n)*34500/turns_ratio;
Zline1 = ones(1,n)*(12+102*j);
Zline2 = ones(1,n)*(0.6e-3+5e-3*j);
Ztrans = ones(1,n)*(27+403*j);
Ztotal = (Zline1/(turns_ratio/sqrt(3))^2)+(Ztrans/(turns_ratio^2))+Zline2;
Rline = real(Ztotal);
Xline = imag(Ztotal);
Vload_mag = sqrt(Vsource_mag.^2-Iload.^2.*Xline.^2)-Iload.*Rline;

%Insert your code here (plot)
figure;
plot(hour,Vload_mag,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
ylim([200 250]);
xlabel('Hour','FontSize',12,'FontWeight','Bold')
ylabel('Source Voltage Magnitude (Volts)','FontSize',12,'FontWeight','Bold')


%% Part c
%regulation vs hour

Vload_rated = ones(1,n)*230;
V_loadr = 230;
reg = 100*(Vload_rated-Vload_mag)/V_loadr;

%Insert your code here (plot)
figure;
plot(hour,reg,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold');
ylabel('Regulation (Percent)','FontSize',12,'FontWeight','Bold');


%% Part d
%efficiency vs hour

Rloss = Rline(1,1);
Ploss = 3*Iload.^2*Rloss;
% since the load is purely resistive
Pout = 3*Vload_mag.*Iload;
Pin = Pout+Ploss;
eff = 100*Pout./Pin;

figure;
plot(hour,eff,'bx-','Linewidth',1.5);
grid on;
set(gca,'FontSize',12);
xlabel('Hour','FontSize',12,'FontWeight','Bold');
ylabel('Efficiency (Percent)','FontSize',12,'FontWeight','Bold');


%publish('solution_hw3.m', 'pdf')

