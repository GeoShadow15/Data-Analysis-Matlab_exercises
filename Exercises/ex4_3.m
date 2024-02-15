%Exercise 4.3
clc;
clear all;
close;

%a)

%V
meanV = 77.78;
sigmaV = 0.71;

%I
meanI = 1.21;
sigmaI = 0.071;

%F
meanF = 0.283;
sigmaF = 0.017;

%Assuming that V,I and F are independent, we get:
uncertainty1 = sqrt((meanI *cos(meanF))^2*sigmaV^2+(meanV*cos(meanF))^2*sigmaI^2+ (meanV*meanI*(-sin(meanF)))^2*sigmaF^2);
fprintf('-----a-----\n\n');
disp(uncertainty1);



%b)
M = 1000;

newV = normrnd(77.78,0.71,1000,1);
newI = normrnd(1.21,0.071,1000,1);
newF = normrnd(0.283,0.017,1000,1);

for i = 1 : 1000
    
    newP(i,1) = newV(i,1) * newI(i,1) * cos(newF(i,1));

end

newPrecision = std(newP);

fprintf('-----b-----\n\n');
fprintf('We had %f uncertainty and then we got %f uncertainty\n',uncertainty1, newPrecision);

%c)

rvf = 0.5;

%
uncertainty2 = sqrt((meanI*cos(meanF))^2*sigmaV^2+(meanV*cos(meanF))^2*sigmaI^2 + (meanV*meanI*(-sin(meanF)))^2*sigmaF^2 + 2*(meanI*cos(meanF)) * (meanV*meanI*(-sin(meanF)))*rvf*sigmaV*sigmaF);
fprintf('-----c-----\n\n');
disp(uncertainty2);


M2 = 1000;

newV2 = normrnd(77.78,0.71,1000,1);
newI2 = normrnd(1.21,0.071,1000,1);
newF2 = normrnd(0.283,0.017,1000,1);

for i2 = 1 : 1000
    
    newP2(i2,1) = newV2(i2,1) * newI2(i2,1) * cos(newF2(i2,1));

end

newPrecision2 = std(newP2);

fprintf('We had %f uncertainty and then we got %f uncertainty\n',uncertainty2, newPrecision2);
    
    

