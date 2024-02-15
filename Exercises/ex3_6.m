%Exercise 3.6
close;
clear all;
clc;

% a)
%Create my sample 
n = 10;
r = normrnd(0,1,n,1);
mean1 = mean(r);

bootstat = bootstrp(1000,@mean,r);

figure;
histogram(bootstat,100,'EdgeColor','b');
xlabel('Mean');
hold on
plot([1 1]*mean1, ylim, '-r');   
legend('','Mean value of the 1st Sample');
hold off


%b)

se = std(r)/(sqrt(10));
boot_se = std(bootstat);

disp(se);
disp(boot_se);


%c)
new_r = exp(r);
mean2 = mean(new_r);


bootstat2 = bootstrp(1000,@mean,new_r);

figure;
histogram(bootstat2,100,'EdgeColor','b');
xlabel('Mean');
hold on
plot([1 1]*mean2, ylim, '-r');   
legend('','Mean value of the 2nd Sample');
hold off


se2 = std(new_r)/(sqrt(10));
boot_se2 = std(bootstat2);

disp(se2);
disp(boot_se2);







