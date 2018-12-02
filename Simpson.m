function [I] = Simpson(x,y)
%Simpson Function that applies Simpson's 1/3 integration approximation
%method to a user given data set.
%   INPUTS: 
%       x: a vector containing evenly spaced integers as part of a data set
%       y: a vector containing data from a set corresponding with x, or
%       outputs of a function corresponding to respective x inputs.
%   OUTPUT:
%       I: The simpson's 1/3 rule approximate integral value
%   
%   note: Simpsons 1/3 method requires a data set with an even number of
%   intervals, if data with an odd number of intervals is input, then the
%   function will determine which interval is best to apply the Trap rule
%   to eliminate an interval whilst minimizing approximation error.
%
%------------------------------------------------------------------
%===   created with pride by: Brandon Tighe                     ===
%===   for: Mech 105                                            ===
%===   on: 11/5/18                                              ===
%===                                                            ===
%------------------------------------------------------------------

%check to ensure vectors are compitable
if length(x)~=length(y)
    error('Vectors x and y must be the same length.')
end

intervalCount=length(x)-1;

%check difference between points,(retruns vector)
deltaX=diff(x);     
for i=1:length(x)-1
    if deltaX(i)~=deltaX(1)
        error('Ensure that the x spacing between data points is consistent.')
    end
end

if mod(intervalCount,2)~=0 %indicates odd number of intervals(apply trap rule)
    
    %warn user of trap rule application
    warning('Note: Trapazoid rule has been applied to the exterior interval with the shortest change in function output!!!')
    
    %h after removing one interval
    h=((x(length(x)-1))-(x(1)))/(intervalCount-1); 
    %determine which exterior interval has the smallest delta y
    if abs(y(1)-y(2)) < abs(y(length(y)-1)- y(length(y)))
        
        %first interval (smaller delta y) gets trap rule
        trapRuleVal= deltaX(1)*(y(1)+y(2))/2;
        
        %simpson 1/3 method on remaining intervals:
        % "even" values if x2 is treated as x0
        evenPointCoeff=y(4:2:length(y)-1);
        % "odd" values if x2 is treated as x0
        oddPointCoeff=y(3:2:length(y));
        
        %calculate each different part of simpsons 1/3 rule
        oddPointVal= (h/3)* 4*sum(oddPointCoeff);
        evenPointval= (h/3)* 2*sum(evenPointCoeff);
        exteriorPointVal=(h/3)*(y(2)+y(length(y)));
        
    else 
        % last interval gets the trap rule 
        trapRuleVal= deltaX(1)*(y(length(y)-1)+y(length(y)))/2;
        
        %simpson 1/3 method:
        % "even" values if x1 is treated as x0
        evenPointCoeff=y(3:2:length(y)-2);
        
        % "odd" values if x1 is treated as x0
        oddPointCoeff=y(2:2:length(y)-1);
        
        %calculate each different part of simpsons 1/3 rule
        oddPointVal= (h/3)* 4*sum(oddPointCoeff);
        evenPointval=(h/3)* 2*sum(evenPointCoeff);
        exteriorPointVal=(h/3)*(y(1)+y(length(y)-1));
    end
    
    %sum terms for final answer
    I= trapRuleVal+oddPointVal+evenPointval+exteriorPointVal;
else
    
    h=((x(length(x)))-(x(1)))/(intervalCount);
    
    % "even" values if x1 is treated as x0
    evenPointCoeff=y(3:2:length(y)-1);
    % "odd" values if x1 is treated as x0
    oddPointCoeff=y(2:2:length(y));
    
    %calculate each different part of simpsons 1/3 rule
    oddPointVal=(h/3)* 4*sum(oddPointCoeff);
    evenPointval=(h/3)* 2*sum(evenPointCoeff);
    exteriorPointVal=(h/3)*(y(1)+y(length(y)));
    
    %sum terms for final answer
    I=oddPointVal+evenPointval+exteriorPointVal;
    
end
I;
end

