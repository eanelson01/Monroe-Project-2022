%% observing the diagonal values of the inverse
largest_value = 0
largest_tracker = []
for n = 2:1:30
    for count = 1:1:30
        disp('On size:' + string(n)) %displaying what size matrix it is on
        initial = rand(n); %creating an initial, random matrix that is later transformed to the stochastic
        rowsum = sum(initial, 2); %calculating the row sum of the initial matrix
        A = bsxfun(@rdivide, initial, rowsum); %dividing the initial matrix by the row sum to create a row stochastic matrix
        tracker = zeros(1, n + 1); %creating a matrix that will house the diagonal matrices 
        for alpha = 0:.05:.5 %for loop to go through alpha values from 0-.5
            A_t = ((alpha * A) + (1-alpha)*eye(n)); %creating the combined matrix based on the equation
            A_inverse = inv(A_t); %taking the inverse of the combined matrix
            diagonals = diag(A_inverse, 0); %gathering the diagonal entries of the inverse
            tracker = [tracker;alpha transpose(diagonals(:))] %appending the alpha value and diagonal values to the final matrix to keep track
            largest_tracker = [largest_tracker; n count alpha ]
        end
        if max(diagonals) > largest_value
            largest_value = max(diagonals) %saving the largest value in order to examine later
        end
        
        %writematrix(tracker, 'data/diagonal_values/newer_approach/n_' + string(n) + '_count_' + string(count) + '_inverse_diagonal_values.csv') %saving the final matrix as a csv file to  work in python
    end
end