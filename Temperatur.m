nvektor = [40,80,160,320];
M = [];
xlist = [];
for j = 1:length(nvektor)
    n = nvektor(j);
    h = (3-0)/(n+1);
    A = zeros(n,n);

    Q = @(x) 3000*exp(-200*(x-0.7*3)^2)+200;

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
    M = [M T];
    
    x = 0:h:3;
    xlist = [xlist x];
end
x40 = xlist(1,1:42);
T40 = M(1,1:42);
x80 = xlist(1,43:124);
T80 = M(1,43:124);
x160 = xlist(1,125:286);
T160 = M(1,125:286);
x320 = xlist(1,287:end);
T320 = M(1,287:end);  

tabell = [40 min(T40) max(T40) mean(T40);
          80 min(T80) max(T80) mean(T80);
          160 min(T160) max(T160) mean(T160);
          320 min(T320) max(T320) mean(T320)];

array2table(tabell,'VariableNames',{'n','minT','maxT','medelT'})
plot(x40,T40,'r')
hold on
plot(x80,T80,'b')
plot(x160,T160,'g')
plot(x320,T320,'r')

%Tillförlitlighet
maxfel = abs(mean(T160)-mean(T320));
disp('Vi vet att felet alltid är mindre eller likamed för n = 320:');disp(maxfel) 

