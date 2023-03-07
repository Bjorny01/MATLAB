% Task 14 - MA filtering
x = [1, zeros(1,19)];

b0 = 0.5;
b1 = 0.5;

a1=-0.8;

N = length(x); % Length of input signal
v = zeros(size(x)); % Allocate space for outut

v(1) = x(1); % First sample, assuming y(-1) = 0
for n=2:N % Remaining samples
    v(n) = x(n) - a1*v(n-1);
end;

y(1) = b0*v(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    y(n) = b0*v(n) + b1*v(n-1);
end;

stem(x, 'g');
hold on
stem(v, 'r', '+');
stem(y, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x[n], v[n] and y[n]');

legend('= ingsingal x[n]','=mellan signal v[n]','= utsignal y[n]')