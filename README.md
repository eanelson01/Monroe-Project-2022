![](images/william_logo.png)
### Ethan Nelson's Monroe Project 2022 with Charles Johnson and Ilya Spitkovsky

For this project, I am looking at a square stochastic matrix A. The entries of A are non-negative and between 0 and 1. A is a square matrix, meaning it has an equal number of rows and columns. The number of rows and columns of the matrix is designated as n. With row stochasticity, the rows of the matrix A sum to 1. With these conditions in mind, I am analyzing the trends of the equation ((1-t)*I + t*A). This equation transforms a non-negative stochastic matrix into a row diagonally dominant stochastic matrix. Row diagonally dominant means that the diagonal value of each row is greater than or equal to the absolute sum of the other values in that same row. In the equation, t runs from 0 to 1/2 averaging the original matrix, A, with the identity matrix. The identity is a matrix that has 1s on its diagonal and 0s for its off diagonal values. Throughout the project, t is referred to as both t and alpha, but each represent the same value: the weight put on A compared to the identity in the convex combination. The dynamic nature of t means that there is a different weight placed on the identity vs the original matrix, A, at any time. At t = 0, the resulting matrix is just the identity. As t increases, there is more weight placed on the A matrix. The main goal of this research is to analyze the resulting diagonal values of the inverse and their trends. We are able to do this in many ways involving the derivative, eigenvalues, trace, and more. Analyzing the trends of the inverse diagonal values provides better understanding of the behavior of row diagonally dominant stochastic matrices. The trends of this equation and the type of matrices it creates are significant in the real world in modeling techniques for economics and could prove to be useful in many other fields dealing with row stochastic diagonally dominant matrices of nxn size. 

To navigate to additional pages and view each research step, view the links below.

### Links to Each Research Goal 

[1. Investigating the trends of inverse diagonal values of 2x2 to 30x30 diagonally dominant row stochastic matrices graphically.](diagonal_of_the_inverse_findgings.md)

[2. Calculating the derivative of the inverse diagonal values using the determinant expression.](derivitives_findings.md)

[3. Identifying the relationship between the eigenvalues of the diagonally dominant row stochastic matrix and its principle sub-matrix. ](eigenvalue_findings.md)

[4. Proof that a symmetric row stochastic diagonally dominant matrix will always have increasing inverse diagonal entries.](similarity_explanation.md)

[5. Revisiting the derivative of the diagonal values of the inverse through an inequality expression.](inequality_findings.md)

[6. Identifying results using the circulant, a supposed extreme example of an A matrix.](circulant_observations.md)

### Definition and Reference Page

[1. Definitions of all variables used in the project.](definitions.md)

[2. References ](bibliography.md)
