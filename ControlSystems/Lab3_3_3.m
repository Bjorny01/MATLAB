[J,umax] = lab3robot(010203)
s = tf('s');

% 3.3.6
%Solution for F(s) calculate lead lag with 2 parameters, put lager ti if
%too much overshoot, and recalculate, when close tweek parameters by trail
%and error.

n = 2;
beta = 0.44;
td = 1.65177;
K = 18.0755;
gamma = 0.04;
ti = 22.5225;

G = (0.05/s)*(38/((2*s+21)*(4*s+1)+19));
F = K*((ti*s+1)/(ti*s+gamma))*((td*s+1)/(beta*td*s+1))^n;

GC = (F*G)/(1+F*G);

GE = 1/(1+F*G)*1/s; %1/s for step plot later, R(s) = 1/s^2

GU = F/(1+F*G);

step(GC) %prove overshoot under 5%, when r = unit step
stepinfo(GC)
figure
step(GU) %prove abs(u(t)) < umax, when r = unit step
figure
step(GE) %prove e0 < 0.05, when r = unit step
