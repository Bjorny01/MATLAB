% Task 12 - MA filtering
x = [1, zeros(1,19)];

b0 = 0.5;
b1 = 0.5;

a1=-0.8;

N = length(x); % Length of input signal
u = zeros(size(x)); % Allocate space for outut

u(1) = b0*x(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    u(n) = b0*x(n) + b1*x(n-1);
end;

y(1) = u(1); % First sample, assuming y(-1) = 0
for n=2:N % Remaining samples
    y(n) = u(n) - a1*y(n-1);
end;

stem(x, 'g');
hold on
stem(u, 'r', '+');
stem(y, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x[n], u[n] and y[n]'); %x[n]=δ[n] and y[n]=h[n]

legend('= ingsingal x[n]','=mellan signal u[n]','= utsignal y[n]')
