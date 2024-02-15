%ex3_10

clc;
clear all;
close;



M = 100;
n = 10;
DataSet = normrnd(0,1,n,M);


%a_i)

p1 = zeros(1,100);

for i = 1:M
[h1,p1(1,i)] = ttest(DataSet(:,i));
disp(p1(1,i));
end



p2 = zeros(1,100);

for i = 1:M
[h2,p2(1,i)] = ttest(DataSet(:,i),0.5);
disp(p2(1,i));
end


%a_ii)

p3 = zeros(1,100);
for j = 1 : 100

    bootstat1 = bootstrp(50,@mean,DataSet(:,j));
    [h3,p3(1,j)] = ttest(bootstat1);
    disp(p3(1,j));
end






