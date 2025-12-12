function T = element_Tmat(xi, yi, zi)
T = zeros(6,6);
T(1:3,1) = xi(:);
T(4:6,4) = xi(:);
T(1:3,2) = yi(:);
T(4:6,5) = yi(:);
T(1:3,3) = zi(:);
T(4:6,6) = zi(:);
end

