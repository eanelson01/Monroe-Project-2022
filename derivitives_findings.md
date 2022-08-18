## Derivitives of the Inverse Diagonal Values
After seeing that the diagonal values of the inverse appear to be increasing with increases in t, we moved on to supporting that finding analytically with the derivative. The diagonal values of a matrix can be expressed by the equation below:

![](images/determinant_expression_of_diagonal_of_inverse.png)

Det stands for the determinant of the resulting matrices. A(i) represents the matrix A without the column and row i. This means that A(i) has one less row and column than A, making it a (n-1) x (n-1) matrix. i stands for the given diagonal value of the inverse that the equation is solving for. For example, if solving for the (1,1) entry of the inverse matrix, i equals 1 and the A(1) matrix would be A without the first row and column. The process continues for each diagonal value of the inverse. Knowing this expression, we were able to apply it to calculate the derivative of the diagonal values in relation to the t value. To start, we looked at the 2x2 case for a simpler start. Using Matlab and hand calculations, we found the first and second derivative for the 2x2 case. Both are provided below alongside the theoretical row stochastic matrix as a frame of reference for the variables.  

### 2x2 Matrix

The Matrix:

![](images/theoretical_2x2_matrix.png)

First Derivative:

![](images/first_derivitive_2x2.png)

Above is the first derivative for the 2x2 inverse of the row stochastic diagonally dominant matrix. By analysis, the first derivative appears to be positive in all instances, indicating an increase in the diagonal values as t, or in this equation t, increases. This is consistent in our findings with the diagonal values in the previous section.  

Second Derivative:

![](images/second_derivitive_2x2.png)

Above is the second derivative for the diagonal values of the 2x2 inverse. The second derivative is much more complicated than the first derivative, involving many more terms. Using simulations with varying a, b, and t values, I was able to show that the second derivative is also always positive for the 2x2 case. This further supports the thought that the diagonal values of the inverse are always increasing as t increases. 

### 3x3 Matrix

The Matrix:

![](images/theoretical_3x3_matrix.png)

First Derivitive:

![](images/first_derivitive_3x3.png)

Above is the first derivative of the diagonal values of the inverse for the 3x3 matrix. The complexity increased dramatically, and the increase in variables made it much harder to evaluate this derivitive in an analytical way. 

## Results and next steps
As a result of the increasing complexity of the derivatives, we shifted our focus away from trying to illustrate the phenomenon with strictly derivatives because it would be too complicated to show for larger sizes in a consistent manner. With this in mind, I did not shift entirely away from the determinant method for finding the diagonal values of the inverse, however. That formula proved useful in later sections including [finding an inequality as](inequality_findings.md) well as [viewing the circulant](circulant_observations.md).
### View the code

[Matlab script for finding the derivatives and testing them for positivity](code_files/looking_at_determinant_derivatives.m)

### Navigate to other pages

[Go to next page: Findings with Eigenvalues](eigenvalue_findings.md)

[Return to home page](README.md)

[View definitions of symbols used in the project](definitions.md)

