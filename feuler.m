function [tVec,yVec] = feuler(bgd, slutT, nsteg)
F = @(U) [U(2); (-1/3)*U(2) - 6.54*sin(U(1))];

t = 0; h = (slutT-t)/nsteg;
U = bgd;

tVec = zeros(nsteg+1,1) ; yVec = zeros(nsteg+1, 2);
tVec(1) = t; yVec(1, :) = U';

for ii = 1:nsteg
    U = U + h*F(U);
    t = t+h;
    tVec(ii+1) = t;
    yVec(ii+1, :) = U';
end