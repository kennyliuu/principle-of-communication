% ﬁle: c9ce4.m
% Bit error probabilities for binary BPSK, CFSK, DPSK, NFSK in Rayleigh fading
% compared with same in nonfading
%
clf
mod_type = input('Enter mod. type: 1=BPSK, 2=DPSK, 3==CFSK, 4==NFSK: ');
z_dB = 0:.3:30;
z = 10.^(z_dB/10);
if mod_type == 1
P_E_nf = qfn(sqrt(2*z));
P_E_f = 0.5*(1-sqrt(z./(1+z)));
elseif mod_type == 2
P_E_nf = 0.5*exp(-z);
P_E_f = 0.5./(1+z);
elseif mod_type == 3
P_E_nf = qfn(sqrt(z));
P_E_f = 0.5*(1-sqrt(z./(2+z)));
elseif mod_type == 4
P_E_nf = 0.5*exp(-z/2);
P_E_f = 1./(2+z);
end
semilogy(z_dB,P_E_nf,'-'),axis([0 30 10^(-6) 1]),xlabel('E b/N 0,dB'),ylabel('P_E');
hold on
grid
semilogy(z_dB,P_E_f,'--')
if mod_type == 1
title('BPSK')
elseif mod_type == 2
title('DPSK')
elseif mod_type == 3
title('Coherent BFSK')
elseif mod_type == 4
title('Noncoherent BFSK')
end
%legend('No fading','Rayleigh Fading',1)
%
% This function computes the Gaussian Q-function
%
function Q=qfn(x)
Q = 0.5*erfc(x/sqrt(2));
end
% End of script ﬁle