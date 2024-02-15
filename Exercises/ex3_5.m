%Exercise 3.5

clc;
clear all;
close;

T = readtable('eruption.dat.txt');
A = table2array(T);

WaitingTime1989 = A(1:end,1);

duration1989 = A(1:end,2);

WaitingTime2006 = A(1:end,3);


%a)
x = length(WaitingTime1989);

%Calculate the variance of each observation 
v1 = var(WaitingTime1989);
v2 = var(duration1989);
v3 = var(WaitingTime2006);


%Calculate the confidence interval 
[h1,p1,ci1] = vartest(WaitingTime1989,v1);
disp(sqrt(ci1));

[h2,p2,ci2] = vartest(duration1989,v2);
disp(sqrt(ci2));

[h3,p3,ci3] = vartest(WaitingTime2006,v3);
disp(sqrt(ci3));

givenWaitingTime1 = 10;
givenDuration1 = 1;


if givenWaitingTime1 <=sqrt(ci1(2)) && givenWaitingTime1 >= sqrt(ci1(1))
    disp('10 minutes belongs to the confidence interval of standard deviation of 1989 waiting time.' );
else
    disp('10 minutes doesnt belong to the confidence interval of standard deviation of 1989 waiting time.');    
end


if givenDuration1 <=sqrt(ci2(2)) && givenDuration1 >= sqrt(ci2(1))
    disp('The 1 minute duration belongs to the confidence interval of standard deviation.' );
else
    disp('The 1 minute duration doesnt belong to the confidence interval of standard deviation.');    
end


if givenWaitingTime1 <=sqrt(ci3(2)) && givenWaitingTime1 >= sqrt(ci3(1))
    disp('10 minutes belongs to the confidence interval of standard deviation of 2006 waiting time.' );
else
    disp('10 minutes doesnt belong to the confidence interval of standard deviation of 2006 waiting time.');    
end



%b)

%Calculate the mean values
mean1 = mean(WaitingTime1989);
mean2 = mean(duration1989);
mean3 = mean(WaitingTime2006);

%Calculate the confidence interval
[h4,p4,ci4] = ttest(WaitingTime1989,mean1);
[h5,p5,ci5] = ttest(duration1989,mean2);
[h6,p6,ci6] = ttest(WaitingTime2006,mean3);

%Print the results
fprintf('\nThe confidence interval of the mean value of 1989 waiting time is from %4.4f to %4.4f \n',ci4(1),ci4(2));
fprintf('\nThe confidence interval of the mean value of 1989 duration is from %4.4f to %4.4f \n',ci5(1),ci5(2));
fprintf('\nThe confidence interval of the mean value of 2006 waiting time is from %4.4f to %4.4f \n\n',ci6(1),ci6(2));


givenWaitingTime2 = 75;
givenDuration2 = 2.5;

if givenWaitingTime2 <=ci4(2) && givenWaitingTime2 >= ci4(1)
    disp('75 minutes belongs to the confidence interval of mean value of 1989 waiting time.' );
else
    disp('75 minutes deosnt belong to the confidence interval of mean value of 1989 waiting time.');    
end

if givenDuration2 <=ci5(2) && givenDuration2 >= ci5(1)
    disp('The 2.5 minute duration belongs to the confidence interval of the mean value.' );
else
    disp('The 2.5 minute duration doesnt belong to the confidence interval of the mean value.');    
end

if givenWaitingTime2 <=ci6(2) && givenWaitingTime2 >= ci6(1)
    disp('75 minutes belongs to the confidence interval of mean value of 2006 waiting time.');
else
    disp('75 minutes doesnt belong to the confidence interval of mean value of 2006 waiting time.');    
end



%c

[h7,p7] = chi2gof(WaitingTime1989);
[h8,p8] = chi2gof(duration1989);
[h9,p9] = chi2gof(WaitingTime2006);

fprintf('\n\n\nThe p-value for 1989 waiting time is %4.20f. \n', p7);
fprintf('The p-value for 1989 duration is %4.120f. \n', p8);
fprintf('The p-value for 2006 waiting time is %4.20f. \n', p9);




              
