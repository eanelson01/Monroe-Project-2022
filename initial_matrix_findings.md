## Initial Findings of Matrices from 2x2 to 15x15

### Procedure
For this experiment, I used Matlab to create a random, square, row stochastic matrices of varying sizes. The matrices went from 2x2 up to 15x15. The matrices were labeled as A and put in the equation (∝*A + (1-∝)*I) where I is the identity and ∝ is a value from 0 to 0.5. The resulting matrix of that equation was inverted and the diagonal values stored for each corresponding alpha value. These values were then graphed in the scatter plots shown below. Each generated line represents one column of the diagonal values from each matrix and their values based on the alpha value. The results here are based on one randomized matrix per size but the script can be run many times to generate many values. It is important to note that our prediction is correct at this level analysis that all diagonal values as a result of this equation are grater than or equal to 1/2. In fact, they appear to be greater than or equal to 1. 

### Findings and Graphs
![2x2 Graph](graphs/2x2_diagonal.png)
![3x3 Graph](graphs/3x3_diagonal.png)
![4x4 Graph](graphs/4x4_diagonal.png)
![5x5 Graph](graphs/5x5_diagonal.png)
![6x6 Graph](graphs/6x6_diagonal.png)
![7x7 Graph](graphs/7x7_diagonal.png)
![8x8 Graph](graphs/8x8_diagonal.png)
![9x9 Graph](graphs/9x9_diagonal.png)
![10x10 Graph](graphs/10x10_diagonal.png)
![11x11 Graph](graphs/11x11_diagonal.png)
![12x12 Graph](graphs/12x12_diagonal.png)
![13x13 Graph](graphs/13x13_diagonal.png)
![14x14 Graph](graphs/14x14_diagonal.png)
![15x15 Graph](graphs/15x15_diagonal.png)

### View the code
[View the Matlab script used to generate the results](initial_findings.m)

[View the Python script used to graph and analyze the results](displaying_initial_results.py)