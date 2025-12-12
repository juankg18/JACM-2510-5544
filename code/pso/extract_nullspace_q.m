function q = extract_nullspace_q(A)
[~,~,V] = svd(A);
q = V(:,end);
if sum(q>0) < sum(q<0)
    q = -q;
end
end
