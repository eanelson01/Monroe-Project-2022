%% Saving the inverse diagonal values of the circualnt at varying n's
n = 2 %select n you want to view
v = [0 1] %create first row of the circulant
A = toeplitz([v(1) fliplr(v(2:end))], v); %function that rotates values to create rest of the circulant.
diagonal_tracker = []
for alpha = 0:.01:.5 
    A_t = (1-alpha) * eye(n) + alpha * A
    A_inv = inv(A_t)
    diagonals = diag(A_inv)
    a_inv_1_1 = diagonals(1,1)
    diagonal_tracker = [diagonal_tracker; alpha a_inv_1_1]
end
writematrix(diagonal_tracker, 'circulant/n_2_circulant_diagonal_values_for_graph.csv')
%% Finding where the derivative is equal to 0
n = 11 %can select the size matrix you want
v = [0 1 0 0 0 0 0 0 0 0 0]; %create the first row of the circulant. 1 is the second entry and have as many entries as needed to match n.
A = toeplitz([v(1) fliplr(v(2:end))], v); %function that rotates the circulant to make the full matrix from the first row.
diagonal_tracker = [];
for alpha = .4276:.0000001:.4277 %narrow down the matrix to find out where it is equal to 0.
    A_t = (1-alpha) * eye(n) + alpha * A;
    A_inv = inv(A_t);
    B_t = A_t;
    B_t(1,:) = [];
    B_t(:,1) = [];
    B_inv = inv(B_t);
    inequality = sum(diag(A_inv)) - sum(diag(B_inv)) - 1;
    diagonal_tracker = [diagonal_tracker; alpha inequality];
end
writematrix(diagonal_tracker, 'circulant/n_11_circulant_zero_finder.csv') %save the file. 