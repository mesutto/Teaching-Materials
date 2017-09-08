%% THIS DOCUMENT IS NOT RELATED TO THE QUESTIONS IN HW#3...
%% IT IS JUST TO SHOW YOU HOW YOUR SOLUTION WILL LOOK LIKE

%% EE361 HW#X

%% NAME: _NICOLA TESLA_
%% STUDENT NUMBER: _9876543_

%% Q.1.
%% PART (a)
% The parameters that are used:
a = 1;
b = 2;
c = 3;
d = 4;

% Insert your code here
%%
% we must first find e
%%
% $e = (a+b)/(c+d)$
%%
% we must then find f
%%
% $f = (a-b)/(c-d)$
%%
% the result will be the product of them
% by David's rule
%%
% $result = e*f$
%%
% Also note that, this result is obtained
% by assuming the characteristics as linear

e = (a+b)/(c+d);
f = (a-b)/(c-d);
result = e*f;

% your result will be here
result


%% PART (b)

%Insert your code here (calculations)
x = 0:0.1:2;
y1 = x;
y2 = x.^2;
y3 = x.^3;

%Insert your code here (plot)
figure;
plot(x,y1,'b -','Linewidth',1.5);
hold on;
plot(x,y2,'r -','Linewidth',1.5);
hold on;
plot(x,y3,'k -','Linewidth',1.5);
hold on;
grid on;
set(gca,'FontSize',12);
xlabel('x axis (unit)','FontSize',12,'FontWeight','Bold')
ylabel('y axis (unit)','FontSize',12,'FontWeight','Bold')
legend('y=x','y=x^2','y=x^3');


% your graph will be here
% do not forget to plot on same figure

%% PART (c)
% Comment:
% The three characteristics coincide at x = 1
% However, one does not simply walk into mordor
% Furthermore, they are taking the hobits to isengard
