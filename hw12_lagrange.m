clear; close all;
 
% x = 0:0.1:20;
% y = 0:0.1:20;
% z = x-y+1;
% 
% [X,Y] = meshgrid(x,y);
% 
% Z = X-Y+1;
% 
% figure(1);
% grid on;
% surface(X,Y,Z);

L = [0 2 1;
     2 0 1;
     1 1 0];
 
eigenvalues = eig(L);