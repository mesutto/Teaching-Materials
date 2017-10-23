
%% EE362 HW#1

%% NAME: _JOSEPH HENRY_
%% STUDENT NUMBER: 123456


%%
% Change your .m file name to the following:
% name_surname_ID_hw1.m

% Please add axis names, legends, titles etc. in all your plots

% Use the already defined variable names whenever possible

% Examine the whole template before you start

% Delete the hints, guidelines etc. given in this template when you prepare
% your solution

% Note that, MATLAB trigonometric functions use radians, not degrees
% Indexes in MATLAB start at 1, not 0


%%
% Q.1)

%%
% PART A

% In this part, do not directly give answer, obtain the results using
% formulas (if applicable). For example: kw = kd*kc.
% The results of this part will be utilized in the rest of the homework.


%%
% a)

% Explain
% Define variable
% pole = ?;

%%
% b) 

% Explain
% Define variable
% slot_number = ?;

%%
% c) 

% Explain
% Define variable
% slot_angle = ?;

%%
% d) 

% Explain
% Define variable
% phase = ?;
% phase_belt = ?;

%%
% e) 

% Explain
% Define variable
% q = ?;

%%
% f) 

% Explain
% Define variable
% coil_span = ?;

%%
% g) 

% Explain
% Define variable
% conductor = ?;
% layer = ?
% Nph = ?;

%%
% h) 

% Explain
% Define variable
% kd = ?;

%%
% i) 

% Explain
% Define variable
% kc = ?;

%%
% j)

% Explain
% Define variable
% kw = ?;

%%
% k) 

% Explain
% Define variable
% frequency = ?;
% Nr = ?;


%%
% PART B

%%
% Parts a, b, c, d)

% peak_current = ?;

% "parts" is the number defining that at how many different times the mmf
% will be computed 
parts = 4;

% Define MMF components
mmfa = zeros(parts,slot_number);
mmfb = zeros(parts,slot_number);
mmfc = zeros(parts,slot_number);
mmftotal = zeros(parts,slot_number);


% The following routine will generate the MMF components
% Each row of the MMF matrices will correspond to a different time instant
% Each column of the MMF matrices will correspond to a different slot

% Time array is the time instants at which MMF will be calculated
time_array = [0,6.67e-3,10e-3,13.33e-3];

for l = 1:parts
    
    % Define the time according the index l
    time = time_array(l);
    
    % Calculate the phase currents at that time instant
    Ia = peak_current*cos(2*pi*frequency*time);
    % Ib = ?;
    % Ic = ?;
    
    % By using the winding diagram given in Figure 1, define the
    % contribution of each slot to the MMF, for each layer and for each
    % phase
    
    % Be aware that, each coil side has 8 series turns! 
    
    MMFa_layer1 = conductor*[Ia,Ia,Ia,Ia,Ia,0,0,0,0,0,0,0,0,0,0,-Ia,-Ia,...
        -Ia,-Ia,-Ia,0,0,0,0,0,0,0,0,0,0];
    % MMFa_layer2 = ?;
    
    % MMFb_layer1 = ?;
    % MMFb_layer2 = ?;
    
    % MMFc_layer1 = ?;
    % MMFc_layer2 = ?;
    
    
    % The following routine will generate the MMF waveforms using the MMF
    % contribution of each slot
    % You may use "sum" function
    
    for k = 1:slot_number
        % mmfa(l,k) = ?;
        % mmfb(l,k) = ?;
        % mmfc(l,k) = =?
    end
    
    % To get rid of the offset on the MMF waveforms, use the following
    % routine for each phase MMF
    average = sum(mmfa(l,:))/slot_number;
    mmfa(l,:) = mmfa(l,:)-average;
    % mmfb(l,:) = ?;
    % mmfc(l,:) = ?;
    
    % Compute the overall MMF
    % mmftotal = ?;
    
end


%%
% Part e)

% Use "stairs" for MMF waveform plots


% UNCOMMENT THE FOLLOWING
% subplot(4,1,1)
% stairs(mmfa(1,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 0','FontSize',10,'FontWeight','Bold')


subplot(4,1,2)
% Insert your code here

subplot(4,1,3)
% Insert your code here

subplot(4,1,4)
% Insert your code here

% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


% Your graph will be here


%%
%Insert
%your
%comment
%here
%and
%there
%...



%%
% Parf f)

% UNCOMMENT THE FOLLOWING
% subplot(3,1,1)
% stairs(mmfa(1,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 0','FontSize',10,'FontWeight','Bold')


subplot(3,1,2)
% Insert your code here


subplot(3,1,3)
% Insert your code here


% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


% Your graph will be here



%%
%Insert
%your
%comment
%here
%and
%there
%...


%%
% Parf g)

% UNCOMMENT THE FOLLOWING
% subplot(3,1,1)
% stairs(mmfa(2,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 6.67 msec','FontSize',10,'FontWeight','Bold')


subplot(3,1,2)
% Insert your code here


subplot(3,1,3)
% Insert your code here


% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


% Your graph will be here


%%
%Insert
%your
%comment
%here
%and
%there
%...


%%
% Parf h)


% UNCOMMENT THE FOLLOWING
% subplot(3,1,1)
% stairs(mmfa(4,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 13.33 msec','FontSize',10,'FontWeight','Bold')


subplot(3,1,2)
% Insert your code here


subplot(3,1,3)
% Insert your code here


% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');



% Your graph will be here


%%
%Insert
%your
%comment
%here
%and
%there
%...


%%
% Parf i)

% UNCOMMENT THE FOLLOWING
% subplot(4,1,1)
% stairs(mmfa(1,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('Phase A MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 0','FontSize',10,'FontWeight','Bold')


subplot(4,1,2)
% Insert your code here


subplot(4,1,3)
% Insert your code here


subplot(4,1,4)
% Insert your code here


% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


% Your graph will be here


%%
%Insert
%your
%comment
%here
%and
%there
%...



%%
% Parf j)


% UNCOMMENT THE FOLLOWING
% subplot(4,1,1)
% stairs(mmftotal(1,:),'b- ','Linewidth',1.5)
% grid on;
% set(gca,'FontSize',12);
% ylabel('TOTAL MMF','FontSize',8,'FontWeight','Bold');
% set(gca,'xtick',[0:2:30]);
% title('t = 0','FontSize',10,'FontWeight','Bold');


subplot(4,1,2)
% Insert your code here


subplot(4,1,3)
% Insert your code here


subplot(4,1,4)
% Insert your code here


% UNCOMMENT THE FOLLOWING
% xlabel('Slot Number','FontSize',8,'FontWeight','Bold');


% Your graph will be here



%%
%Insert
%your
%comment
%here
%and
%there
%...



%%
% Parf k)

% Phase sequence should be ???


%%
% Q.2)

%%
% All parts)

% Define parameters
% length = ?;
% radius = ?;

% Magnitudes of each flux density component in array format
% Given in Q2
% flux_density = [???];

% Define harmonic order variable
harmonic = 1:2:9;

% Define variables
kd = zeros(1,numel(harmonic));
kc = zeros(1,numel(harmonic));
kw = zeros(1,numel(harmonic));
flux = zeros(1,numel(harmonic));
induced_voltage = zeros(1,numel(harmonic));


% The following routine will be used to calculate kd, kc, kw, flux per pole
% and induced voltage at each harmonic order
% Variables defined in Q1 will be used (For example: q, coil_span etc)
for k = 1:numel(harmonic)
    % flux(k) = ?;
    % kd(k) = ?;
    % kc(k) = ?;
    % kw(k) = ?;
    % induced_voltage(k) = ?;
end


%%
% Pard a)


% Use "bar" for plots against harmonic order


%figure;
% bar(harmonic,flux,'k','Linewidth',1.5);
% grid on;
% set(gca,'FontSize',12);
% set(gca,'xtick',[1:2:9]);
% ylabel('Flux Per...
% xlabel('Harmonic...


% Your graph will be here


%%
% Pard b)

% Insert your code here

% figure;
% subplot(3,1,1);
% bar(harmonic...


% Insert your code here
subplot(3,1,2);


% Insert your code here
subplot(3,1,3);


% UNCOMMENT THE FOLLOWING
% xlabel('Harmonic Order','FontSize',8,'FontWeight','Bold');



% Your graph will be here



%%
%Insert
%your
%comment
%here
%and
%there
%...



%%
% Pard c)


% Insert your code here

% figure;
% bar(harmonic,abs(induced_voltage...
    

% Your graph will be here


%%
%Insert
%your
%comment
%here
%and
%there
%...



%%
% Part d)

% Define angle array
theta = 0:pi/180:2*pi;

% Define flux for each harmonic
flux_harmonic = zeros(numel(harmonic),numel(theta));
flux_actual = zeros(1,numel(theta));


% The following routine will be used to compute the flux against position
% for each harmonic component
for m = 1:numel(harmonic)
    %flux_harmonic(m,:) = ?;
end

% By adding all the harmonic components, obtain the overall flux waveform

% flux_actual(1,:) = ?;


% Insert your code here (plot)



% Your graph will be here


%%
% Part e, f)

% Define time array
t = 0:1e-5:20e-3;


% Define voltage for each harmonic
% Since line-to-line voltage is also asked, compute both phase-a and
% phase-b voltages 
voltage_harmonic_a = zeros(numel(harmonic),numel(t));
voltage_harmonic_b = zeros(numel(harmonic),numel(t));
voltage_actual_a = zeros(1,numel(t));
voltage_actual_b = zeros(1,numel(t));


% The following routine will be used to compute the voltage against time
% for each harmonic component
for m = 1:numel(harmonic)
    % voltage_harmonic_a(m,:) = ?;
    % voltage_harmonic_b(m,:) = ?;
end


% By adding all the harmonic components, obtain the overall
% voltage waveform

% voltage_actual_a(1,:) = ?;
% voltage_actual_b(1,:) = ?;


% Compute the line-to-line voltage

% linetoline_voltage = ?;



% Insert your code here (plot) => phase-a fundamental and actual


% Your graph will be here



% Insert your code here (plot) => line-to-line voltage


% Your graph will be here



%%
% Part g)

%Insert
%your
%comment
%here
%and
%there
%...



%%
% Q.3)

%%
% Part a)

% Explain (for a and b)


% Show analytical formulation (for a and b)


% Insert your code here (calculation)

% Display result



%%
% Part b)


% Insert your code here (calculation)

% Display result



%%
% Part c)

% Explain (for c and d)


% Show analytical formulation (for c and d)


% Insert your code here (calculation)

% Display result



%%
% Part d)


% Insert your code here (calculation)

% Display result



%% After you finished
% Run the following command from Matlab terminal (command window)
% Generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

% publish('name_surname_ID_hw1.m','pdf')

