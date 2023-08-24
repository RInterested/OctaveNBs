% To excite a slice, we create a RF pulse with a range of frequencies, used while applying magnetic field gradient


dt = 0.002;
tmax = 1;
N = tmax/dt;
t = [-N/2:N/2-1]*dt;
% center frequency of RF
f0 = 20;

% range of frequencies to sum
df = [-5:5];

[tmat dfmat] = meshgrid(t,df+f0);
rf_all = exp(i*2*pi*dfmat.*tmat);

f = [-N/2:N/2-1]/(N*dt);

for n = 1:length(df)
    rf_n = sum(rf_all(1:n,:),1);

    % Fourier Transform used to approximate the RF pulse profile (small tip approximation)
    FT_n = fftshift(fft(rf_n));

    figure
    subplot(211)
    plot(t,real(rf_n), t,imag(rf_n), t, abs(rf_n))
    xlabel('time'), ylabel('RF'), legend('real','imaginary', 'magnitude')

    title([int2str(n) ' frequencies in RF'])
    subplot(212)
    plot(f,abs(FT_n))
    title('Frequency profile (Small-tip)')
    xlabel('frequency'), ylabel('flip'), xlim([-2*f0 2*f0])

end
