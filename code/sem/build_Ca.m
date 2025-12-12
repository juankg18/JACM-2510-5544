function Ca = build_Ca(C)
i3 = eye(3);
m = size(C,1);
n = size(C,2);
Cat = zeros(2*m, n);
Cat(1:2:end, :) = double(C==-1);
Cat(2:2:end, :) = double(C==1);
Ca = kron(Cat, i3);
end

