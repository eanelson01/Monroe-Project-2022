![](images/william_logo.png)
## Trends in Inverse Diagonal Entries of Convex Combinations of a Row Stochastic Matrix and the Identity
#### Ethan Nelson's Monroe Project 2022

For this project, I am looking at a square stochastic matrix A. The entries of A are non-negative and between zero and one. A is a square matrix, meaning it has an equal number of rows and columns. The number of rows is designated as n and is equal to the number of columns. With these conditions in mind, I am analyzing the trends of the equation (∝*A + (1-∝)*I). This equation transforms a non-negative stochastic matrix into a row diagonal dominant stochastic matrix. Row diagonal dominant means that the diagonal value of each row is greater than or equal to the absolute sum of the other values in that same row. ∝ is known as alpha and runs from 0 to 1/2 in the equation, averaging the original matrix, A, with the identity matrix. The identity is a matrix that has 1s on the diagonal and 0s for the off diagonal values. The dynamic nature of alpha means that there is a different weight placed on the identity vs the original matrix, A, at any time. At alpha = 0, the resulting matrix is just the identity. As alpha increases, there is more weight placed on the A matrix. The main goal of this research is to analyze the resulting diagonal values of the inverse, the derivative of those diagonal values, the relationship of the eigenvalues, and other trends to better understand the behavior of row diagonal dominant stochastic matrices. The trends of this equation and the type of matrices it creates are significant in the real world in modeling techniques for economics and could prove to be useful in many other fields dealing with row stochastic, diagonally dominant matrices of nxn size.  

#### Links to each research goal 

[Investigating the trends of diagonal values for the inverse in 2x2-15x15 stochastic diagonal row dominant matrices.](diagonal_of_the_inverse_findgings.md)

[Calculating the derivitive of the diagonal values of the inverse.](derivitives_findings.md)

[Identifying the relationship between the eigenvalues of the diagonally dominant row stochastic matrix and its principle matrix. ](eigenvalue_findings.md)

[Revisiting the diagonal values of the inverse using inequalities.](inequality_findings.md)

[Identifying results using the circulant, a supposed extreme example.](circulant_observations.md)

[Bibliography](bibliography.md)
