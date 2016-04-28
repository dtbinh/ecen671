clear all;
x = [2,2.5,3,5,9];

y = [-4.2,-5,2,1,24.3];

figure(1);
hold on;
scatter(x,y);
axis([0,10,-7,25]);

A = [x(1),1; x(2),1; x(3),1; x(4),1; x(5),1];

c = inv(A'*A)*A'*y.';

yr = c(1)*x+c(2);
plot(x,yr,'r');

v = [10 1 1 1 10];
w = diag(v);

cw = inv(A'*w*A)*A'*w*y';


yw = cw(1)*x+cw(2);
plot(x,yw,'g');
legend('points','lineargression','weighted linear regression');
xlabel('x');
ylabel('y');
hold off;

