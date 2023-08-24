function xp=tor(t,x)
xp=zeros(4,1);
xp(1)=x(2);
xp(2)=-(2+cos(x(1)))*sin(x(1))*x(4)^2;
xp(3)=x(4);
xp(4)=2*(sin(x(1))/(2+cos(x(1))))*x(2)*x(4);