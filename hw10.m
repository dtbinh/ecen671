clear; close all; clc;

a1 = 1;
a2 = 0.5;
j = sqrt(-1);
z1 = 0.95*exp(j*pi/5);
z2 = 0.95*exp(-j*pi/5);
z3 = 0.92*exp(j*pi/3);
z4 = 0.92*exp(-j*pi/3);

t = 0:0.1:10;
n = length(t);

x = a1*z1.^t + a1*z2.^t + a2*z3.^t + a2*z4.^t;

% figure(1);
% plot(t,x);

p = 4;
A = zeros(n-1-p,p);
B = zeros(n-1-p,1);

for i=1:97
    for k=1:p+1
       A(i,k) = x(i+k-1); 
    end    
end

B = A(1:end,p+1);   % (8.8) on page 398. Taking the last column
A = A(1:end,1:p);

C = A\B    % coefficient

figure(2);
zplane(C);

% part b
SNR = 10;   % 10 db
pn = a1*10^(-SNR/10);   % noise power
sigma = sqrt(pn);

noise = sigma*randn(1,n);
y = x+noise;

A = zeros(n-1-p,p);
B = zeros(n-1-p,1);

for i=1:97
    for k=1:p+1
       A(i,k) = y(i+k-1); 
    end    
end

B = A(1:end,p+1);   % (8.8) on page 398. Taking the last column
A = A(1:end,1:p);

C = A\B    % coefficient

figure(3);
zplane(C);

