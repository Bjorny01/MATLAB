[J,umax] = lab3robot(010203)
s = tf('s');

%For when F is P
K1 = 5.1277;
F1 = K1;

%For when F is PID
n = 2;
beta = 0.44;
td = 1.65177;
K2 = 18.0755;
gamma = 0.04;
ti = 22.5225;
F2 = K2*((ti*s+1)/(ti*s+gamma))*((td*s+1)/(beta*td*s+1))^n;

G = (0.05/s)*(38/((2*s+21)*(4*s+1)+19));

S1 = 1/(1+F1*G);
S2 = 1/(1+F2*G);

bode(S1)
figure
bode(S2)

