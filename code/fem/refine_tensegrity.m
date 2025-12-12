function [N_ref, C_ref, q_ref] = refine_tensegrity(N, C, q, k)
nNodes0 = size(N,2);
nElem = size(C,1);
newNodesTotal = nElem * (k-1);
nNodesFinal = nNodes0 + newNodesTotal;
N_ref = zeros(3, nNodesFinal);
N_ref(:,1:nNodes0) = N;
C_ref = zeros(nElem * k, nNodesFinal);
q_ref = zeros(nElem * k, 1);
nextNode = nNodes0 + 1;
elem_id = 1;
for e = 1:nElem
    i = find(C(e,:) == -1,1);
    j = find(C(e,:) ==  1,1);
    p1 = N(:, i);
    p2 = N(:, j);
    newIdx = zeros(1, k-1);
    for s = 1:k-1
        newNode = p1 + (s/k) * (p2 - p1);
        N_ref(:, nextNode) = newNode;
        newIdx(s) = nextNode;
        nextNode = nextNode + 1;
    end
    path = [i, newIdx, j];
    for s = 1:k
        row = zeros(1, nNodesFinal);
        row(path(s))   = -1;
        row(path(s+1)) =  1;
        C_ref(elem_id, :) = row;
        q_ref(elem_id) = q(e);
        elem_id = elem_id + 1;
    end
end
end

