format long
%Funktions samt Jacobimatris
F = @(x1,y1,x2,y2) ([x1^2 + 3*x1 + 1.5^2 + y1^2 - y1 + 0.5^2 - 1.5^2;
                    x2^2 - 4*x2 + 4 + y2^2 - (0.8^2);
                    x1^2 + 1.5*x1 - x1*x2 - 1.5*x2 + y1^2 - 0.5*y1 - y1*y2 + 0.5*y2;
                    x1*x2 - x1*2 - x2^2 + x2*2 + y1*y2 - y2^2]);

J = @(x1,y1,x2,y2) ([2*x1+3, 2*y1-1, 0, 0;
                    0, 0, 2*x2-4, 2*y2;
                    2*x1+1.5-x2, 2*y1-0.5-y2, -x1-1.5, -y1+0.5;
                    x2-2, y2, x1-2*x2+2, y1-2*y2]);

%Srart gissningar, vi har två, en då sträcker är på ovansidan och en på
%undersidan av cirklarna, fås genom plot av cirklarna  
u = [-1, 2, 2, 0.5]';  
%u= [-1.5, -1, 2, -1]';

%Newtons metod
tol = 1e-10; hnorm = 1; iter = 0;

while hnorm > tol && iter < 20
    iter = iter + 1;
    h = -J(u(1),u(2),u(3),u(4))\F(u(1),u(2),u(3),u(4));
    hnorm = norm(h);
    disp([iter, u(1), u(2), u(3), u(4), hnorm])
    u = u + h;
    v1 = [u(1),u(3)];
    v2 = [u(2),u(4)];
end

%Plotta cirkeln och sträcket för en av lösningarna 
fi = 0:2*pi/100:2*pi;
xa = -1.5 + 1.5*cos(fi);
ya = 0.5 + 1.5*sin(fi);
xb = 2 + 0.8*cos(fi);
yb = 0.8*sin(fi);

plot(xa,ya)
hold on
plot(xb,yb)
axis('equal')
plot(v1,v2)