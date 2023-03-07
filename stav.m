function Tmax = stav(q0,q1)
n = 320;
h = (3-0)/(n+1);
A = zeros(n,n);

Q = @(x) q0*exp(-q1*(x-0.7*3)^2)+200;

for i = 1:n
    A(i,i) = 2/h^2;
end

for i = 1:n-1
    A(i,i+1) = -1/h^2;
    A(i+1,i) = -1/h^2;
end

b = zeros(n,1);

b(1) = 1/2*Q(h)+1/h^2*290;
b(n) = 1/2*Q(n)+1/h^2*400;
for i = 2:n-1
    b(i) = 1/2*Q(i*h);
end
    
u = A\b;
T = [290 u' 400];

Tmax = max(T);
