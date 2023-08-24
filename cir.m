function xp=cir(t,x)
xp=zeros(4,1);
xp(1)=x(2);
xp(2)=2*tan(x(3))*x(2)*x(4);
xp(3)=x(4);
xp(4)=-sin(x(3))*cos(x(3))*x(2)^2;