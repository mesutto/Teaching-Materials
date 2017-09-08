
%% EE361 HW#4

%% NAME: _KYLO REN_
%% STUDENT NUMBER: 123456

function []=template_hw4()

%%
% change your .m file name and the function name above, to the following:
% name_surname_ID_hw4

% please add axis names, legends and titles
% in all your plots

% please be aware that there is MATLAB function at the end of the file
% which you will utilize in part (e)
% http://www.mathworks.com/help/matlab/ref/function.html

% examine the whole template before you start

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

%define displacement vector in meters
%in the interval of [-0.1,0.1]
%with at least 2000 data points

%%
% part a

%use the following sytax in all your derivations and expressions
%%
% $z=sqrt(x^2+y^2)$

%%
% RELUCTANCE
%insert your code here (expression)
%%
% $R=l/(u_0*A)$
%...

%insert your code here (calculation)

%%
% INDUCTANCE
%insert your code here (expression)

%insert your code here (calculation)


%%
% part b

%%
% STORED MAGNETIC ENERGY
%insert your code here (derivation and expression)

%insert your code here (calculation)

%insert your code here (plot)

%your graph will be here


%%
% part c

%%
% part c-i

%%
% ELECTROMAGNETIC FORCE
%insert your code here (derivation and expression)

%insert your code here (calculation)

%%
% part c-ii

%%
% MECHANICAL SPRING FORCE
%insert your code here (expression)

%insert your code here (calculation)

%%
% part c-iii

%%
% NET FORCE
%insert your code here (expression)

%insert your code here (calculation)

%%
% part c-iv

%insert your code here (plot)

%your graph will be here

%%
% part c-v

%intervals of displacement at which the net force is in the direction of +x

%intervals of displacement at which the net force is in the direction of -x

%%
% COMMENT

%Insert
%your
%comment
%here
%and
%there
%...

%%
% part d

%%
% ACCELERATION
%insert your code here (derivation and expression)

%insert your code here (calculation)

%insert your code here (plot)

%your graph will be here


%%
% part e

%%
% part e-i
%%
% AGAINST TIME

% insert your code here
%define time vector in seconds
%in the interval of [0,5]
%time step should be 1 msec

% HINTS
%implement a subroutine as a MATLAB function
%which calculates the acceleration of the mass at a given position
%inside the "function" which is given at the end of this file

%implement another subroutine here, which calculates the new position
%of the mass using the acceleration, velocity and previous position data
%at that moment

%the function you have defined will be called by your subroutine
%at each time step

%one way to do this is using "for" loops

%displacement, velocity and acceleration should be treated as vectors (array)


% insert your code here (iterative calculation)


%%
% part e-ii

% insert your code here (plot)

% figure;
% subplot(3,1,1);
% plot(t,displacement...
% grid on;
% set(gca,'FontSize',12);
%
% subplot(3,1,2);
% plot(t,velocity...
% grid on;
% set(gca,'FontSize',12);
%
% subplot(3,1,3);
% plot(t,acceleration...
% grid on;
% set(gca,'FontSize',12);

% your graph will be here


%%
% part f

%%
% COMMENT

%Insert
%your
%comment
%here
%and
%there
%...


%%
% part g

%%
% COMMENT

%Insert
%your
%comment
%here
%and
%there
%...


%%
% The following is the MATLAB function which calculates
% the acceleration (output) of the mass at a given position (input)
% you may take advantage of your derivations in previous parts

    function [output] = calculate_acceleration(input)
        
        %insert your code here (calculation)
        
    end

%% After you finished
% Run the following command from Matlab terminal (command window)
% generate a report of your .m file as pdf and
% ONLY upload the PDF file to ODTUClass.

%publish('name_surname_ID_hw4.m', 'pdf')

end