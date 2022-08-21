for test = 1:1:10 %running through 10 tests
    negative_trace_tracker = []
    negative_inequality_counter = 0;
    
    for n = 2:1:30 %going from n = 2 to n = 30
        disp(string(n))
        for count = 1:1:100000 %making a total of 100000 different A's for each size n
            initial = rand(n); %creating an initial, random matrix that is later transformed to the stochastic
            rowsum = sum(initial, 2); %calculating the row sum of the initial matrix
            A = bsxfun(@rdivide, initial, rowsum);
            for alpha = 0:.01:.5
                disp(string(alpha))
                A_t = ((1-alpha)*eye(n) + (alpha)*A); %convex combination
                B_t = A_t;
                B_t(1,:) = [];
                B_t(:,1) = []; %creating the principle sub matrx
                B_inv = inv(B_t);
                A_inv = inv(A_t); %creating the inverses
                
                trace_inequality = sum(diag(A_inv)) - sum(diag(B_inv)) - 1; %calculating the trace inequality

                if sign(trace_inequality) == -1 %checking if trace inequality is negative
                    negative_trace_tracker = [negative_trace_tracker; n count alpha trace_inequality] %storing the values from the negative test
                    writematrix(A_t, 'inequality/matrices/negative_inequalities/n_' + string(n) + '_count_' + string(count) + '_trace_negative_inequality_A_matrix_test_' + string(test) + '.csv') %saving the A_t matrix to look at after
                end
            end
        end
    end
    writematrix(negative_trace_tracker, 'inequality/trace_negative_inequality_values_test_' + string(test) + '.csv') %saving the values from the matrices creating a negative inequality
end