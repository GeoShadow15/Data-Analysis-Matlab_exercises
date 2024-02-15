
for i = 1:11

N = 1000;
RandomNumbers = 1 + rand(N,1);
%disp(RandomNumbers);

    for j = 1 : N
        r2(j) = 1 / RandomNumbers(j); 
    end
%disp(r2);


MedianOfR2(i) = (sum(r2)/N);
MedianOfRandomNumbers(i) = (sum(RandomNumbers)/N);
t(i) = 1 / MedianOfRandomNumbers(i);

N = N + 100;
end

disp(MedianOfR2);
disp(t);
disp(MedianOfRandomNumbers);


NumberOfN = [1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000];
disp(MedianOfR2);

figure('Name', 'Results 1 and 2');
plot(NumberOfN,MedianOfR2, 'ob', NumberOfN, t, 'or');
title ('E[1/X] and 1/E[X] for various N');
xlabel('Number of N');
ylabel('E[1/X] with blue and 1/E[X] with red');
  
hold on;




