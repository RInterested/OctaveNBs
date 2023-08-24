% Plotting the Collatz sequence fo 1000 (using the Collatz function defined
% in a separate file called collatz.m
n = 1e3;
figure(1)
plot(collatz(n), 'color', [0.1,0.1,0.9])