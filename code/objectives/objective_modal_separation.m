function f = objective_modal_separation(Nn,C_bb,data)
N = reshape(Nn,3,[]);
C = tenseg_ind2C(C_bb,N);
[SelfStresses,q] = qcomNCF(N,C,data(1));
if check_stabilidad_tensegridad_sym(C,N,q) && sum(SelfStresses<-1e-10)==6 && sum(SelfStresses(1:6)<-1e-10)==6
    rhoarea(SelfStresses>0) = data(6)*data(7);
    rhoarea(SelfStresses<0) = data(4)*data(5);
    [freqs,~,~] = SEM_vibration_generalAt(N,C,SelfStresses,rhoarea,data(8));
    k = 5;
    k = min(k,length(freqs));
    w = sort(freqs(1:k));
    d = diff(w);
    f = -min(d);
else
    f = 1e10;
end
end
