function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% falsePosition- Uses False Postition method  to approximate roots
% created by Brandon Tighe
%Input:
%  func - the function being evaluated 
% ***note: must be entered as an
%          anonymous function (eg: f= @(x) 3x^2+4x-2)
%  xl - the lower bracket
%  xu - the upper bracket
%  es - the error for stopping criterion (defaults to 0.0001%)
%  maxiter - the maximum number of iterations(defaults to 200)
%
%Output:
%  root - the approximate root location
%  fx - the function evaluated at the root location
%  ea - the approximate relative error (%)
%  iter - number of iterations performed

%error code for less than 3 inputs
if nargin<3, error('function requires minimum three(3) arguments.'),end

%intial test to ensure root is withen bounds
test = func(xl)*func(xu);
if test>0, error('No sign change.'), end

%optional inputs and their defaults
if nargin<4 || isempty(es), es=0.0001;end
if nargin<5 || isempty(maxiter), maxiter=200;end

%initial defintions for variables
iter=0;xr=xl;ea=100;

%start infinite loop
while (1)
    xrold=xr;                                       %update xrold
    xr = xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); %f.p. formula for xr
    iter= iter+1;                                   %iteration counter
    if xr~=0, ea= abs((xr-xrold)/xr)*100;end        %calculate ea
    
    %determine which bounds contain the root, and set new bounds
    test = func(xl)*func(xr);
    if     test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        ea=0;
    end
    
    %stopping criterion, break from infinite loop
    if ea<=es ||iter>=maxiter,break, end
end
%define answers
root= xr;
fx= func(xr);


