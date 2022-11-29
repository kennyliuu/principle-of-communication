% ﬁle: c6ce1
% Simulation of errors in a digital communication system
%
N_sim = input('Enter number of trials ');
N = input('Bit block size for simulation ');
N_errors = input('Simulate the probability of more than errors occurring ');
PE = input('Error probability on each bit ');
count = 0;
for n = 1:N_sim
U = rand(1, N);
Error = (-sign(U-PE)+1)/2; % Error array - elements are 1 where errors occur
if sum(Error) > N_errors
count = count + 1;
end
end
P_greater = count/N_sim
% End of script ﬁle