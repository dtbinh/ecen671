clear; close all; clc;

A = [1.04 .96; 3.99 4.01];
b = [1.1;1];

[U,S,V] = svd(A);
S(2,2) = 0;
S_inv = pinv(S);
A_inv = V*S_inv*U';
X_ls = A_inv*b;
X = A\b;