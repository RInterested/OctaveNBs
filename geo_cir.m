[u,v]=meshgrid(linspace(0,2*pi,200),linspace(0,2*pi,200));
x=cos(u).*cos(v);
y=sin(u).*cos(v);
z=sin(v);
h=surf(x,y,z);
daspect([1 1 1])
set(h,'edgecolor','none')
colormap('gray');
hold on
tspan = linspace(pi,18*pi,1000000);
[~,X]=ode45('cir',tspan,[pi,.1,0,.1]);
u=X(:,1);
v=X(:,3);
x=cos(u).*cos(v);
y=sin(u).*cos(v);
z=sin(v);


P=[x y z];


units = 10; % Deternines speed (smaller, faster)
packet = floor(size(P,1)/units);

  for k = 1:packet:(packet * units)
        hold on
        plot3(P(k:(k+packet-1),1), P((k:(k+packet-1)),2), P((k:(k+packet-1)),3),...
            '.-', 'MarkerSize', 3.5,'color','r', 'LineWidth', 4)
        drawnow
        pause(1)
  end

[t,X]=ode45('cir',tspan,[pi/6,.1,pi,.1]);
u=X(:,1);
v=X(:,3);
x=cos(u).*cos(v);
y=sin(u).*cos(v);
z=sin(v);


P=[x y z];


units = 10; % Deternines speed (smaller, faster)
packet = floor(size(P,1)/units);

  for k = 1:packet:(packet * units)
        hold on
        plot3(P(k:(k+packet-1),1), P((k:(k+packet-1)),2), P((k:(k+packet-1)),3),...
            '.-', 'MarkerSize', 3.5,'color','y', 'LineWidth', 5)
        drawnow
        pause(1)
  end