function [tVec, yVec] = RK4(bgd, slutT, nsteg)
F = @(U) [U(2); (-1/3)*U(2) - 6.54*sin(U(1))];

t = 0; h = (slutT-t)/nsteg;
U = bgd;

tVec = zeros(nsteg+1,1) ; yVec = zeros(nsteg+1, 2);
tVec(1) = t; yVec(1, :) = U';
for ii = 1:nsteg
    k1 = F(U);
    k2 = F(U+h/2*k1);
    k3 = F(U+h/2*k2);
    k4 = F(U+h*k3);
    U = U + h/6*(k1 + 2*k2 + 2*k3 + k4);
    t = t+h;
    tVec(ii+1) = t;
    yVec(ii+1, :) = U';
end
