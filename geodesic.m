x = linspace(-1,1);
y = linspace(-1,1);
[x,y] = meshgrid(x,y);
z = x.^3 + y.^2;
S = [x;y;z];
h = surf(x,y,z);
set(h,'edgecolor','none')
colormap('gray');
hold on

f = @(x,y) x.^3 + y.^2; % The actual surface

dfdx = @(x,y) (f(x + eps, y) - f(x - eps, y))/(2 * eps); % ~ partial f wrt x
dfdy = @(x,y) (f(x, y + eps) - f(x, y - eps))/(2 * eps); % ~ partial f wrt y

N = @(x,y) [- dfdx(x,y), - dfdy(x,y), 1]; % Normal vec to surface @ any pt.

C = {'r','b','k','g','y','m','c',[.8 .2 .6],[.2,.8,.1],[0.3010 0.7450 0.9330],[0.9290 0.6940 0.1250],[0.8500 0.3250 0.0980]}; % Color scheme

for s = 1:2      % No. of lines to be plotted. Original is 1:11, but 1:2 to try out things (faster).
start = -5:5;    % Distributing the starting points of the lines.
y0 = start(s)/5; % Fitting the starting pts between -1 and 1 along y axis.
x0 = 1;          % Along x axis always starts at 1.
dx0 = 0;         % Initial differential increment along x
dy0 = 0.05;      % Initial differential increment along y
step_size = 0.000008; % Will determine the progression rate from pt to pt.
eta =  step_size / sqrt(dx0^2 + dy0^2); % Normalization.
eps = 0.0001;          % Epsilon
max_num_iter = 100000; % Number of dots in each line.

x = [[x0, x0 + eta * dx0], zeros(1,max_num_iter - 2)]; % Vec of x values
y = [[y0, y0 + eta * dy0], zeros(1,max_num_iter - 2)]; % Vec of y values

for i = 2:(max_num_iter - 1)  % Creating the geodesic:
            xt = x(i);        % Values at point t of x, y and the function:
            yt = y(i);
            ft = f(xt,yt);

            xtm1 = x(i - 1);  % Values at t minus 1 (prior point) for x,y,f
            ytm1 = y(i - 1);
            ftm1 = f(xtm1,ytm1);

            xtp1delta = xt + (xt - xtm1); % Adding the prior difference forward:
            ytp1delta = yt + (yt - ytm1);
            ftp1delta = ft + (ft - ftm1);

            df = ftp1delta - f(xtp1delta,ytp1delta); % Is the surface changing? How much?
            n = N(xt,yt);                % Normal vector at point t
            gamma = df * n(3);           % Scalar x change f x z value of N

            xtp1 = xtp1delta - gamma * n(1); % Gamma to modulate incre. x & y.
            ytp1 = ytp1delta - gamma * n(2);

            x(i + 1) = xtp1;
            y(i + 1) = ytp1;
end

P = [x; y; f(x,y)]; % Compiling results into a matrix.

indices = find(abs(P(1,:)) < 1); % Avoiding lines overshooting surface.
P = P(:,indices);
indices = find(abs(P(2,:)) < 1);
P = P(:,indices);

    units = 15; % Deternines speed (smaller, faster)
    packet = floor(size(P,2)/units);
    P = P(:,1: packet * units);

  for k = 1:packet:(packet * units)
        hold on
        plot3(P(1, k:(k+packet-1)), P(2,(k:(k+packet-1))), P(3,(k:(k+packet-1))),...
            '.', 'MarkerSize', 3.5,'color',C{s})
        drawnow
  end

end
