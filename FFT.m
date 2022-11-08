% File: c5ce3.m
nsym = 1000; nsamp = 50; lambda = 0.7;
[b,a] = butter(3,2*lambda/nsamp);
l = nsym*nsamp; % Total sequence length
y = zeros(1,l-nsamp+1); % Initalize output vector
x =2*round(rand(1,nsym))-1; % Components of x = +1 or -1
for i = 1:nsym % Loop to generate info symbols
k = (i-1)*nsamp+1;
y(k) = x(i);
end
datavector1 = conv(y,ones(1,nsamp)); % Each symbol is nsamp long
subplot(3,1,1), plot(datavector1(1,200:799),'k', 'LineWidth', 1.5)
axis([0 600 -1.4 1.4]), ylabel('Amplitude')
filtout = filter(b,a,datavector1);
datavector2 = filtout.*filtout;
subplot(3,1,2), plot(datavector2(1,200:799),'k', 'LineWidth', 1.5)
ylabel('Amplitude')
y = fft(datavector2);
yy = abs(y)/(nsym*nsamp);
subplot(3,1,3), stem(yy(1,1:2*nsym),'k')
xlabel('FFT Bin'), ylabel('Spectrum')
% End of script file.