%% Using complex numbers in MATLAB

% definition
a = 3+1j*4;
b = 4+1j*5;

% addition & subtraction
add = a+b; % 7+9j
sub = a-b; % -1-j

% multiplication & division
mult = a*b; % -8+31j
divs = a/b; % 0.78+0.024j

% magnitude & phase
magn = abs(a);
phs1 = phase(a); %radians
phs2 = phs1*180/pi; %degrees

% power
P = 400e3; % active power: 400 kW
Q = 300e3; % reactive power: 300 kVAR
S = P+1j*Q; % complex power
app = abs(S); % apparent power: 500 kVA
pf1 = cos(phase(S)); % power fator: 0.8
pf2 = P/app; % power fator-same result

% time domain expressions
Vp = 15; % peak value
phi = 30; % phase (degrees)
phir = phi*pi/180; % phase (radians)
Fs = 10e3; % sampling frequency: 10 kHz
fs = 50; % fundamental frequency: 100 Hz
t = 0:1/Fs:0.1; % time array
volt1 = Vp*sin(2*pi*fs*t); % reference phasor (no phase)
volt2 = Vp*sin(2*pi*fs*t - phir); % lagging
volt3 = Vp*sin(2*pi*fs*t + phir); % leading

% Note that the trigonometric functions operate with radians, not degrees
