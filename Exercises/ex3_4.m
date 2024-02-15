%Chapter 3, exercise 4


%Saving my data in an array
samples = [41; 46; 47; 47; 48; 50; 50; 50; 50; 50; 50; 50;
48; 50; 50; 50; 50; 50; 50; 50; 52; 52; 53; 55;
50; 50; 50; 50; 52; 52; 53; 53; 53; 53; 53; 57;
52; 52; 53; 53; 53; 53; 53; 53; 54; 54; 55; 68];


%#3_4 a)
V1 = var(samples) %returns the variance of the elements of the array "samples" 

[h1,p,ci,stats] = vartest(samples,V1 );

%Print the confidence interval for the variance:
formatSpec = 'The confidence interval for the true variance is %4.4f - %4.4f. \n';
fprintf(formatSpec,ci(1), ci(2));

%#3_4 b)

% If 5 is the standard deviation, we have variance of:
VarOLD = 5 ^ 2;

if VarOLD < ci(2) && VarOLD > ci(1)
   result = 1; 
else  result = 0;
end

if result == 0 
    disp('The Variance doesnt belong to the confidence interval that was calculated before. So, this cant be the standard deviation');
end

if result == 1 
    disp('The Variance belongs to the confidence interval that was calculated before. So, this should be the standard deviation');
end


%#3_4 g)


[h2,p2,ci2,stats2] = ttest(samples,mean(samples));


formatSpec2 = 'The confidence interval for the mean value is %4.4f - %4.4f. \n';
fprintf(formatSpec2,ci2(1), ci2(2));


%#3_4 d)

disp('52 kV belongs to the confidence interval, so it can be the mean value of the cut-off voltage.') 
    


%#3_4 e)

[h,p3] = chi2gof(samples);
formatSpec3 = 'The p-value is %4.8f. \n';
fprintf(formatSpec3,p3);
