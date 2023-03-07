% Task 14 - MA filtering
x = [1, zeros(1,19)];

b0 = 0.5;
b1 = 0.5;
b2=0;

a1=-0.8;
a2=0;

y = filter([b0 b1 b2],[1 a1 a2],x);

stem(x, 'g');
hold on
stem(y, 'k', '.');
axis([-1 20 -1.5 1.5]);
xlabel('n'); ylabel('x[n] and y[n]');

legend('= ingsingal x[n]','= utsignal y[n]')