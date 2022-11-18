% ﬁle ch2ce1
% Plot of line spectra for half-rectiﬁed sinewave
%
clf
A = 1;
n_max = 11; % maximum harmonic plotted
n = -n_max:1:n_max;
X = zeros(size(n)); % set all lines = 0; ﬁll in nonzero ones
I = find(n == 1);
II = find(n == -1);
III = find(mod(n, 2) == 0);
X(I) = -j*A/4;
X(II) = j*A/4;
X(III) = A./(pi*(1. - n(III).^2));
[arg_X, mag_X] = cart2pol(real(X),imag(X)); % Convert to magnitude and phase
IV = find(n >= 2 & mod(n, 2) == 0);
arg_X(IV) = arg_X(IV) - 2*pi; % force phase to be odd
mag_Xss(1:n_max) = 2*mag_X(n_max+1:2*n_max);
mag_Xss(1) = mag_Xss(1)/2;
arg_Xss(1:n_max) = arg_X(n_max+1:2*n_max);
nn = 1:n_max;
subplot(2,2,1), stem(n, mag_X), ylabel('Amplitude'), xlabel('{∖itnf} 0,Hz'),axis([-10.1 10.1 0 0.5]);
subplot(2,2,2), stem(n, arg_X), xlabel('{∖itnf} 0, Hz'), ylabel('Phase,rad'),axis([-10.1 10.1 -4 4]);
subplot(2,2,3), stem(nn-1, mag_Xss), ylabel('Amplitude'),xlabel('{∖itnf} 0, Hz');
subplot(2,2,4), stem(nn-1, arg_Xss), xlabel('{∖itnf} 0, Hz'),ylabel('Phase, rad'),xlabel('{ ∖itnf} 0');
% End of script ﬁle