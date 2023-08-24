## Ctrl + R to comment out; Ctrl+Shift+R to uncomment

##This is the plot for sqrt of z:
##r = (0:1:15)';                           % create a matrix of complex inputs
##theta = pi*(-2:0.05:2);
##z = r*exp(1i*theta);
##%w = z.^(1/2)  ;                          % calculate the complex outputs
##w = sqrt(r)*exp(1i*theta/2);
##
##figure();
##
##g = surf(real(z),imag(z),real(w),imag(w))    % visualize the complex function using surf
##set(g,'edgecolor','none')
##xlabel('Real(z)')
##ylabel('Imag(z)')
##zlabel('Real(u)')
##cb = colorbar;
##
##colormap jet;                            % gradient from blue to red
##cb.Label.String = 'Imag(v)';



## Log(z) plot:
r = (0:1:15)';                           % create a matrix of complex inputs
theta = pi*(-2:0.05:4);
z = r*exp(1i*theta);
v = log(r) + (1i*theta)

figure();

h = surf(real(z),imag(z),imag(v),real(v))    % visualize the complex function using surf
set(h,'edgecolor','none')
xlabel('Real(z)')
ylabel('Imag(z)')
zlabel('Real(u)')
cb = colorbar;

colormap jet;                            % gradient from blue to red
cb.Label.String = 'Real(v)';



