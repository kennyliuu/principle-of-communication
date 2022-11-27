% ﬁle: c9ce1.m
% BEP for MPSK and MDPSK using Craig’s integral
clf; clear all
M_max = input('Enter max value for M (power of 2) =>');
rhobdB_max = input('Enter maximum Eb/N0 in dB =>');
rhobdB = 5:0.5:rhobdB_max;
Lrho = length(rhobdB);
for k = 1:log2(M_max)
M = 2^k;
rhob = 10.^(rhobdB/10);
rhos = k*rhob;
up_lim = pi*(1-1/M);
phi = 0:pi/1000:up_lim;
PsMPSK = zeros(size(rhobdB));
PsMDPSK = zeros(size(rhobdB));
for m = 1:Lrho
arg_exp_PSK = rhos(m)*sin(pi/M)^2./(sin(phi)).^2;
Y_PSK = exp(-arg_exp_PSK)/pi;
PsMPSK(m) = trapz(phi, Y_PSK);
arg_exp_DPSK = rhos(m)*sin(pi/M)^2./(1+cos(pi/M)*cos(phi));
Y_DPSK = exp(-arg_exp_DPSK)/pi;
PsMDPSK(m) = trapz(phi, Y_DPSK);
end
PbMPSK = PsMPSK/k;
PbMDPSK = PsMDPSK/k;
if k == 1
I = 4;
elseif k == 2
I = 5;
elseif k == 3
I = 10;
elseif k == 4
I = 19;
elseif k == 5
I = 28;
end
subplot(1,2,1), semilogy(rhobdB, PbMPSK),axis([min(rhobdB) max(rhobdB) 1e-6 1]),title('MPSK'), ylabel('{\itP b}'), xlabel('{\itE b/N} 0'),text(rhobdB(I)+.3, PbMPSK(I), ['{\itM} = ', num2str(M)]);
if k == 1
hold on
grid on
end
subplot(1,2,2), semilogy(rhobdB, PbMDPSK),axis([min(rhobdB) max(rhobdB) 1e-6 1]),title('MDPSK'), ylabel('{\itP b}'), xlabel('{\itE b/N} 0'),text(rhobdB(I+2)+.3, PbMPSK(I+2), ['{\itM} = ', num2str(M)]);
if k == 1
hold on
grid on
end
end
% End of script ﬁle