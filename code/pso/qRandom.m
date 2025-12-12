function [q,Ns] = qRandom(C)
nb = size(C,1);
nn = size(C,2);
Ns = rand(3,nn)-0.5;
H = Ns * C';
l = sqrt(diag(H'*H));
q = randn(nb,1);
q = q ./ max(abs(q));
q = q .* (l(:));
end
