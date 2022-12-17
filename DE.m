%c9ce2a; diff enc(input); function to differentially encode a bit
stream vector
%
function output = diff_enc(input)
L_in = length(input);
output = [];
for k = 1:L_in
if k == 1
output(k) = not(bitxor(input(k),1));
else
output(k) = not(bitxor(input(k),output(k-1)));
end
end
output = [1 output];
% End of script ﬁle
%c9ce2b; diff dec(input); function to differentially decode a bit
stream vector
%
function output = diff_dec(input)
L in = length(input);
A = input;
B = A(2:L in);
C = A(1:L in-1);
output = not(xor(B, C));
% End of script ﬁle