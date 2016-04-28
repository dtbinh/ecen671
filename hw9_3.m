clear; close all;
R = [2.3077 1.5385; 1.5385 9.6923];     % covariance matrix
mu = [0 0];
n = 200;

A = mvnrnd(mu,R,n);     % zero mean Gaussian with covariance matrix R

figure(1); hold on;
plot(A(:,1),A(:,2),'+');

S = zeros(2,2);
for i=1:n
    S = S+A(i,:)'*A(i,:);
end
S = S/(n-1);    % estimated covariance matrix using sample covariance matrix equation

[V, D] = eig(S);

x = 0; y = 0;

quiver(x,y,V(1,2)*sqrt(D(2,2)),V(2,2)*sqrt(D(2,2)));
quiver(x,y,V(1,1)*sqrt(D(1,1)),V(2,1)*sqrt(D(1,1)));
xlim([-7 7]);
ylim([-7 7]);
axis equal;

P = [V(1,2); V(2,2)];   % first principal component vector
alpha = A*P;

plot(ones(200,1)*(P(1)).*alpha,ones(200,1)*(P(2)).*alpha,'.');

