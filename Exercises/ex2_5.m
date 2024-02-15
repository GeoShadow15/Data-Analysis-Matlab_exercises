
%Calculate the propability for length less than 3.9
p = normcdf(3.9, 4, 0.1);
%Print the result
disp(p);

%Calculate appropriate length for 1% destruction 
x = norminv(0.1 ,4, 0.1);
%Print the result
disp(x);