% Filename: c3ce1
a = 0.7;
fc = 2;
fm = 200.1;
t= 0:0.001:1;
m = cos(2*pi*fm*t);
c = cos(2*pi*fc*t);
xc = 2*(1+a*m).*c;
xc = xc+0.1*xc.*xc.*xc;
plot(m,xc)
axis([-1.2,1.2,-8,8])
grid
% End of script ﬁle.