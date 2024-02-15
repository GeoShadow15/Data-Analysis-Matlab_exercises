%ex3_9
clc;
clear all;
close;


%9_a_i

M1 = 100;
n1 = 10;
DataSet1 = normrnd(0,1,n1,M1);


M2 = 100;
n2 = 12;
DataSet2 = normrnd(0,1,n2,M2);

%9_b
%DataSet1 = DataSet1.^2;
%DataSet2 = DataSet2.^2;


%9_g
%DataSet1 = normrnd(0.2,1,n1,M1);
%DataSet2 = normrnd(0.2,1,n2,M2);


ci_array1 = zeros(2,100);
ci_array2 = zeros(2,100);

h = zeros (1,100);

for i = 1:100
[h(1,i),p,ci] = ttest2(DataSet1(:,i),DataSet2(:,i));
ci_array1(1,i) = ci(1);
ci_array1(2,i) = ci(2);
fprintf('The CI of the mean values differecnes for the %.15gth Data Sets is from %4.4f to %4.4f\n\n',i,ci(1),ci(2));

end

totalNumberofONES1 = 0;

for k1 = 1 : 100
totalNumberofONES1 = totalNumberofONES1 + h(1,k1);
end




%9_a_ii

ci2 = zeros (2,100);
h2 = zeros (1,100);
for j = 1 : M1

    bootstatx = bootstrp(50,@mean,DataSet1(:,j));
    bootstaty = bootstrp(50,@mean,DataSet2(:,j));
    [h2(1,j),p2,ci2(:,j)] = ttest2(bootstatx,bootstaty);
    
   
end

for l = 1 : 100 
    fprintf('The CI of the boostrap mean values differecnes for the %.15gth Data Sets is from %4.4f to %4.4f\n\n',l,ci2(1,l),ci2(2,l));
end



totalNumberofONES2 = 0;

for k2 = 1 : 100
totalNumberofONES2 = totalNumberofONES2 + h2(1,k2);
end

fprintf('\nWith the 1st method the mean values differ with a percentage of %i ',totalNumberofONES1);
fprintf('\nWith the 2nd method the mean values differ with a percentage of %i ',totalNumberofONES2);





