% ﬁle: c9ce1
% Bit error probability for binary signaling;
% vector of correlation coefﬁcients allowed
%
clf
R12 = input('Enter vector of desired R 1 2 values; <= 3 values ');
A = char('-','-.',':','--');
LR = length(R12);   
z_dB = 0:.3:15;                     % Vector of desired values of Eb/N0 in dB
z = 10.^(z_dB/10);                  % Convert dB to ratios
for k = 1:LR                        % Loop for various desired values of R12
    P_E=qfunc(sqrt(z*(1-R12(k))));    % Probability of error for vector of z-values
                                    % Plot probability of error versus Eb/N0 in dB
    semilogy(z_dB,P_E,A(k,:)),axis([0 15 10^(-6) 1]),xlabel('E b/N 0,dB'),ylabel('P E');
    if k==1
        hold on; grid % Hold plot for plots for other values of R12
    end
    end
if LR == 1 % Plot legends for R12 values
legend(['R_1_2 = ',num2str(R12(1))],1)
elseif LR == 2
legend(['R_1_2 = ',num2str(R12(1))],['R_1_2 = ',num2str(R12(2))],1)
elseif LR == 3
legend(['R_1_2 = ',num2str(R12(1))],['R_1_2 = ',num2str(R12(2))],['R_1_2 = ',num2str(R12(3))],1)
end
% This function computes the Gaussian Q-function
%function Q=qfn(x)
Q = 0.5*erfc(x/sqrt(2));
% End of script ﬁle