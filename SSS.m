% File: c5ce4.m
nsym = 1000; nsamp = 50; % Make nsamp even
m = nsym*nsamp;
y = zeros(1,m-nsamp+1); % Initalize output vector
x =2*round(rand(1,nsym))-1; % Components of x = +1 or -1
for i = 1:nsym % Loop to generate info symbols
k = (i-1)*nsamp+1;
y(k) = x(i);
end
datavector1 = conv(y,ones(1,nsamp)); % Make symbols nsamp samples long
subplot(3,1,1), plot(datavector1(1,200:10000),'k', 'LineWidth', 1.5)
axis([0 600 -1.4 1.4]), ylabel('Amplitude')
datavector2 = [datavector1(1,m-nsamp/2+1:m) datavector1(1,1:m-nsamp/2)];
datavector3 = datavector1.*datavector2;
subplot(3,1,2), plot(datavector3(1,200:10000),'k', 'LineWidth', 1.5),
axis([0 600 -1.4 1.4]), ylabel('Amplitude')
y = fft(datavector3);
yy = abs(y)/(nsym*nsamp);
subplot(3,1,3), stem(yy(1,1:4*nsym),'k.')
xlabel('FFT Bin'), ylabel('Spectrum')
% End of script ﬁle.