function f = objective_prestress_robustness(Nn,C_bb,data)
N = reshape(Nn,3,[]);
C = tenseg_ind2C(C_bb,N);
[SelfStresses,q] = qcomNCF(N,C,data(1));
if check_stabilidad_tensegridad_sym(C,N,q) && sum(SelfStresses<-1e-10)==6 && sum(SelfStresses(1:6)<-1e-10)==6
    rhoarea(SelfStresses>0) = data(6)*data(7);
    rhoarea(SelfStresses<0) = data(4)*data(5);
    try
        s = SEM_vibration_generalAs(N,C,SelfStresses,rhoarea,data(8));
        f = std(s);
    catch
        f = 1e10;
    end
else
    f = 1e10;
end
end
