% ﬁle: c2ce2
% Frequency response for Butterworth and Chebyshev 1 ﬁlters
%
clf
filt_type = input('Enter filter_type; 1 = Butterworth; 2 = Chebyshev 1');
n_max = input('Enter maximum order of filter ');
fc = input('Enter cutoff frequency (3-dB for Butterworth) in Hz ');
if filt_type == 2
    R = input('Enter Chebyshev ﬁlter ripple in dB ');
end
W = logspace(0, 3, 1000); % Set up frequency axis; hertz assumed
for n = 1:n_max
    if filt_type == 1 % Generate num. and den. polynomials
        [num,den]=butter(n, 2*pi*fc, 's');
    elseif filt_type == 2
        [num,den]=cheby1(n, R, 2*pi*fc, 's');
    end
    H = freqs(num, den, W); % Generate complex frequency response
    [phase, mag] = cart2pol(real(H),imag(H)); % Convert H to polar coordinates
    subplot(2,1,1),semilogx(W/(2*pi),20*log10(mag));
    axis([min(W/(2*pi)) max(W/(2*pi)) -20 0]);
    if filt_type == 1
title(['Butterworth filter responses: order 1 -'
',num2str(n max),'; ...
cutoff freq ',num2str(fc),' Hz'])
    elseif filt_type == 2
title(['Chebyshev filter responses: order 1 -'
',num2str(n max),'; ...
ripple',num2str(R),' dB; cutoff freq = ',num2str(fc),'Hz'])
end
subplot(2,1,2),semilogx(W/(2*pi),180*phase/pi);
axis([min(W/(2*pi)) max(W/(2*pi)) -200 200]);
if n == 1
grid on
hold on
xlabel('f, Hz'),ylabel('phase in degrees')
end
end
% End of script ﬁle