function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Huen function that uses Huens method (modified Eulers) to approximate
%integreals.
%
%   INPUTS:
%       dydt: user's differential equation (must be an ANONYMOUS FUNCTION)
%       tspan: The span of t values
%       y0: y initial
%       h: Step size
%       es: error for stopping criterian
%       maxit: the maximum number of iterations allowed
%
%   OUTPUT:
%       y: independent variable
%       t: dependent variable
%
%   note: The dydt input MUST BE ENTERED AS AN ANONYMOUS FUNCTION, that is
%   with the syntax dydt= @(t,y) ...
%   Also, notice the title of the plot calls the input function.
%
%------------------------------------------------------------------
%===   created with pride by: Brandon Tighe                     ===
%===   for: Mech 105                                            ===
%===   on: 12/4/18                                              ===
%===                                                            ===
%------------------------------------------------------------------

if nargin < 4 || nargin > 6
    error('Minimal four arguments required.') %Ensures user inputs 4-6 arguments
    
elseif nargin == 4 % Use default es and maxit
    es = 0.001; % Error is 0.1%
    maxit = 50; % Maximum iterations.
    
elseif nargin == 5 % Use default maxit
    maxit = 50;
    
elseif any(diff(tspan) <= 0) % Ensures tspan vqalues are in ascending order
    error('Ensure tspan is in ascending order.')
end

if h < 0 % h must be positive
    h = abs(h);
    warning('h was replaced with the absolute value of h.')
end


t = tspan(1):h:tspan(2); % Create tspan vector with step size h


if (t(length(t)) ~= tspan(2)) %fixes tspan in the case that h does not fit in it evenly
    t = [t tspan(end)];
end

h = diff(t); % Ensure step size h is correct

y = ones(1,length(t))*y0; % y vector

for i = 1:length(t)-1
    slope1 = dydt(t(i),y(i)); % The first slope estimate.
    yPred = y(i) + (slope1)*h(i); % The y value with the estimated slope. "Predictor equation"
    
    for j = 1:maxit
        yold = yPred; % to find new y
        slope2 = dydt(t(i+1),yold); % Calculate slope using old t value and using yold.
        yPred = y(i) + 0.5*h(i)*(slope1+slope2); % Predictor formula for new y value.
        
        ea = ((abs(yPred - yold))/(abs(yPred)))*100; % Approximate error percent
        
        if ea <= es   % Stopping criterion
            break
            
        end
        
    end
    
    y(i+1) = yPred; %Making y array
end

plot(t,y) % Plot t,y

%stylizing plot
ax=gca;
ax.FontSize=12; %increase font size

xlabel('t')
ylabel('y')

str= func2str(dydt);
title(['Heuns Method for: ' str]) % Custom title with user's anonymous function


end



