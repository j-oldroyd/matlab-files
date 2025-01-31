function newSynthesis = synthesisbd(F, B)
% SYNTHESISBD Syntheis matrix determined by applying block designs.
%   SYNTHESISBD(F, B) is the synthesis matrix obtained by adding together
%   columns of the matrix F corresponding to "blocks" in the block design
%   B. If F is an M-by-N matrix, then B should be a K-by-L matrix where K
%   is at most N. Each block in B (represented by columns of B) must
%   contain numbers chosen from {1, 2, ..., N} drawn without replacement,
%   or otherwise a logical vector with N entries. The new columns are then
%   normalized so that each column has length 1.
%
%   See also: KCOMBINATIONS


b = size(B,2);
F2 = zeros(size(F,1),b);

for i = 1:b
    F2(:,i) = sum(F(:,B(:,i)),2)/norm(sum(F(:,B(:,i)),2));
end % F2 is new synthesis operator.

newSynthesis = F2;
end

