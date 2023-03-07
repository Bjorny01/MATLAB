%Bräkna och plotta med givet värde på ts, grön kurva
t = (1:104610)';
A = [ones(size(t)) t sin(2*pi/(365*24)*(t-10*24))];
c = A\Tm;
T = @(t) c(1)+c(2)*t+c(3)*sin(2*pi/(365*24)*(t-10*24));
plot(Tm,'r');
xlabel('t(timmar)'); ylabel('T(grader celsius)');
hold on
plot(T(t),'g','Linewidth',1)
%Felterm
r = A*c-Tm;
felsumma = norm(r);
disp(felsumma)

%Beräkna bästa värde för ts
tsvektor=0:4368;
t = (1:104610)';
fel=[];
for i=1:4369 
    ts = tsvektor(i);
    A = [ones(size(t)) t sin((2*pi)/(365*24)*(t-ts))];
    c = A\Tm;
    T = @(t) c(1)+c(2)*t+c(3)*sin((2*pi)/(365*24)*(t-ts));
    r = Tm-T(t);
    felsumma = norm(r);
    fel(i) = felsumma;
end
[M,I] = min(fel);
disp(I)

%Plot av mkm med ts som ger minst fel, blå kurva
t = (1:104610)';
A = [ones(size(t)) t sin(2*pi/(365*24)*(t-I))];
c = A\Tm;
T = @(t) c(1)+c(2)*t+c(3)*sin((2*pi)/(365*24)*(t-I));
%xlabel('t(timmar)'); ylabel('T(grader celsius)');
hold on
plot(T(t),'b','Linewidth',1)

%Felterm
r = Tm-T(t);
felsumma = norm(r);
disp(felsumma)




