n = 1e3;

figure(1)
plot(collatz(n), 'color', [0.1,0.1,0.9])

h = zeros(1,n);
for x = 1:n
    h(x) = length(collatz(x));
end

figure(2)
b = histogram(h);
b.EdgeColor = 'white';
b.FaceColor = [0 0.2 1];
b.FaceAlpha = .6;


figure(3)
scatter(1:n, h, 1, 'Marker','.','MarkerFaceColor', ...
    [0.1,0.1,0.9],'MarkerEdgeColor',[0.1,0.1,0.9])