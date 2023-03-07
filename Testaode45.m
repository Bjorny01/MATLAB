F = @(t,U) [U(2); (-1/3)*U(2) - 6.54*sin(U(1))];
t0 = 0; T = 5;
[t,y] = ode45(F,[t0 T],[0.5 0]);
plot(t,y(:,1))
hold on
plot(t,y(:,2))