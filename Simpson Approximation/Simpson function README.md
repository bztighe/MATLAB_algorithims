# Simpson Method
#### MATLAB function that uses Simpsons 1/3 method to approximate definite integrals of datasets

The trapazoid rule uses a linear estimate between two points to approximate the integral, obviously this has a high error on most functions/datasets. Whats much more accurate method is the Simpson Methods, which work on 2nd and 3rd order polynomials. There are various versions of Simpson Method's used for numerical integration, including the 1/3 (used for 3 data points) and 3/8 rule(used for 4 data points), and the Composite 1/3 rule (for multiple data points). This MATLAB alogorithim uses Composite Simpsons 1/3 method to approximate the integral of a dataset.

## How it Works
Composite Simpson 1/3 method can only be used on data sets with an odd number of entries (even number of segments between entries). If the given data has an even number of entries, my algorithim determines which end-interval has a more modest change in the dependent variable and applies the trapazoid rule to approximate the integral of that segment, before using composite Simpson 1/3 rule to approximate the rest of the data. 

### Equation
I=(b−a)(f(x0) + 4∑[i=1,3,5][n−1]f(xi) + 2∑[j=2,4,6][n−2]f(xj) + f(xn)) (1/3n)

### Inputs
      x: a vector containing evenly spaced integers as part of a data set
      y: a vector containing data from a set corresponding with x, or
      outputs of a function corresponding to respective x inputs.
      
### Output
    I: The simpson's 1/3 rule approximate integral value
    
## Limitations
The Simpson algorithm only works with the vector inputs of two experimental data sets. Additionally, the two vectors must be the same length with more than 3 data values. The independent (x) experimental data set must also be **equally spaced** in order for Simpson's rule to work.
