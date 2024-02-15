%Chapter 3, exercise 1

%3_1 b)

%Giving values to lambda, n and M   
lambda2 = 20;
n=2000;
M=300;

%Generating random numbers from Poisson distribution 
samples2 = poissrnd(lambda2,n, M);
   

%Calculating the mean values 
mean_1 = mean(samples2);


%Creating the histogram of the mean values for the M samples
hist(mean_1,20);

%Calculating the mean of the different mean values and displaying it.
MeanOf_mean_1 = mean(mean_1);
disp(MeanOf_mean_1);
   


