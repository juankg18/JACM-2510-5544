function Ns = normalize_nodes_all_axis2(Ns)
minv = min(Ns,[],2);
maxv = max(Ns,[],2);
span = maxv - minv;
span(span==0)=1;
Ns = (Ns - minv) ./ span;
end
