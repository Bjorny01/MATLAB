format long

Sh = [];

func = @(x) (9+5*(cos(0.4.*x)).^2).*(5*exp(-0.5.*x)+2*exp(0.15.*x)); 

n = [8,16,32,64];

for i = 1:4
    T = 9;
    t = 3;
    h = (T-t)/n(i);
    x = t:h:T;
 
    f = func(x);

    Sh(i) = h/3*(f(1)+4*sum(f(2:2:n(i)))+2*sum(f(3:2:n(i)-1))+f(n(i)+1));
    
end

disp(['massan av staven är: ', num2str(Sh(1)), ' när n = ', num2str(n(1))])
disp(['massan av staven är: ', num2str(Sh(2)), ' när n = ', num2str(n(2))])

%Av resultatet ser vi att en decimal är tillförlitligt
fprintf('\n') 

%Beräknar Eh, där M är en mycket nogrann lösning med Simpsons metod, här
%med 512 intervall
n = 512;
T = 9;
t = 3;
h = (T-t)/n;

x = t:h:T;
f = func(x);

M = h/3*(f(1)+4*sum(f(2:2:n))+2*sum(f(3:2:n-1))+f(n+1));

n = [8,16,32,64];
Eh = [];
h = [];
for i = 1:4
    T = 9;
    t = 3;
    h(i) = (T-t)/n(i);
    Eh(i) = abs((M)-Sh(i));
    disp(['Approximationsfelet då h = ',num2str(h(i)),' är: ',num2str(Eh(i))])
end

fprintf('\n') 

loglog(h,Eh)
hold on
xlabel('h');ylabel('Eh');

kvot=(Sh(2:end-1)-Sh(1:end-2))./(Sh(3:end)-Sh(2:end-1));
disp(['kvoter som fås när steglängden halveras är: ' ,num2str(kvot(1)), ' och ', num2str(kvot(2))])

%Av resultatet för kvoten ser vi att noggranhetsordningen är 4. Då vi halverar steglängden så konvergerar kvoten mot 16, vilket är 2^