![](images/william_logo.png)
### Ethan Nelson's Monroe Project 2022 with Charles Johnson and Ilya 

For this project, I am looking at a square stochastic matrix A. The entries of A are non-negative and between zero and one. A is a square matrix, meaning it has an equal number of rows and columns. With row stochasticity, the rows of the matrix A sum to 1. The number of rows is designated as n and is equal to the number of columns. With these conditions in mind, I am analyzing the trends of the equation ((1-t)*I + t*A). This equation transforms a non-negative stochastic matrix into a row diagonally dominant stochastic matrix. Row diagonally dominant means that the diagonal value of each row is greater than or equal to the absolute sum of the other values in that same row. In the equation, t runs from 0 to 1/2 averaging the original matrix, A, with the identity matrix. The identity is a matrix that has 1s on its diagonal and 0s for its off diagonal values. Throughout the project, t is referred to as t and alpha, but both represent the same value: the weight put on A compared to the identity in the convex combination. The dynamic nature of t means that there is a different weight placed on the identity vs the original matrix, A, at any time. At t = 0, the resulting matrix is just the identity. As t increases, there is more weight placed on the A matrix. The main goal of this research is to analyze the resulting diagonal values of the inverse, the derivative of those diagonal values, the relationship of the eigenvalues for the A matrix and its principle minor, and other trends to better understand the behavior of row diagonally dominant stochastic matrices. The trends of this equation and the type of matrices it creates are significant in the real world in modeling techniques for economics and could prove to be useful in many other fields dealing with row stochastic, diagonally dominant matrices of nxn size.  

#### Links to each research goal 

[1. Investigating the trends of diagonal values for the inverse in 2x2-30x30 stochastic diagonal row dominant matrices.](diagonal_of_the_inverse_findgings.md)

[2. Calculating the derivitive of the diagonal values of the inverse.](derivitives_findings.md)

[3. Identifying the relationship between the eigenvalues of the diagonally dominant row stochastic matrix and its principle sub matrix. ](eigenvalue_findings.md)

[4. Revisiting the diagonal values of the inverse using inequalities.](inequality_findings.md)

[5. Identifying results using the circulant, a supposed extreme example.](circulant_observations.md)

[6. Definitions of all variables in the project.](definitions.md)

[7. Bibliography](bibliography.md)
