%Exercise 4.1


clc;
clear all;
close all;



%a)
h1 = 100;

h2 = [60; 54; 58; 60; 56];

e0 = 0.76;
e = zeros(5,1);


for i = 1 : 5
    e(i) = sqrt(h2(i)/h1);
end


%accuracy
s1 = std(e);

%precision 
m1 = mean(e);
%for a = 0.05 we get t4,0.975 = 2.776
pre1 = [m1 - 2.776*s1; m1 + 2.776*s1];

fprintf('--------a)--------\n\n');
fprintf('The accuracy is %f.\n\n\n', s1);
fprintf('The precision is from %f to %f.\n\n',pre1(1), pre1(2));


%b)

fprintf('--------b)--------\n\n');
new_h2 = normrnd(58,2,5,1000);


for j = 1 : 1000
        m2(j) = mean(new_h2(:,j));
        s2(j) = std(new_h2(:,j));
        
        for k = 1 : 5
        e2(k,j) = sqrt(new_h2(k,j)/h1);
        end
        
        m3(j) = mean(e2(:,j));
        s3(j) = std(e2(:,j));
        
end

for j2 = 1 : 1000
if e2(:,j2) > pre1(1) & e2(:,j2) < pre1(2)
    fprintf('The coefficient is inside the limits\n');
else fprintf('Error');

end

end


%c)

h1new = [80; 100; 90; 120; 95;];
h2new = [48; 60; 50; 75; 56;];


s4 = std(h1new);
s5 = std(h2new);


e3 = zeros(5,1);


for i1 = 1 : 5
    e3(i1,1) = sqrt(h2new(i1)/h1new(i1));
    
end

s6 = std(e3);

disp(e3);
disp(s6);














