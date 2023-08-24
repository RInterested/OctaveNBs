[u,v]=meshgrid(linspace(0,2*pi,100),linspace(0,2*pi,100));
x=(2+cos(u)).*cos(v);
y=(2+cos(u)).*sin(v);
z=sin(u);

h=surf(x,y,z);
set(h,'edgecolor','none');
colormap('gray');
daspect([1 1 1])

tspan = linspace(pi,100*pi,1000000);
[t,X]=ode45('tor',tspan ,[pi/6,.1,-pi/2,.2]);
u=X(:,1);
v=X(:,3);
x=(2+cos(u)).*cos(v);
y=(2+cos(u)).*sin(v);
z=sin(u);

P=[x y z];
disp(size(P))

units = 10; % Deternines speed (smaller, faster)
packet = floor(size(P,1)/units);

  for k = 1:packet:(packet * units)
        hold on
        plot3(P(k:(k+packet-1),1), P((k:(k+packet-1)),2), P((k:(k+packet-1)),3),...
            '.-', 'MarkerSize', 3.5,'color','m', 'LineWidth', 3)
        drawnow
        pause(2)
  end