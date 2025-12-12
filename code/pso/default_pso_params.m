function params = default_pso_params(nVar,VarMin,VarMax)
params.MaxIt = 200;
params.nPop = 200;
params.w = 1;
params.wdamp = 0.99;
params.c1 = 1.5;
params.c2 = 2.0;
params.VelMax = 0.1*(VarMax-VarMin);
params.VelMin = -params.VelMax;
params.tol = 1e-5;
end
