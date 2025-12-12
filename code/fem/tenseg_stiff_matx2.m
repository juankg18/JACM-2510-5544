function K_t = tenseg_stiff_matx2(C, n, E, A, l0, S)
if nargin < 6
    S = eye(size(C,1));
end
N = reshape(n,3,[]);
B = N * C';
l = sqrt(sum(B.^2))';
q = E .* A .* (1 ./ l0 - 1 ./ l);
ne = size(C,1);
A1 = kron(C', eye(3)) * diag(kron(C, eye(3)) * n) * kron(eye(ne), ones(3,1));
Ke = A1 * diag(E .* A ./ (l.^3)) * A1';
Kg = kron(C' * diag(q) * C, eye(3));
K_t = Kg + (Ke + Ke')/2;
end

