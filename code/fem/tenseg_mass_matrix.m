function M = tenseg_mass_matrix(mass, C, lumped)
if lumped == 1
    M = 0.5 * kron(diag(diag(abs(C)' * diag(mass) * abs(C))), eye(3));
else
    M = 1/6 * kron((abs(C)' * diag(mass) * abs(C) + diag(diag(abs(C)' * diag(mass) * abs(C)))), eye(3));
end
end