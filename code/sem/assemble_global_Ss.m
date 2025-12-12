function Ss = assemble_global_Ss(ne, nn, C, Ca, xi, yi, zi, lenx, SelfStress, rhoarea, wval, ix)
Ss = zeros(nn*3, nn*3);
for ie = 1:ne
    Sse = element_Sse(lenx(ie), SelfStress(ie), rhoarea(ie), wval, ix);
    Tmat = element_Tmat(xi(ie,:), yi(ie,:), zi(ie,:));
    TtSset = Tmat' * Sse * Tmat;
    il1 = ie*6-5;
    il2 = ie*6;
    Ss = Ss + Ca(il1:il2,:)' * TtSset * Ca(il1:il2,:);
end
end

