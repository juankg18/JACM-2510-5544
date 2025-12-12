function [BestSol,history] = pso_main(params)
nPop = params.nPop;
MaxIt = params.MaxIt;
VarSize = params.VarSize;
CostFunction = params.CostFunction;
VarMin = params.VarMin;
VarMax = params.VarMax;
VelMax = params.VelMax;
VelMin = params.VelMin;
w = params.w;
wdamp = params.wdamp;
c1 = params.c1;
c2 = params.c2;
tol = params.tol;
solInit = params.solInit;
cont = size(solInit,1)/3;
empty.Position = [];
empty.Cost = [];
empty.Velocity = [];
empty.Best.Position = [];
empty.Best.Cost = [];
particle = repmat(empty,nPop,1);
GlobalBest.Cost = inf;
rng(0);
parfor i=1:nPop
    if i<=cont
        Ns = solInit(i*3-2:i*3,:);
        Ns = normalize_nodes_all_axis2(Ns)*0.2;
    else
        check = false;
        while ~check
            [q,Ns] = qRandom(params.C);
            Ns = normalize_nodes_all_axis2(Ns)*0.2;
            check = (sum(q<0)==6) && (check_stabilidad_tensegridad_sym(params.C, Ns, q)) && sum(q(1:6)<0)==6;
        end
    end
    particle(i).Position = Ns(:)';
    particle(i).Velocity = zeros(VarSize);
    particle(i).Cost = CostFunction(particle(i).Position);
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;
end
for i=1:nPop
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end
end
BestCost = zeros(MaxIt,1);
for it=1:MaxIt
    parfor i=1:nPop
        r1 = rand(VarSize);
        r2 = rand(VarSize);
        particle(i).Velocity = w*particle(i).Velocity + c1.*r1.*(particle(i).Best.Position-particle(i).Position) + c2.*r2.*(GlobalBest.Position-particle(i).Position);
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        IsOutside = (particle(i).Position < VarMin) | (particle(i).Position > VarMax);
        particle(i).Velocity(IsOutside) = -particle(i).Velocity(IsOutside);
        Ns = reshape(particle(i).Position,3,[]);
        Ns = normalize_nodes_all_axis2(Ns)*0.2;
        particle(i).Position = Ns(:)';
        particle(i).Cost = CostFunction(particle(i).Position);
        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;
        end
    end
    for i=1:nPop
        if particle(i).Best.Cost < GlobalBest.Cost
            GlobalBest = particle(i).Best;
        end
    end
    BestCost(it) = GlobalBest.Cost;
    w = w*wdamp;
    if it>20 && abs(BestCost(it)-BestCost(it-20)) < tol
        BestCost = BestCost(1:it);
        break;
    end
end
BestSol.Position = GlobalBest.Position;
BestSol.Cost = GlobalBest.Cost;
history.BestCost = BestCost;
end
