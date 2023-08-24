pkg load 'statistics' % This only works like this in Octave
mu = [0,0]; %// data
sigma = [1 0; 0 4]; %// data
x = -5:0.1:5; %// x axis
y = -5:0.1:5; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
Z = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z = reshape(Z,size(X)); %// put into same size as X, Y
colormap(jet)
h = surf(X,Y,Z) %// ... or 3D plot
set(h,'edgecolor','none')
