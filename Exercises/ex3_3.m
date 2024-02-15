%Chapter 3, exercise 3

%number of mechanical systems
n = 5;
M = 1000;
lambda = 1/15;
mu = 1 / lambda;


systems = exprnd(mu, n, M);


%Calculate the confidence interval:
[h1,p1,ci1,stats1] = ttest(systems,15);
disp(ci1);

%null hypothesis h


count1 = 0;

for i = 1:1000
 
    if mu < ci1(2,i) && mu > ci1(1,i)  
    count1 = count1 + 1;
    end     
end

disp(count1); %Check that the program is working

%Calculate the percentage 

perc = (count1 / 1000) * 100;

formatSpec = 'The requested percentage is %4.1f for n = 5.\n';

fprintf(formatSpec,perc);


%3_3 b)

n = 100;
M = 1000;
lambda = 1/15;
mu = 1 / lambda;

a = 0.05;


systems = exprnd(mu,n, M);


%Calculate the confidence interval:
[h2,p2,ci2,stats2] = ttest(systems,15);


%null hypothesis h


count2 = 0;

for i = 1:1000
 
    if mu < ci2(2,i) && mu > ci2(1,i)  
    count2 = count2 + 1;
    end     
end



%Calculate the percentage 

perc2 = (count2 / 1000) * 100;

formatSpec = 'The requested percentage is %4.1f for n = 100.\n';

fprintf(formatSpec,perc2);

disp('The percentage is bigger in the second case!');

 






