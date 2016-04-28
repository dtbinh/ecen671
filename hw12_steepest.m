% 671 Homework 12 Problem 5

close all;clear all;clc

% Set up contour plot
R = [105 95;
    95 105];
b = [200;200];

x1 = -10:0.1:10;
x2 = -10:0.1:10;

for i = 1:numel(x1)
    for j = 1:numel(x2)
       x = [x1(i);x2(j)];
       Z(i,j) = x'*R*x - 2*b'*x;
    end
end

[X,Y] = meshgrid(x1,x2);

contour(X,Y,Z)
hold on

% Prepare function
syms x_sym y_sym
f = [x_sym y_sym] * R * [x_sym;y_sym] - 2*b'*[x_sym;y_sym]
grad_f = gradient(f)

% First step size
x = [1;-6]
a = .002;

xList = x;

i = 1;
while(true)
   grad = double(subs(grad_f, {x_sym, y_sym}, {x(1), x(2)}));
   xNew = x - a*grad; 
   if (norm(xNew-x)<.001) || i>100
       break
   end
   x = xNew;
   xList = [xList x];
   i = i+1;
end

plot(xList(1,:),xList(2,:),'Marker','*')
title('Alpha = .002')
hold off

% Second step size
x = [1;-6]
a = .006;

xList = x;

i = 1;
while(true)
   grad = double(subs(grad_f, {x_sym, y_sym}, {x(1), x(2)}));
   xNew = x - a*grad; 
   if (norm(xNew-x)<.001) || i>100
       break
   end
   x = xNew;
   xList = [xList x];
   i = i+1;
end

figure
contour(X,Y,Z)
hold on

plot(xList(1,:),xList(2,:),'Marker','*')
title('Alpha = .006')
xlim([-10 10])
ylim([-10 10])
hold off