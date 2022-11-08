% File: c5ce2.m
clf
nsym = 1000; nsamp = 50; bw = [0.4 0.6 1 2];
for k = 1:4
lambda = bw(k);
[b,a] = butter(3,2*lambda/nsamp);
l = nsym*nsamp; % Total sequence length
y = zeros(1,l-nsamp+1); % Initalize output vector
x = 2*round(rand(1,nsym))-1; % Components of x = +1 or -1
for i = 1:nsym % Loop to generate info symbols
kk = (i-1)*nsamp+1;
y(kk) = x(i);
end
datavector = conv(y,ones(1,nsamp)); % Each symbol is nsamp long
filtout = filter(b, a, datavector);
datamatrix = reshape(filtout, 4*nsamp, nsym/4);
datamatrix1 = datamatrix(:, 6:(nsym/4));
subplot(4,1,k), plot(datamatrix1, 'k'), ylabel('Amplitude'), ...
axis([0 200 -1.4 1.4]), legend(['{∖itB N} = ', num2str(lambda)])
if k == 4
xlabel('{∖itt/T} s a m p')
end
end
% End of script file.