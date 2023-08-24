function collatzplot(m)
% Plot length of sequence for Collatz problem
% Prepare figure
clf
set(gcf,'DoubleBuffer','on')
set(gca,'XScale','linear')
%
% Determine and plot sequence and sequence length
for N = 1:m
    seq = collatz(N);
    len = length(seq);
    line(N, len,'Marker','.','MarkerSize',2,'Color','k')
    drawnow
end