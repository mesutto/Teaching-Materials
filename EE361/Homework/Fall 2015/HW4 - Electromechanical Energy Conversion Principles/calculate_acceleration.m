function [acceleration,region] = calculate_acceleration(position,velocity)

global p;
p = 1.225;
global A;
A = 10;
global Cd;
Cd = 0.8;

% friction
global K;
K = 10;

% motor
Ka = 1;
If = 4;
Km = Ka*If;
Ra = 0.027;
Prated = 240*1e3;
Nrated = 673;
Vrated = 300;
Irated = 800;
wrated = Nrated*2*pi/60;
global Trated;
Trated = Prated/wrated;

% train
global gear_ratio;
gear_ratio = 0.72;
global wheel_radius;
wheel_radius = 0.4;
global mass;
mass = 70*1e3;

global vrated;
vrated = 140/3.6;
global g;
g = 9.8;


F1 = 2*gear_ratio*Trated/(wheel_radius);
F2 = (1/2)*Cd*A*p*vrated^2+K*vrated; % drag
Foppose = (1/2)*Cd*A*p*velocity^2+K*velocity;
Fup = mass*g*sin(atan(0.01)); % going up
Fdown = mass*g*sin(atan(0.01)); % going up


% between adana and the start of the hill
if (position >= 0 && position < 45000)
    if velocity <= 140/3.6)
        Ftrain = F1;
    else
        Ftrain = F2;
    end
end


% between the start of the hill and end of the hill
if (position >= 45000 && position < 65000)
    Ftrain = Fup;
    Foppose = Foppose + Fup;
end

% between the end of the hill and pozantý
if (position >= 65000 && position < 88000)
    if velocity <= 140/3.6)
        Ftrain = F1;
    else
        Ftrain = F2;
    end
end


%
% if (position >= 0 && position < 7000)
%     Ftrain = F1;
% elseif (position >= 7000 && position < 45000)
%     Ftrain = F2;
% elseif (position >= 45000 && position < 55000)
%     Ftrain = Fup;
%     Foppose = Foppose + Fup;
%     %Foppose = Fup;
% elseif (position >= 55000 && position < 84500)
%     Ftrain = F2;
% elseif (position >= 84500 && position < 88000)
%     Ftrain = -F1;
% elseif (position >= 88000 && position < 95000)
%     Ftrain = F1;
% elseif (position >= 95000 && position < 102000)
%     Ftrain = F2;
% elseif (position >= 102000 && position < 112000)
%     Ftrain = -Fdown;
%     Foppose = Foppose - Fdown;
%     %Foppose = -Fdown;
% elseif (position >= 112000 && position < 128500)
%     Ftrain = F2;
% elseif (position >= 128500 && position < 132000)
%     Ftrain = -F1;
% elseif (position >= 132000 && position < 139000)
%     Ftrain = F1;
% elseif (position >= 139000 && position < 365500)
%     Ftrain = F2;
% elseif (position >= 365500 && position < 369000)
%     Ftrain = -F1;
% end

Fnet = Ftrain-Foppose;
acceleration = Fnet/mass;

end