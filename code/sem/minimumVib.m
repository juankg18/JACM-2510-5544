function [freqs, vals] = minimumVib(DSs, Wn_list)
[sortedVals, idx] = sort(DSs);
nshow = min(6, length(sortedVals));
vals = sortedVals(1:nshow);
freqs = Wn_list(idx(1:nshow))';
vals = vals';
end
