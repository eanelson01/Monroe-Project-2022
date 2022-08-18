%% Generating eigenvalues for matrices size 3 to 10
for n = 3:1:10
    a_real_tracker = zeros(1,n+2) %list to track real eigenvalues of A matrix after averaging with the identity
    a_real_minor_tracker = zeros(1,n+1) %list to track real eigenvalues of B matrix after averaging with the identity
    a_complex_tracker = zeros(1,n+2) %list to track complex eigenvalues from the A matrix after averaging with the identity
    a_complex_minor_tracker = zeros(1,n+1) %list to track complex eigenvalues from the B matrix after averaging with the identity
    a_original_tracker = zeros(1,n+2) %list to track original eigenvalues from the A matrix before averaging with the identity
    a_original_minor_tracker = zeros(1,n+1) %list to track the eigenvalues of the B matrix before averaging with the identity
    complex_tracker = 0 %a number to see how many complex eigenvaluse there are
    for count = 1:1:100
        initial = rand(n); %creating an initial, random matrix that is later transformed to the stochastic
        rowsum = sum(initial, 2); %calculating the row sum of the initial matrix
        A = bsxfun(@rdivide, initial, rowsum); %creating row stochasticity by dividing by the row sums
        original_eigen = sort(transpose(eig(A))) %taking the eigenvalues of the original A matrix.
        C = A %setting A equal to C to make modifications without affecting the original matrix.
        C(1,:) = [] %removing the first row of A
        C(:,1) = [] %removing the first column of A
        original_minor_eigen = sort(transpose(eig(C))) %taking the eigenvalues of the original minor, B matrix. Called C here so I can do the averaging with the identity later.
        for alpha = 0:.1:1
            B = ((1-alpha)*eye(n) + (alpha)*A); %averaging the original A matrix with the identity
            writematrix(B, 'data/eigenvalues/a_eigen/matrices/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_alpha_' + string(alpha) + '_matrix_count_' + string(count) + '.csv') %saving the A matrix after averaging with the idenityt to look at later
            a_eigen = sort(eig(B)); %saving eigenvalues of the A matrix after averaging
            B(1,:) = [];
            B(:,1) = [];
            minor_eigen = sort(eig(B)); %saving eigenvalues of the minor matrix after averaging.
            original_values = [count alpha original_eigen] %storing the count, alpha, and eigenvalues of the original A eigenvalues
            original_minor_values = [count alpha original_minor_eigen]
            a_values = [count alpha transpose(a_eigen)]
            minor_values = [count alpha transpose(minor_eigen)]
            a_original_tracker = [a_original_tracker; original_values] %storing the original eigenvalues in list to save as csv after
            a_original_minor_tracker = [a_original_minor_tracker; original_minor_values] %storing the original minor eigenvalues in list to save as csv later
            if isreal(minor_eigen) %checking if minor eigenvalues are real
                a_real_minor_tracker = [a_real_minor_tracker;minor_values] %if its real, adding it to the real tracker
            end
            if not(isreal(minor_eigen))
                a_complex_minor_tracker = [a_complex_minor_tracker;minor_values] %if its not real, adding to the complex tracker
            end
            if isreal(a_eigen)
                a_real_tracker = [a_real_tracker;a_values] %same as above but for the a matrix
            end
            if not(isreal(a_eigen))
                a_complex_tracker = [a_complex_tracker;a_values]
            end
            
        end
    end
    writematrix(a_real_tracker, 'data/eigenvalues/a_eigen/major/'+ string(n) + 'x' + string(n) + '/n_' + string(n) + '_real_major_eigenvalues.csv') %each is saving the lists made above
    writematrix(a_complex_tracker, 'data/eigenvalues/a_eigen/major/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_complex_major_eigenvalues.csv')
    writematrix(a_real_minor_tracker, 'data/eigenvalues/a_eigen/minor/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_real_principle_minor_eigenvalues.csv')
    writematrix(a_complex_minor_tracker, 'data/eigenvalues/a_eigen/minor/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_complex_principle_minor_eigenvalues.csv')
    writematrix(a_original_tracker, 'data/eigenvalues/a_eigen/original/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_original_eigenvalues.csv')
    writematrix(a_original_minor_tracker, 'data/eigenvalues/a_eigen/original_minor/' + string(n) + 'x' + string(n) + '/n_' + string(n) + '_original_minor_eigenvalues.csv')
end
%% Importing eigenvalues to check for majorization
combined = readtable("data\eigenvalues\combined\n_4_real_eigenvalues_combined.csv");
count = height(combined)
majorized_tracker = zeros(1)
not_majorized_tracker = zeros(1)
for time = 1:1:count
    major = sort(table2array(combined(time,3:6)))
    major = major(1:3)
    minor = sort(table2array(combined(time,6:8)))
    if minor(1) > major(1)
        if (minor(1) + minor(2)) > (major(1) + major(2))
            if (minor(1) + minor(2) + minor(3)) > (major(1) + major(2) + major(3))
                disp('majorized')
                majorized_tracker = majorized_tracker + 1
            end
        end
    end
    if not (minor(1) > major(1))
        not_majorized_tracker = [not_majorized_tracker;time]
    end
end

%doesn't appear to pass majorization but is close most times
%% Checking spectral radius, the largest eigenvalue of the minor, is bigger than the largest of the A matrix
success_tracker = 0
failure_sizes = zeros(1)
for n = 3:1:10
    combined = readtable("data\eigenvalues\combined\n_" + string(n) + "_absolute_all_eigenvalues_combined.csv");
    count = height(combined)
    bigger_tracker = 0
    failure_tracker = zeros(1)
    example_tracker = zeros(1)
    for time = 1:1:count
        major = sort(table2array(combined(time,3:n+2)))
        major = major(1:n-1)
        minor = sort(table2array(combined(time,n+3:2*n+1)))
        if minor(n-1) >= major(n-1)
            bigger_tracker = bigger_tracker + 1
            example_tracker = [example_tracker;time]
        end
        if not(minor(n-1) >= major(n-1))
            failure_tracker = [failure_tracker;time]
        end
    end
    if bigger_tracker == height(combined)
        disp('success')
        success_tracker = success_tracker + 1
    end
    if bigger_tracker ~= height(combined)
        failure_sizes = [failure_sizes;n]
    end
end
%% preparing the complex files to be made into absolute values to add with real values
for size = 3:1:10
    major_complex = table2array(readtable('data/eigenvalues/a_eigen/major/' + string(size) + 'x' + string(size) + '/n_' + string(size) + '_complex_major_eigenvalues.csv'))
    absolute = abs(major_complex)
    writematrix(absolute, 'data/eigenvalues/a_eigen/major/' + string(size) + 'x' + string(size) + '/n_' + string(size) +  '_absolute_complex_major_eigenvalues.csv')
    minor_complex = table2array(readtable('data/eigenvalues/a_eigen/minor/'  + string(size) + 'x' + string(size) + '/n_'  + string(size) + '_complex_principle_minor_eigenvalues.csv'))
    absolute_minor = abs(minor_complex)
    writematrix(absolute_minor, 'data/eigenvalues/a_eigen/minor/' + string(size) + 'x' + string(size) + '/n_' + string(size) + '_absolute_complex_principle_minor_eigenvalues.csv')
    original_complex = table2array(readtable('data/eigenvalues/a_eigen/original/'  + string(size) + 'x' + string(size) + '/n_'  + string(size) + '_original_eigenvalues.csv'))
    absolute_original = abs(original_complex)
    writematrix(absolute_original, 'data/eigenvalues/a_eigen/original/' + string(size) + 'x' + string(size) + '/n_' + string(size) + '_absolute_original_eigenvalues.csv')
    original_minor_complex = table2array(readtable('data/eigenvalues/a_eigen/original_minor/'  + string(size) + 'x' + string(size) + '/n_'  + string(size) + '_original_minor_eigenvalues.csv'))
    absolute_original_minor = abs(original_minor_complex)
    writematrix(absolute_original_minor, 'data/eigenvalues/a_eigen/original_minor/' + string(size) + 'x' + string(size) + '/n_' + string(size) + '_absolute_original_minor_eigenvalues.csv')
end
%% checking 3x3 case
n = 3
combined = readtable("data\eigenvalues\combined\n_" + string(n) + "_absolute_all_eigenvalues_combined.csv");
count = height(combined)
bigger_tracker = 0
failure_tracker = zeros(1)
example_tracker = zeros(1)
for time = 1:1:count
    major = sort(table2array(combined(time,3:n+2)))
    major = major(1:n-1)
    minor = sort(table2array(combined(time,n+3:2*n+1)))
    if minor(n-1) >= major(n-1)
        bigger_tracker = bigger_tracker + 1
        example_tracker = [example_tracker;time]
    end
    if not(minor(n-1) >= major(n-1))
        failure_tracker = [failure_tracker;time]
    end
end
%% Checking the derivitive we found using the eigenvalues
n = 5
combined = readtable("data\eigenvalues\a_eigen\combined\n_" + string(n) + "_absolute_all_eigenvalues_combined.csv");
count = height(combined)
negative_tracker = zeros(1:2)
for time = 1:1:count
    alpha = sort(table2array(combined(time,"alpha")))
    major = sort(table2array(combined(time,3:n+2)))
    major = major(1:n-1)
    minor = sort(table2array(combined(time,n+3:2*n+1)))
    original = sort(table2array(combined(time,2*n+2:3*n+1)))
    original = original(1:n-1)
    num_derivitive = minor(1)*minor(2)*minor(3)*minor(4)*major(1)*major(2)*major(3)*major(4)*( ( (minor(1)-1)/(minor(1) ) - (major(1)-1)/(major(1)) ) + ( (minor(2)-1)/(minor(2) ) - (major(2)-1)/(major(2)) ) + ( (minor(3)-1)/(minor(3) ) - (major(3)-1)/(major(3)) ) + ( (minor(4)-1)/(minor(4) ) - (major(4)-1)/(major(4)) ) )
    full_deriv = (num_derivintive)/(major(1)*major(2)*major(3)*major(4))^2
    if sign(num_derivitive) == -1
        disp('negative')
        negative_tracker = [negative_tracker;alpha time]
    end
end

%appears to have positive derivitive for all values of alpha 0<t<1/2



