syms t a b
A = [a 1-a; 1-b b]; %our 2x2 matrix
B = [b]; %the matrix when taking out the first row and column
f = det((1-t)*eye(1) + t*B); %the numerator of the determinant expression for the diagonal values of the inverse
f_deriv = (b-1); %the derivitive of f that came from our own calculation. 
g  = det((1-t)*eye(2) + t*A); %the denominator of the determinant expression for the diagonal values of the inverse
g_deriv = simplify( ( (a-1)*(1+(1-b)*t) - (1-a)*(t*(1-b)) ) + ((1+(a-1)*t)*(b-1) - (t*(1-a))*(1-b)) ); %the derivitive of g that came from our own hand calculation of the 
initial_num_deriv = f_deriv*g - g_deriv*f; %the numerator of the the derivtive per the quotient rule
num_deriv = simplify(initial_num_deriv) %simplifying the numerator of the derivative. Only have to show this is positive to show the whole derivative is positive.

%% second derivitive
second_f = num_deriv ; %using the numerator of the above derivative as our new f
second_g = (g)^2; %using the denominator of the above derivative as our new g, has to be squared per the quotient rule.
second_f_deriv = diff(num_deriv); %using the diff function in matlab to find the derivative of f.
second_g_deriv = diff(second_g); %same as line above but for g this time
second_num_deriv = second_f_deriv*second_g - second_g_deriv*second_f %using the quotient rule again but for the second derivative.

%% Looking at the derivitive of the 2x2 to graph and show positivity
syms t a b
A = [a 1-a; 1-b b]
B = [b]
tracker = [] %used to store the values
for t = 0:.05:.5 %going through different t's from 0 to .5 in increments of .05
    for a = 0:.1:1 %going through different a's from 0 to 1 in increments of .1
        for b = 0:.1:1 %same things as a but for b this time
            total_deriv = (-(a - 1)*(- 2*b^2*t^2 + 4*b*t^2 - 2*b*t - 2*t^2 + 2*t + 1))/(a*t - 2*t + b*t + 1)^2 %calculating our first derivitive
            report = [t a b total_deriv] %storing the t, a, b, and derivitive values to look at in a csv afterwards
            tracker = [tracker;report] %putting those values from above into the tracker list to then put into a csv
        end
    end
end
writematrix(tracker, 'data/first_derivative_values/2x2_first_deravitive_values.csv') %saving the tracker as a csv file to look at the derivative values.

%% looking at the numerator of the second derivitive to show positivity
negative_tracker = []
for t = 0:.005:.5 %similar tactic as above but using it on the second derivative
    disp(append('on t = ',string(t)))
    for a = 0:.05:1
        for b = 0:.05:1
            num_deriv = (a - 1)*(a*t - 2*t + b*t + 1)^2*(2*b + 4*t - 8*b*t + 4*b^2*t - 2) + 2*(a - 1)*(a + b - 2)*(a*t - 2*t + b*t + 1)*(- 2*b^2*t^2 + 4*b*t^2 - 2*b*t - 2*t^2 + 2*t + 1) %our value for the numerator of the second derivative. 
            if sign(num_deriv) == -1 %checking if the numerator of the second derivtive is negative. If so, displays the word "negative" 
                disp('negative')
                negative_tracker = [negative_tracker; t a b num_deriv]
            end
        end
    end
end
writematrix(negative_tracker, 'data/second_derivative_values/2x2_second_derivative_negative_value.csv') %saving negative values of second derivative, did not see any
%% looking at the 3x3 Case
syms t a b c d e f
A = [a b (1-(a+b)); c d (1-(c+d)); e f (1-(e+f))]; %the 3x3 matrix and below are the results of the similar process for the 2x2.
B = [d 1-(c+d); f 1-(e+f)]; %A(i)
f_func = det((1-t)*eye(2) + t*B);
g = det((1-t)*eye(3) + t*A);
f_deriv = simplify(diff(f_func));
g_deriv = simplify(diff(g));
num_deriv = simplify(f_deriv*g - g_deriv*f_func) %using the quotient rule again
%% 3x3 Check for Positive
%there started to be too many variables and relationships that made it
%harder to check in this same fashion. Went on to try other methods than
%just looking at the derivative by itself. 
for t = 0:.05:.5
    disp(append('on t = ',string(t)))
    for a = 0:.1:1
        for b = 0:.1:1
            for c = 0:.1:1
                for d = 0:.1:1
                    for e = 0:.1:1
                        for f = 0:.1:1
                            num_deriv = (t - d*t + e*t + f*t - e*t^2 - c*f*t^2 + d*e*t^2 - 1)*(a + d - e - f + 2*t - 2*a*t - 2*d*t + 2*e*t + 2*f*t + 2*a*d*t - 2*b*c*t - 2*a*f*t + 2*b*e*t + 2*c*f*t - 2*d*e*t - 2) - (e - d + f - 2*e*t - 2*c*f*t + 2*d*e*t + 1)*(a*t - 2*t + d*t - e*t - f*t - a*t^2 - d*t^2 + e*t^2 + f*t^2 + t^2 + a*d*t^2 - b*c*t^2 - a*f*t^2 + b*e*t^2 + c*f*t^2 - d*e*t^2 + 1);
                            if sign(num_deriv) == -1
                                disp('negative')
                            end
                        end
                    end
                end
            end
        end
    end
end



