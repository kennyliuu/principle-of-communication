% ﬁle: c9ce3.m
% Computation of degradation for raised-cosine signaling
% through a channel modeled as Butterworth
%
clf
T = 1;
f3 = 0.5/T;
for np = 1:4;
beta = 0.001:.01:1;
Lb = length(beta);
for k = 1:Lb
beta0 = beta(k);
f1 = (1-beta0)/(2*T);
f2 = (1+beta0)/(2*T);
fmax = 1/T;
f = 0:.001:fmax;
I1 = find(f>=0 & f<f1);
I2 = find(f>=f1 & f<f2);
I3 = find(f>=f2 & f<=fmax);
Prc = zeros(size(f));
Prc(I1) = T;
Prc(I2) = (T/2)*(1+cos((pi*T/beta0)*(f(I2)-(1-beta0)/(2*T))));
Prc(I3) = 0;
integrand = Prc.*sqrt(1+(f./f3).^(2*np));
F(k) = (2*trapz(f, integrand)).^2;
end
FdB = 10*log10(F);
subplot(2,2,np), plot(beta, FdB), xlabel('\beta'),ylabel('Degr. in E T /N 0, dB'),legend(['H C(f): no. poles: ', num2str(np)]), axis([0 1 0 3])
if np == 1
title(['f 3/R = ', num2str(f3*T)])
end
end
% End of script ﬁle