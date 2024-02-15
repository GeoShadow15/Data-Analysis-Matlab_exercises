clc;
clear;
close all;

for i=1:10000
    
    RandomNumbers = rand(100,1);
    
    Y(i) =  sum(RandomNumbers)/100;
    
end

%Create the Uniform Distribution
x = [0.35:.001:0.65];
y = normpdf(x,0.5,0.03);


%Create the figure with both the Histogram and the plot
figure('Name', 'Results');
plot(x,y)


hold on;
histogram(Y, 30, 'Normalization','pdf');