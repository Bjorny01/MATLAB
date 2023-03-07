format long
u = [2, 3, 4, 5, 6, 6.8];

f = @(x) 1/20*x^2+11/20*x-3/5*sin(3*x+1)+1;

for i=1:6
 x=u(i); 
 diffx = 10; iter = 0; tol = 1e-10;
 while diffx > tol && iter < 100
    iter = iter + 1;
    xnew = f(x);
    diffx = abs(xnew-x);
    x=xnew;
    disp([iter x diffx]);
 end
 xrot(i)=x;
end 
rot = [xrot(1),xrot(2),xrot(3),xrot(4),xrot(5),xrot(6)];
disp(rot)