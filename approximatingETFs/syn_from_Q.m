function [ F_mat ] = syn_from_Q( sig_mat )
%UNTITLED Summary of this function goes here
%   INPUT: 
%   gram_mat - given Gram matrix for some frame.
%   OUTPUT:
%   F_mat - corresponding synthesis operator for a frame with Gram marix
%   gram_mat.

N = size(sig_mat,1);

gram_mat = eye(N)-(1/min(eig(sig_mat)))*sig_mat;
d = rank(gram_mat);

[U,D] = eig(gram_mat);
F_mat = real((U*sqrt(D))');
F_mat = F_mat(N-d+1:N,:);
end

