function [freqs, freqsT, lenx] = SEM_vibration_generalAt(N, C, SelfStress, rhoarea, maxfrq)
dw = 0.01;
ne = size(C,1);
for i = 1:ne
    nodo_inicio = find(C(i,:) == -1,1);
    nodo_fin    = find(C(i,:) ==  1,1);
    if ~isempty(nodo_inicio) && ~isempty(nodo_fin) && nodo_inicio > nodo_fin
        C(i,:) = -C(i,:);
    end
end
ix = 1i;
[xi, yi, zi, lenx] = compute_element_axes(N, C);
Cat = build_Ca(C);
ncalc = floor(maxfrq/dw);
w = (1:ncalc)*dw;
DSs = zeros(1,length(w));
for iw = 1:length(w)
    Ss = assemble_global_Ss(ne, size(N,2), C, Cat, xi, yi, zi, lenx, SelfStress, rhoarea, w(iw), ix);
    DSs(iw) = min(svd(Ss));
end
Wn_list = w./(2*pi);
[freqs, freqsT] = minimumVib(DSs, Wn_list);
end
