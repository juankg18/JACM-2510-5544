function [omega, V_mode, D1, K, M, N_ref, C_ref, q_ref] = run_fem_tensegrity(Ns, C, q, subdiv)
tic
[N_ref, C_ref, q_ref] = refine_tensegrity(Ns, C, q, subdiv);
H2 = N_ref * C_ref';
l2 = sqrt(diag(H2' * H2))';
t2 = l2 .* q_ref';
A = 0.01 * ones(size(l2));
B = N_ref * C_ref';
l = sqrt(sum(B.^2))';
t = l2 .* q_ref' * 6000;
E = abs(t .* l ./ A);
l0 = E .* A .* l ./ (t + E .* A);
K = tenseg_stiff_matx2(C_ref, N_ref(:), E, A, l0);
mass = l2;
M = tenseg_mass_matrix(mass, C_ref, 0);
[V_mode, D1] = eig(K, M);
d1 = diag(D1);
omega = real(sqrt(d1)) / (2 * pi);
toc
end

