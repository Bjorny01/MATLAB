N = 20; % Signal length
n = 0:N-1; % Time variable
v01 = 0.1; % Normalized frequency
v02 = 0.4; 
x1 = sin(2*pi*v01*n);
x2 = sin(2*pi*v02*n);

y1 = filter([0.1 0.2 0.1],[1 -0.9 0.3],x1);
y2 = filter([0.1 0.2 0.1],[1 -0.9 0.3],x2);

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
