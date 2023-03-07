format long
[t,y] = feuler([0.5;0],5,500);
table(y);
plot(t,y(:,1))
% n är hur många ggr du vill dubbla stegen, vill under här räkna differens
% kvot och noggranhetsordning
n=6;
y5Vec = zeros(n+1,1);
for ii = 0:n
    [tvec, yvec] = feuler([0.5;0],5,(2^ii)*500);
    y5Vec(ii+1) = yvec(end,1);
end
kvotVec = zeros(n/2,1);
for jj = 1:n/2
    kvotVec(jj,1) = (y5Vec(jj)-y5Vec(jj+1))/(y5Vec(jj+1)-y5Vec(jj+2));
    kvotVec(jj,2) = log10(kvotVec(jj,1))/log10(2);
end
array2table(kvotVec,'VariableNames',{'Differens kvot','Noggranhetsordning'})    

%Vi ser att nogrannhetsordningen konvergerar mot 1
    
    