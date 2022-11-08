%File: c8ce4.m
zdB = 0:50; %predetection SNR in dB
z = 10.^(zdB/10); %predetection SNR
beta = [1 5 10 20]; %modulation index vector
hold on %hold for plots
for j=1:length(beta)
bta = beta(j); %current index
a1 = exp(-(0.5/(bta+1)*z)); %temporary constant
a2 = qfunc(sqrt(z/(bta+1))); %temporary constant
num = (1.5*bta*bta)*z;
den = 1+(4*sqrt(3)*(bta+1))*(z.*a2)+(12/pi)*bta*(z.*a1);
result = num./den;
resultdB = 10*log10(result);
plot(zdB,resultdB,'k')
end
hold off
xlabel('Predetection SNR in dB')
ylabel('Postdetection SNR in dB')
%End of script file.