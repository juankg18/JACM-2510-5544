function visualize_best(BestSol,C)
Ns = BestSol.Position;
N = reshape(Ns,3,[]);
nb = size(C,1);
H = N * C';
Cell_H = mat2cell(H,3,ones(1,nb));
A = kron(C', eye(3)) * blkdiag(Cell_H{:});
[~,~,V] = svd(A);
q = V(:,end);
if sum(q>0) < sum(q<0)
    q = -q;
end
l = sqrt(diag(H'*H));
t = l.*q;
C_b = C(t<-1e-8,:);
C_s = C(t>-1e-8,:);
tenseg_plot(N,C_b,C_s)
end
