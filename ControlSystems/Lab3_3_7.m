[J,umax] = lab3robot(010203);
s = tf('s');

A = [0 1/20 0; 0 -1/4 19/2; 0 -1/4 -21/2];
B = [0; 0; 1/2];
C = [1 0 0];

Go_ss = ss(A,B,C,0);

theta = 0.8;
w = 2.7;

p1 = -w;
p2 = -w*cos(theta) + j*w*sin(theta);
p3 = -w*cos(theta) - j*w*sin(theta);


L = place(A,B, [p1 p2 p3])
Gc0_ss = ss(A-B*L,B,C,0);
L0 = 1/dcgain(Gc0_ss)
Gc_ss = ss(A-B*L, B*L0, C, 0);
[y, t, x] = step(Gc_ss,10);
u = L0 - x*L.';

figure
plot(t,u)

stepinfo(Gc_ss)
figure
step(Gc_ss)


%{
q = 11000;

Go_ss = ss(A,B,C,0);

Q = [q 0 0; 0 0 0; 0 0 0];
%L = lqr(GIGB,Q,1,0);
wggg = 2.75;
poles = [wggg*exp(-3i*pi/4) -wggg wggg*exp(-5i*pi/4)];
L = place(A,B, poles);
Gc0_ss = ss(A-B*L,B,C,0);
L0 = 1/dcgain(Gc0_ss);
Gc_ss = ss(A-B*L, B*L0, C, 0);
[y, t, x] = step(Gc_ss,10);
u = L0 - x*L.';
figure
plot(t,u)
stepinfo(Gc_ss)
figure
step(Gc_ss)
%}

