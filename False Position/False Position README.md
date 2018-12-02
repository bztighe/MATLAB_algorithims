False Position 
=======
#### Root finding method

This is a MATLAB function that uses the **False Position** numerical method to approximate the roots of a given function. The False position method is a "closed method" which means the user has to input two "bounds" that bracket the root in question. Closed methods are more computationally expensive, but will always return an answer. 
## How it works
The logic behind the False Position method is to take two points on the function and connect them with a straight line. The point where the line crosses the x-axis is the first guess for the root. From there, the upper and lower bounds are tested with the root to find where a sign change occurs. The two points between which the sign change occurs become the new upper and lower bounds. As with any approximation, more iterations reslut in a more accureate estimate. This function has multiple optional inputs so the user can determine when the answer is accurate enough and the maximum possible number of iterations.

### Equation 
   xr = xu-( ( f(xu) * (xl-xu) ) / ( f(xl) - f(xu) ) ) 
  
### Inputs
    func - the function being evaluated 
      ***note: must be entered as an anonymous function (eg: f= @(x) 3x^2+4x-2)
     xl - the lower bracket
     xu - the upper bracket
     es - the error for stopping criterion (defaults to 0.0001%)
     maxiter - the maximum number of iterations(defaults to 200)
  
### Outputs
    root - the approximate root location
    fx - the function evaluated at the root location
    ea - the approximate relative error (%)
    iter - number of iterations performed
    
 ## Limitations
 
 This False Position function will trigger an error at the user if there are less than 3 inputs provided. User must enter between 3 and 5 inputs because there are default values for inputs es and maxiter. Additionally, there will be an error if the user inputs a function that does not have a root, or if the initial brackets do not contain the root.
