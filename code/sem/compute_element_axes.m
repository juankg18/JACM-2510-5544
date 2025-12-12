function [xi, yi, zi, lenx] = compute_element_axes(N, C)
x = N(1,:)';
y = N(2,:)';
z = N(3,:)';
Cxyz = C * [x y z];
ne = size(Cxyz,1);
xi = zeros(ne,3);
lenx = zeros(1,ne);
for j = 1:ne
    lenx(j) = norm(Cxyz(j,:));
    xi(j,:) = Cxyz(j,:) ./ lenx(j);
end
spg = mean([x y z]);
xaug = [x ; spg(1)];
yaug = [y ; spg(2)];
zaug = [z ; spg(3)];
Co = C;
Co(Co==1) = 0;
Co = [Co ones(size(Co,1),1)];
Cxyz_y = Co * [xaug yaug zaug];
yi = zeros(ne,3);
for j = 1:ne
    ly = norm(Cxyz_y(j,:));
    if ly == 0
        yi(j,:) = orthonormal_vector(xi(j,:));
    else
        yi(j,:) = Cxyz_y(j,:)./ly;
    end
end
zi = cross(xi, yi, 2);
for j = 1:ne
    lz = norm(zi(j,:));
    if lz == 0
        zi(j,:) = orthonormal_vector(xi(j,:));
    else
        zi(j,:) = zi(j,:)./lz;
    end
end
yi = cross(zi, xi, 2);
end

