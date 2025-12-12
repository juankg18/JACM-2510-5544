function run_optimization()
load('CCxx.mat')
C_bb = C; %#ok<NODEF>
[consti_data,Eb,Es,sigmab,sigmas,rho_b,rho_s]=material_lib('Q345_blin','Steel_string');
Db=10e-3;
Ds=2e-3;
Ab=pi*(Db/2)^2;
As=pi*(Ds/2)^2;
k=(Es*As)/(Eb*Ab);
fBar=100;
maxfr=200;
data=[fBar k Eb Ab rho_b As rho_s maxfr];
CostFunction = @(x) objective_vibrationtr(x,C_bb,data);
[ne,nn]=size(C_bb);
nVar = nn*3;
VarSize = [1 nVar];
VarMin = -0.1;
VarMax =  0.1;
params = default_pso_params(nVar,VarMin,VarMax);
params.C = C_bb;
params.C_bb = C_bb;
params.CostFunction = CostFunction;
params.VarSize = VarSize;
params.nVar = nVar;
params.data = data;
params.nn = nn;
params.VarMin = VarMin;
params.VarMax = VarMax;
load('Iniexp.mat')
params.solInit = solInit;
[result,history] = pso_main(params);
plot_results(history)
visualize_best(result,params.C)
save('pso_result.mat','result','history')
end
