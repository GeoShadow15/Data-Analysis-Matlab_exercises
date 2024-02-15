%Exercise 3.7

clc;
clear all;
close;

%a)
M = 100;
n = 10;
DataSet = normrnd(0,1,n,M);

ci_array1 = zeros(2,100);
ci_array2 = zeros(2,100);

for i = 1 : M
[h,p1,ci] = ttest(DataSet(:,i), mean(DataSet(:,i)));

fprintf('The CI of the mean value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,ci(1),ci(2));
ci_array1(1,i) = ci(1);
ci_array1(2,i) = ci(2);
end


for i = 1 : M

ci2 = bootci(10,@mean,DataSet(:,i));

fprintf('The Bootstrap CI of the mean value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,ci2(1),ci2(2));
ci_array2(1,i) = ci2(1);
ci_array2(2,i) = ci2(2);

end

%Lower bounds histogram
figure('Name','Lower Bounds');
bins = 10;
histogram(ci_array1(1,:),bins);
hold on;
histogram(ci_array2(1,:),bins);
hold off;

%Upper bounds histogram
figure('Name','Upper Bounds');
bins = 10;
histogram(ci_array1(2,:),bins);
hold on;
histogram(ci_array2(2,:),bins);
hold off;




%b)

DataSet2 = DataSet.^2;

ci_array3 = zeros(2,100);
ci_array4 = zeros(2,100);

for i = 1 : M
[h,p1,ci3] = ttest(DataSet2(:,i), mean(DataSet2(:,i)));

fprintf('The CI of the mean value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,ci3(1),ci3(2));
ci_array3(1,i) = ci3(1);
ci_array3(2,i) = ci3(2);
end


for i = 1 : M

ci4 = bootci(10,@mean,DataSet2(:,i));

fprintf('The Bootstrap CI of the mean value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,ci4(1),ci4(2));
ci_array4(1,i) = ci4(1);
ci_array4(2,i) = ci4(2);

end

%Lower bounds histogram
figure('Name','Lower Bounds');
bins = 10;
histogram(ci_array3(1,:),bins);
hold on;
histogram(ci_array4(1,:),bins);
hold off;

%Upper bounds histogram
figure('Name','Upper Bounds');
bins = 10;
histogram(ci_array3(2,:),bins);
hold on;
histogram(ci_array4(2,:),bins);
hold off;


