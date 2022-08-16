import pandas as pd
import matplotlib.pyplot as plt

for n in range(2,31):
    for count in range(1,16):
        data = pd.read_csv('data/diagonal_values/newer_appraoch/n_' + str(n) + '_count_' + str(count) + '_inverse_diagonal_values.csv', header = None) #importing the data
        data.drop(data.index[0], inplace = True) #removing the zeros at the top of the csv
        alpha = data[0] #grabbing the alpha value for each set
        for i in range(1,n+1): #running through the different columns for diagonal values
            diagonal = data[i]
            plt.scatter(alpha, diagonal, s=15) #creating a scatter plot
            plt.title('Alpha Values and Corresponding Diagonals for ' + str(n) + 'x' + str(n))
            plt.xlabel('Alpha Values') #giving labels to the axis
            plt.ylabel('Diagonal Values')
            plt.ylim(.8,3.5) #setting the y axis limit
        plt.savefig('graphs/diagonal_values/new_approach/fixed_axis/n_' + str(n) + '_count_' + str(count) + '_inverse_diagonal_values_graph.png')
        plt.clf()
