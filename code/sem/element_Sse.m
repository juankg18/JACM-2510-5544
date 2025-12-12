function Sse = element_Sse(L, Nf, rhoA, w, ix)
k1 = +w*sqrt(abs(Nf)*rhoA)/Nf;
k2 = -w*sqrt(abs(Nf)*rhoA)/Nf;
e1 = exp(-ix*k1*L);
e2 = exp(-ix*k2*L);
den = (e2 - e1)^2;
if den == 0
    den = eps;
end
alpha11 = (k1^2 + k2^2)*L/den;
alpha12 = -(e2*k1^2 + e1*k2^2)*L/den;
alpha22 = (e2^2*k1^2 + e1^2*k2^2)*L/den;
beta11 = (e1^2 + e2^2)*L/den;
beta12 = -(e1 + e2)*L/den;
beta22 = 2*L/den;
Sse = zeros(6,6);
Sse(2,2) = -Nf*alpha11 - rhoA*w^2*beta11;
Sse(2,5) = -Nf*alpha12 - rhoA*w^2*beta12;
Sse(5,2) = Sse(2,5);
Sse(5,5) = -Nf*alpha22 - rhoA*w^2*beta22;
end

