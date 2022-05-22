import pandas as pd
import matplotlib.pyplot as plt
for size in range(2,16):
    data = pd.read_csv('data/' + str(size) + 'x' + str(size) + '_diagonal_values.csv', header = None)
    data.drop(data.index[0], inplace = True)
    alpha = data[0]
    for i in range(1,size+1):
        diagonal = data[i]
        plt.scatter(alpha, diagonal, s=15)
        plt.title('Alpha Values and Corresponding Diagonals for ' + str(size) + 'x' + str(size))
        plt.xlabel('Alpha Values')
        plt.ylabel('Diagonal Values')
    plt.savefig('graphs/' + str(size) + 'x' + str(size) + '_diagonal')
    plt.clf()
