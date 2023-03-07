% Task 5 - MA filtering
x = [1, 1/2, zeros(1,19)];

b0 = 0.5;
b1 = 0.5;

N = length(x); % Length of input signal
y = zeros(size(x)); % Allocate space for outut

y(1) = b0*x(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    y(n) = b0*x(n) + b1*x(n-1);
end;

stem(x, 'g');
axis([-1 20 -1.5 1.5]);
hold on
stem(y, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x[n] and y[n]'); %Where x[n]=δ[n]+0.5δ[n-1] and y[n]=h[n]+0.5h[n-1]

legend('= ingsingal x[n]','= utsignal y[n]')

