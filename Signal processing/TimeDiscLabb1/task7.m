% Task 7 - MA filtering
x = [1, zeros(1,19)]; %defines x[n] as δ[n]

a1 = -0.8;

N = length(x); % Length of input signal
y = zeros(size(x)); % Allocate space for outut

y(1) = x(1); % First sample, assuming y(-1) = 0
for n=2:N % Remaining samples
    y(n) = x(n) - a1*y(n-1);
end;

%Ploting
stem(x, 'g'); 
axis([-1 20 -1.5 1.5]);
hold on
stem(y, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x[n] and y[n]'); %x[n]=δ[n] and y[n]=h[n]

legend('= ingsingal x[n]','= utsignal y[n]')