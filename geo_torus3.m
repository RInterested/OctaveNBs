[u,v]=meshgrid(linspace(0,2*pi,100),linspace(0,2*pi,100));
x=(2+cos(u)).*cos(v);
y=(2+cos(u)).*sin(v);
z=sin(u);

h=surf(x,y,z);
set(h,'edgecolor','none');
colormap('gray');
daspect([1 1 1])

tspan = linspace(pi,100*pi,1000000);
u0 = 7/6*pi;
v0 = -pi/2;
[t,X]=ode45('tor',tspan ,[u0,.1,v0,.2]);

u=X(:,1);
v=X(:,3);
x=(2+cos(u)).*cos(v);
y=(2+cos(u)).*sin(v);
z=sin(u);

%initial position:
origin = [(2+cos(u0))*cos(v0) (2+cos(u0))*sin(v0) sin(u0)];
display(['origin: ', num2str(origin)])

P=[x y z];

units = 10; % Deternines speed (smaller, faster)
packet = floor(size(P,1)/units);

  for k = 1:packet:(packet * units)
        hold on
        plot3(P(k:(k+packet-1),1), P((k:(k+packet-1)),2), P((k:(k+packet-1)),3),...
            '.-', 'MarkerSize', 3.5,'color',[0 0.4470 0.7410], 'LineWidth', 3)
        drawnow
        pause(2)
  end