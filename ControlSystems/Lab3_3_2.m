[J,umax] = lab3robot(010203)
s = tf('s');

% 3.2.2
G = (0.05/s)*(38/((2*s+21)*(4*s+1)+19)); %G(s)
K = 5.1277; %framtagen med att testa olika K tills overshoot blir precis under 5% (för att minimera Tr)
GC = (K*G)/(1+K*G);
step(GC)
S = stepinfo(GC)

%3.2.3
figure
bode(K*G)
figure
bode(GC)
%




