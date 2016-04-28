% type format long at the beginning 
% 14.4-7 Newton's method to find square root of a number
clear; clc;
a = 3;
fx = @(x) x^2 - a;
sqrt_a = sqrt(a);

x_list = [2 1.5 1.7 6 100];     % various starting points
count = zeros(length(x_list),1);
for i=1:length(x_list)
    x = x_list(i);
    flag = true;
    while(flag)
        x = x - (x^2-a)/(2*x);
        if abs(fx(x)) < 0.000001
            flag = false;
        end
        if(count(i,1) > 100)    % when newton's method diverges, break the loop
           flag = false; 
        end
        count(i,1) = count(i,1)+1;
    end
end
count