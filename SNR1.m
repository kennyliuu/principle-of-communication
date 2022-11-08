%File c8ce3.m
n=[4 8 12]; %wordlengths
snrtdB=0:0.1:30; %predetection snr in dB
snrt=10.^(snrtdB/10); %predetection snr
Pb=0.5*exp(-snrt/2); %bit-error probability
hold on %hold for multiple plots
for k=1:length(n)
Pw=1-(1-Pb).^n(k); %current value of Pw
a=2^(-2*n(k)); %temporary constant
snrd=1./(a+Pw*(1-a)); %postdetection snr
snrddB=10*log10(snrd); %postdetection snr in dB
plot(snrtdB,snrddB)
end
hold off %release
xlabel('Predetection SNR in dB')
ylabel('Postdetection SNR in dB')
%End of script file.