% ﬁle: c2ce3
%
clf
tau = 2;
Ts = 1;
fs = 1/Ts;
ts = -15.5:Ts:15.5;
N = length(ts);
fss = 0:fs/N:fs-fs/N;
xss = exp(-abs(ts)/tau);
Xss = fft(xss);
t = -15.5:.01:15.5;
f = 0:.01:fs-fs/N;
X = 2*fs*tau./(1+(2*pi*f*tau).^2);
subplot(2,1,1), stem(ts, xss)
hold on
subplot(2,1,1), plot(t, exp(-abs(t)/tau), '--'), xlabel('t, s'), ylabel('Signal & samples'),legend('x(nT_s)', 'x(t)')
subplot(2,1,2), stem(fss, abs(Xss))
hold on
subplot(2,1,2), plot(f, X, '--'), xlabel('f, Hz'), ylabel('FFT and Fourier transform')
legend('|X_k|', '|X(f)|')
% End of script ﬁle