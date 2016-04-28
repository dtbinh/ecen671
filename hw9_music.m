close all; clear; clc;

given = load('music_data.mat');

% separate out given values
x = given.x;

% reshape data
M=32;
K=64;
X = reshape(x,M,K);

% covariance
R_x = X*X'/K;

% get eigenvalues and sort
[U, lambda] = eig(R_x,'vector');
[lambda i] = sort(lambda,1,'descend');
U = U(:,i');

% number of signals to look for
p = 3;

% select noise
U_n = U(:,p+1:M);

% create scan
sample = 1000;
omega_scan = pi()*[0:1/sample:1];
m = [0:M-1]';

S = exp(j*m*omega_scan);

% compute MUSIC
P = 1./sum((abs(S'*U_n).^2),2);

% plot MUSIC spectrum
pwelch(x);
figure
pmusic(x,4);
figure
plot(omega_scan/pi()*sample,P);
title('MUSIC result');
[pks,loc] = findpeaks(P,'MinPeakHeight',10)