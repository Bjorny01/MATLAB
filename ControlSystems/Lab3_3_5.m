s = tf('s');

%For when F is PID
n = 2;
beta = 0.44;
td = 1.65177;
K = 18.0755;
gamma = 0.04;
ti = 22.5225;
F = K*((ti*s+1)/(ti*s+gamma))*((td*s+1)/(beta*td*s+1))^n;

G = (0.05/s)*(38/((2*s+21)*(4*s+1)+19));

S = 1/(1+F*G); %sensitivity function

T = 1 - S; 

DeltaG1 = (s+10)/40;
DeltaG2 = (s+10)/(4*(s+0.01));

bode(T)
hold on 
bode(1/DeltaG1)

figure
bode(T)
hold on
bode(1/DeltaG2)

