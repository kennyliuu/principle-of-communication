% File: c8ce3.m
t = 1:6400;
fs = 1/32;
x = 2*cos(2*pi*fs*t);
y = 10*((cos(2*pi*fs*t+pi)).^3);
[gain,delay,px,py,rxymax,rho,snr,snrdb] = snrest(x,y);
format long e
a = ['The gain estimate is ',num2str(gain),'.'];
b = ['The delay estimate is ',num2str(delay),' samples.'];
c = ['The estimate of px is ',num2str(px),'.'];
d = ['The estimate of py is ',num2str(py),'.'];
e = ['The snr estimate is ',num2str(snr),'.'];
f = ['The snr estimate is ',num2str(snrdb),' db.'];
disp(a); disp(b); disp(c); disp(d); disp(e); disp(f)
%End of script ﬁle.