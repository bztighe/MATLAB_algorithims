LU Factor
=====

### Algorithim for decomposing a square matrix into its Upper and Lower Triangluar components

In Linear Algebra, decomposing a **square** (nxn) matrix into its *lower triangular* and *upper triangluar* components is a very useful step for determining the inverse and determinant, for solving systems of equations, and applying the Wronskian method to test for linear independence. This method is essentially a modified version of Gaussian Elimination, and is used by most computers to solve systems of equations. Shortcut to my code can be found [here](https://github.com/bztighe/MATLAB_algorithims/blob/master/LU%20decomposition/luFactor.m).

How it works
-----

First, my algorithim ensures that the user supplied matrix is in fact square. Next it builds nxn identity matricies as "empty" templates to fill in for the Lower matrix, a Pivot placeholder matrix, and an Identity matrix for determining the inverse. Next, it row-reduces the matrix to attain the Upper triangular matrix, while keeping track of pivots which are used to determine the Lower triangular matrix. I added an additional option for it to calculate the matrix inverse. 

### Inputs
       A - coefficient matrix
       
### Outputs
       L - lower triangular matrix

       U - upper triangular matrix

       P - the pivot matrix

       Inv- (optional) The inverse of the given matrix
       
### Notes
The user input must be a **square matrix** (has the same number of rows as columns). Also, if user requests (4) outputs, the 4th one will be an inverse matrix of the user selected matrix. If there is only 3 outputs selected it will output be L,U,P respectively. 
    
