% Task 1 - MA filtering

load handel; %gong, chirp, train, splat, laughter
x = y;
%soundsc(x,Fs);

b0 = 0.5;
b1 = 0.5;

N = length(x); % Length of input signal
y = zeros(size(x)); % Allocate space for outut

y(1) = b0*x(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    y(n) = b0*x(n) + b1*x(n-1);
end;

soundsc(y,Fs);

TotalTime = length(y)./Fs;
t = 0:TotalTime/(length(y)):TotalTime-TotalTime/length(y);
plot(t,y)