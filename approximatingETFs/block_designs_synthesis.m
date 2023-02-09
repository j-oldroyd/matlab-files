function [new_synthesis] = block_designs_synthesis( old_syn, block_design)
%block_designs_synthesis Creates new frames using block designs
%   Using a given block design, this function takes the given matrix
%   old_syn and uses the block design to add the columns of old_syn
%   together to produce the synthesis matrix of a new frame.

F = old_syn;
B = block_design;
b = size(B,2);
F2 = zeros(size(F,1),b);

for i = 1:b
    F2(:,i) = sum(F(:,B(:,i)),2)/norm(sum(F(:,B(:,i)),2));
end % F2 is new synthesis operator.

new_synthesis = F2;
end

