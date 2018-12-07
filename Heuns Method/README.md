Heun's Method
============
### MATLAB function that uses Huen's method to approximate differential equations 

Heun's method for approximating differential equations is also known as the two stage **Runge-Kutta method** or the **Modified Euler's method**. The problem with Euler's method is that it can have a substantial deviation. The error is an overestimate if the differential equations solution curve is concave up, and an underestimate if it is concave down. Unfortunately without a solution, we have no way of knowing the concavity of said curve. Karl Heun modeled this method after Euler's method, making it a much more accurate approximation. Shortcut to my code [here](https://github.com/bztighe/MATLAB_algorithims/blob/master/Heuns%20Method/Heun.m).  

How it works
--------------
This method uses two equations known as the *predictor equation* and the *corrector equation*. The predictor equation uses the slope of a function at a point and uses it to  predict the slope at another point on the function exactly one 'step' (h) away. The corrector equation then takes the **average of both slopes** and applies it to the first point, thus making a substantially more accurate approximation.

![alt text](https://github.com/bztighe/Images/blob/master/heuns.png "Heuns method (a) predictor (b) corrector" )

### Equations

    yn+1 = yn +  h f(xn, yn)
    yn+1 = yn + (h/2) (f(xn, yn) + f(xn + h, yn +  h f(xn, yn))) 
    
### Inputs
  
         dydt: user's differential equation (must be an ANONYMOUS FUNCTION)
         tspan: The span of t values
         y0: y initial
         h: Step size
         es: error for stopping criterian
         maxit: the maximum number of iterations allowed
         
### Outputs

         y: independent variable
         t: dependent variable

### Notes
 The dydt input **MUST BE ENTERED AS AN ANONYMOUS FUNCTION**, that is with the syntax dydt= @(t,y) ...
  Also, notice the title of the plot calls the anonumous function that the user input.
