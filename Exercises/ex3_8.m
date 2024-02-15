%3_8

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
[h,p1,ci] = vartest(DataSet(:,i), var(DataSet(:,i)));

fprintf('The CI of the standard deviation value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,sqrt(ci(1)),sqrt(ci(2)));
ci_array1(1,i) = sqrt(ci(1));
ci_array1(2,i) = sqrt(ci(2));
end


for i = 1 : M

ci2 = bootci(10,@var,DataSet(:,i));

fprintf('The Bootstrap CI of standard deviation value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,sqrt(ci2(1)),sqrt(ci2(2)));
ci_array2(1,i) = sqrt(ci2(1));
ci_array2(2,i) = sqrt(ci2(2));

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
[h,p1,ci3] = vartest(DataSet2(:,i), var(DataSet2(:,i)));

fprintf('The CI of the standard deviation value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,sqrt(ci3(1)),sqrt(ci3(2)));
ci_array3(1,i) = sqrt(ci3(1));
ci_array3(2,i) = sqrt(ci3(2));
end


for i = 1 : M

ci4 = bootci(10,@mean,DataSet2(:,i));

fprintf('The Bootstrap CI of the standard deviation value for the %.15gth Data Set is from %4.4f to %4.4f\n\n',i,sqrt(ci4(1)),sqrt(ci4(2)));
ci_array4(1,i) = sqrt(ci4(1));
ci_array4(2,i) = sqrt(ci4(2));

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