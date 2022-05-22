for size = 2:1:15
    disp('On size:') %displaying what size matrix it is on
    disp(size)
    initial = rand(size); %creating an initial, random matrix that is later transformed to the stochastic
    rowsum = sum(initial, 2); %calculating the row sum of the initial matrix
    A = bsxfun(@rdivide, initial, rowsum); %dividing the initial matrix by the row sum to create a row stochastic matrix
    final = zeros(1, size + 1); %creating a matrix that will house the diagonal matrices 
    for alpha = 0:.005:.5 %for loop to go through alpha values from 0-.5
        combined = ((alpha * A) + (1-alpha)*eye(size)); %creating the combined matrix based on the equation
        inverse = inv(combined); %taking the inverse of the combined matrix
        diagonals = diag(inverse, 0); %gathering the diagonal entries of the inverse
        b = [alpha transpose(diagonals(:))]; %putting the diagonal values with the alpha value
        final = [final;b] %appending the alpha value and diagonal values to the final matrix to keep track
    end
    writematrix(final, string(size) + 'x' + string(size) + '_diagonal_values.csv') %saving the final matrix as a csv file to  work in python
end