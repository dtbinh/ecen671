clear all;

A = [2 5 9;
    1 4 7;
    3 2 1];
b = [1 2 3]';

[L,U,P] = lu(A);
c = P*b;
y = zeros(length(b),1);
for(j=1:length(b))
    d = 0;
    for(i=1:j-1)
        d = d + L(j,i)*y(i);
    end
    y(j) = c(j)-d;
end
x = zeros(length(b),1);
j = length(b);
while j>=1
    sum2 = 0;
    for(k=j+1:length(b))
        sum2 = sum2 + U(j,k)*x(k);
    end
    x(j) = 1/U(j,j)*(y(j) - sum2);
    j = j-1;
end

xtest = A\b
x