% Problem 14.6-15

close all;clear all; clc;

% White Noise
f = sqrt(0.1)*randn(1000,1);

% Known Impulse Response
hTrue = [0.5 -1 -2 1 0.5]';

% Mu
m = .01;

% Initial Guess for h
h = [0.55 -1 -2 1 0.5]';

% Moving forward in time
for t = 11:numel(f)
    t
    % Desired Signal
    sum = 0;
    for l = 1:numel(hTrue)
        sum = sum + hTrue(l)*f(t-l);
    end
    d = sum;
    
    % Current Signal from hg
    sum = 0;
    for l = 1:numel(h)
        sum = sum + h(l)*f(t-l);
    end
    y = sum;
    
    % LMS Update
    fvec = f(t-numel(h)+1:t);
    hNew = h + m*fvec*abs(d-y);
    
    % Check for convergence
    if(norm(hTrue-h)<.01)
        str = ['Converged'];
        disp(str)
        break
    end
    error(t) = abs(d-y);
    h = hNew;
end
hTrue
h
plot(error)

