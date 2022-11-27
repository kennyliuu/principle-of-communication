%File: c4ce3.m
fs=1000; %sampling frequency
delt=1/fs; %sampling increment
t=0:delt:1-delt; %time vector
npts=length(t); %number of points
fn=(0:(npts/2))*(fs/npts); %frequency vector for plot
m1=2*cos(2*pi*50*t); %modulation signal 1
m2=2*cos(2*pi*50*t)+1*cos(2*pi*5*t); %modulation signal 2
xc1=sin(2*pi*250*t+m1); %modulated carrier 1
xc2=sin(2*pi*250*t+m2); %modulated carrier 2
asxc1=(2/npts)*abs(fft(xc1)); %amplitude spectrum 1
asxc2=(2/npts)*abs(fft(xc2)); %amplitude spectrum 2
ampspec1=asxc1(1:((npts/2)+1)); %positive frequency portion 1
ampspec2=asxc2(1:((npts/2)+1)); %positive frequency portion 2
subplot(211)
stem(fn,ampspec1,'.k');
xlabel('Frequency-Hz')
ylabel('Amplitude')
subplot(212)
stem(fn,ampspec2,'.k');
xlabel('Frequency-Hz')
ylabel('Amplitude')
subplot(111)
%End of script ﬁle.