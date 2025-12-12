function A = compute_equilibrium_matrix(N,C)
nb = size(C,1);
H = N * C';
Cell_H = mat2cell(H,3,ones(1,nb));
A = kron(C', eye(3)) * blkdiag(Cell_H{:});
end
