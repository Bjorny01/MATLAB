load handel;
x=y;
y = filter([0.1 0.2 0.1],[1 -0.9 0.3],x);

soundsc(y,Fs)
