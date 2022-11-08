% File: c5ce1.m
%
clf
ANRZ = 1;
T = 1;
f = -40:.005:40;
SNRZ = ANRZ^2*T*(sinc(T*f)).^2;
areaNRZ = trapz(f, SNRZ) % Area of NRZ spectrum as check
ASP = 1;
SSP = ASP^2*T*(sinc(T*f/2)).^2.*(sin(pi*T*f/2)).^2;
areaSP = trapz(f, SSP) % Area of split-phase spectrum as check
AURZ = 2;
SURZc = AURZ^2*T/16*(sinc(T*f/2)).^2;
areaRZc = trapz(f, SURZc)
fdisc = -40:1:40;
SURZd = zeros(size(fdisc));
SURZd = AURZ^2/16*(sinc(fdisc/2)).^2;
areaRZ = sum(SURZd)+areaRZc % Area of unipolar return-to-zero spect as
APRZ = sqrt(2);
SPRZ = APRZ^2*T/4*(sinc(T*f/2)).^2;
areaSPRZ = trapz(f, SPRZ) % Area of polar return-to-zero spectrum as check
ABPRZ = 2;
SBPRZ = ABPRZ^2*T/4*((sinc(T*f/2)).^2).*(sin(pi*T*f)).^2;
areaBPRZ = trapz(f, SBPRZ) % Area of bipolar return-to-zero spectrum as check
subplot(5,1,1), plot(f, SNRZ), axis([-5, 5, 0, 1]), ylabel('S N R Z(f)')
subplot(5,1,2), plot(f, SSP), axis([-5, 5, 0, 1]), ylabel('S S P(f)')

subplot(5,1,3), plot(f, SURZc), axis([-5, 5, 0, 1]), ylabel('S U R Z(f)')

hold on
subplot(5,1,3), stem(fdisc, SURZd, '^'), axis([-5, 5, 0, 1])
subplot(5,1,4), plot(f, SPRZ), axis([-5, 5, 0, 1]), ylabel('S P R Z(f)')
subplot(5,1,5), plot(f, SBPRZ), axis([-5, 5, 0, 1]),
xlabel('Tf'), ylabel('S B P R Z(f)')
% End of script file