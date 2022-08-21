### Viewing the Circulant

After finding out that the inequality can be negative, indicating that the inverse diagonal values do not always increase through the domain t = [0, 1/2], we looked for the most extreme version that results in a negative inequality. Since the trend seemed to be 0s on the diagonal and a large value on the off diagonal, the most extreme example seemed to be the circulant matrix. The circulant matrix has a 1 on the off diagonal and 0s on the diagonals. Below are examples of the n = 2 through n = 4 circulant matrices:

| Size of Matrix | Example Circulant Matrix |
| ------------- | ---------- |
| 2 | ![](images/circulant/n_2_circulant.png)|
| 3 | ![](images/circulant/n_3_circulant.png)|
| 4 | ![](images/circulant/n_4_circulant.png)| 

Using the circulant at each size as the A matrix, I ran it through the convex combination with the identity and looked at the inverse diagonal values at each t. The results of the diagonals are displayed in graphs from n = 2 to n = 10:

| Size of Matrix | Graph of Inverse Diagonal Values | 
| ------------- | ------------ |
| 2 | ![](images/circulant/n_2_circulant_diagonal_values.png)|
| 3 | ![](images/circulant/n_3_circulant_diagonal_values.png)|
| 4 | ![](images/circulant/n_4_circulant_diagonal_values.png)|
| 5 | ![](images/circulant/n_5_circulant_diagonal_values.png)|
| 6 | ![](images/circulant/n_6_circulant_diagonal_values.png)|
| 7 | ![](images/circulant/n_7_circulant_diagonal_values.png)|
| 8 | ![](images/circulant/n_8_circulant_diagonal_values.png)|
| 9 | ![](images/circulant/n_9_circulant_diagonal_values.png)|
| 10 | ![](images/circulant/n_10_circulant_diagonal_values.png)|

Based on the graphs, the derivative changes from positive to negative in the odd size matrices while there is no change in the even circulant matrix. Additionally, the turnover point in the odd size matrices occurs at a larger t for larger sized matrices. For example, the turnover point for the 3x3 matrix occurs around 1/3 while the turnover for the 9x9 matrix is closer to .41. For a more exact view of where the turnover occurs, we can find the derivative for the diagonal values using the determinant expression we've used throughout the project using the circulant as the A matrix:

![](images/circulant/determinant_expression_circulant.png)

From here, we can calculate what f(t) and g(t) come out as. By viewing the 2x2 to 5x5 examples, the pattern became clear. 

| Size of Matrix (n) | f(t) | g(t) |
| ------- | ------- | ------ |
| n | ![](images/circulant/f_n.png) | ![](images/circulant/g_n.png) |
| 2 | ![](images/circulant/f_2.png) | ![](images/circulant/g_2.png) |
| 3 | ![](images/circulant/f_3.png) | ![](images/circulant/g_3.png) |
| 4 | ![](images/circulant/f_4.png) | ![](images/circulant/g_4.png) | 
| 5 | ![](images/circulant/f_5.png) | ![](images/circulant/g_5.png) |

Once we had the f(t) and g(t), we took their derivatives to take the derivative  of the whole expression:

| Size of Matrix (n) | f(t)' | g(t)' |
| ------- | ------- | ------ |
| n | ![](images/circulant/f_d_n.png) | ![](images/circulant/g_d_n.png) |
| 2 | ![](images/circulant/f_d_2.png) | ![](images/circulant/g_d_2.png) |
| 3 | ![](images/circulant/f_d_3.png) | ![](images/circulant/g_d_3.png) |
| 4 | ![](images/circulant/f_d_4.png) | ![](images/circulant/g_d_4.png) | 
| 5 | ![](images/circulant/f_d_5.png) | ![](images/circulant/g_d_5.png) |  

Putting it together, the numerator of the total derivative for the nxn case is:

![](images/circulant/numerator_circulant_derivative.png)

Setting the numerator equal to zero gives the t where the derivative is 0 and the diagonal values start to decrease with increasing t for the circulant. 





### View the code



### Navigate to Other Pages
[Go to the next page: Other Miscellaneous Findings](misc_observations.md)

[Return to home page](README.md)

[View definitions of symbols used in the project](definitions.md)  