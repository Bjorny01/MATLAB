% Task 6 - MA filtering
N = 20; % Signal length
n = 0:N-1; % Time variable
v01 = 0.1; % Normalized frequency
v02 = 0.4; 
x1 = sin(2*pi*v01*n);
x2 = sin(2*pi*v02*n);

b0 = 0.5;
b1 = 0.5;

N = length(x1); % Length of input signal
y1 = zeros(size(x1)); % Allocate space for outut

y1(1) = b0*x1(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    y1(n) = b0*x1(n) + b1*x1(n-1);
end;

N = length(x2);
y2 = zeros(size(x2)); % Allocate space for outut

y2(1) = b0*x2(1); % First sample, assuming x(0) = 0
for n=2:N % Remaining samples
    y2(n) = b0*x2(n) + b1*x2(n-1);
end;

subplot(1,2,1)
stem(x1, 'g');
axis([-1 20 -1.5 1.5]);
hold on

stem(x2, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x1[n] and x2[n]');
legend('= insingal x1[n]','= insignal x2[n]')

subplot(1,2,2)
stem(y1, 'g');
axis([-1 20 -1.5 1.5]);
hold on

stem(y2, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('y1[n] and y2[n]');
legend('= utgsingal y1[n]','= utsignal y2[n]')


