function c = kcombinations(N, varargin)
%KCOMBINATIONS Logical array with specified number of 1s.
%   c = KCOMBINATIONS(N) returns an nchoosek(N, 2) by N logical array with 
%   columns that have precisely two 1s. c = KCOMBINATIONS(N, k) returns an
%   nchoosek(N, k) by N logical array with columns that have precisely k 
%   1s.
% 
%   Example:
%       If N = 3, k = 2, the function produces the 3x3 logical array
%
%            1   1   0
%            1   0   1
%            0   1   1
%
% Note: Adapted from Luis Mando's answer here: 
% https://stackoverflow.com/questions/22494224/how-to-fill-an-array-with-all-possible-combinations-of-0-and-1

if nargin == 1
    k = 2;
else
    k = varargin{1};
end
% Place copies of [0, 1] along different dimensions in cell array with N
% cells. 
[c{1:N}] = ndgrid(logical([0 1]));

% Concatenate arrays in c along dimension N+1; turns c into an (N+1)-D
% logical array with dimensions 2 by 2 by ... by 2 by N.
c = cat(N+1,c{N:-1:1});

% Reshape c into 2^N by N logical array. Note that NUMEL(c) must be
% divisible by the product of the specified dimensions.
c = reshape(c,[],N);

% Find rows of c with exactly k ones, then convert these rows into
% columns.
c = c(sum(c,2) == k,:);
c = fliplr(c');
end

