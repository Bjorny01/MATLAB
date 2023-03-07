% Task 11 - MA filtering
load handel;
x=y;

a1 = 1.2;

N = length(x); % Length of input signal
y = zeros(size(x)); % Allocate space for outut

y(1) = x(1); % First sample, assuming y(-1) = 0
for n=2:N % Remaining samples
    y(n) = x(n) - a1*y(n-1);
end;

sound(y,Fs);
%soundsc(y,Fs);