%Chapter 3, exercise 2


%Giving values to lambda, n and M   
lambda = 20;
n=3000;
M=100;

%Generating random numbers from Exponential distribution and displaying them
%just to ensure that it works....
samples = exprnd(1/lambda,n, M);
   
disp(samples);

%Calculating the mean values and displaying them mjust to ensure that it
%works...
mean_1 = mean(samples);
disp(mean_1);

%Creating the histogram of the mean values for the M samples
hist(mean_1,20);

%Calculating the mean of the different mean values and displaying it.
MeanOf_mean_1 = mean(mean_1);
disp(MeanOf_mean_1);