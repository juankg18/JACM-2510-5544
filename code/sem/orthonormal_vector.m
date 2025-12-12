function v = orthonormal_vector(a)
if abs(a(1)) < abs(a(2))
    tmp = [1 0 0];
else
    tmp = [0 1 0];
end
v = cross(a, tmp);
v = v / norm(v);
end

