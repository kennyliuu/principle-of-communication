%File: c4ce5.m
clear all; %be safe
N = 20000; %FFT size
N_samp = 200; %200 samples per period
f = 1; %frequency
beta = 0.7; %modulation index
period = N/N_samp; %sample period (Ts)
Max_width = beta*N/N_samp; %maximum width
y = zeros(1,N); %initialize
for n=1:N_samp
x = sin(2*pi*f*(n-1)/N_samp);
width = (period/2)+round((Max_width/2)*x);
for k=1:Max_width
nn = (n-1)*period+k;
if k<width
y(nn) = 1; %pulse amplitude
end
end
end
ymm = y-mean(y); %remove mean
z = (1/N)*fft(ymm,N); %compute FFT
subplot(211)
stem(0:999,abs(z(1:1000)),'.k')
xlabel('Frequency - Hz.')
ylabel('Amplitude')
subplot(212)
stem(180:220,abs(z(181:221)),'.k')
xlabel('Frequency - Hz.')
ylabel('Amplitude')
%End of script ﬁle.