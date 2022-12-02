% File: c7ce1.m
clear all
npts = 500000; % number of points generated
fs = 2000; % sampling frequency
f3 = 20; % 3-dB break frequency
N = 4; % ﬁlter order
Wn = f3/(fs/2); % scaled 3-dB frequency
in = randn(1,npts); % vector of noise samples
[B,A] = butter(N,Wn); % ﬁlter parameters
out=filter(B,A,in); % ﬁltered noise samples
vin=var(in); % variance of input noise samples
vout=var(out); % input noise samples
Bnexp=(vout/vin)*(fs/2); % estimated noise-equivalent bandwidth
Bntheor=(pi*f3/2/N)/sin(pi/2/N); % true noise-equivalent bandwidth
a = ['The experimental estimate of Bn is ',num2str(Bnexp),' Hz.'];
b = ['The theoretical value of Bn is ',num2str(Bntheor),' Hz.'];
disp(a)
disp(b)
% End of script ﬁle.