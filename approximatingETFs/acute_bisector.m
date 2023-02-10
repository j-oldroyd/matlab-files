function [new_synthesis, new_gram] = acute_bisector( old_gram )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% k is number of vectors chosen at a time from original frame

N = size(old_gram,1);
d = rank(old_gram);
new_size = nchoosek(N,2);

index = nchoosek([1:N],2); % All subsets of {1,...,N} of size k
I = eye(N);
K = I(:,index(:,1))-I(:,index(:,2)); % Matrix used to take pairwise differences.

%F2 = zeros(d,new_size);

[U1,D1] = eig(old_gram);
F = U1*sqrt(D1);
F = real(F)'; 
F1 = F(N-d+1:N,:); % Columns of F1 are frame vectors.

%for i = 1:new_size
%    F2(:,i) = normc(sum(F1(:,index(i,:)),2));
%end % F2 is new synthesis operator.

F2 = normc(F1*K);

new_gram = F2'*F2;
new_synthesis = F2;
end

