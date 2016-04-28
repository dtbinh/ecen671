clear; close all; clc;

A = [1 4 5 6; 6 7 2 1];
b = [48; 30];

[U,S,V] = svd(A);
S_inv = pinv(S);
x_ls = V*S_inv*U'*b;