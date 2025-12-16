function problem=generate(casenum,rep) % generate problem cases
switch casenum   
    case 1 % baseline
        problem.k=10;
        problem.m=3;
        problem.n0=10;
        problem.N=10000;
        problem.batchsize=1;
        problem.mu=(problem.k:-1:1)';
        problem.sigma=10*ones(problem.k,1);
        problem.dtype=repelem("normal",problem.k,1);
    case 2 % steep means and smaller variances: easy case
        problem.k=10;
        problem.m=3;
        problem.n0=10;
        problem.N=10000;
        problem.batchsize=1;
        problem.mu=(10-(1:problem.k)').^2/9+1;
        problem.sigma=5*ones(problem.k,1);
        problem.dtype=repelem("normal",problem.k,1);
    case 3 % flat means + larger variances: difficult case
        problem.k=10;
        problem.m=3;
        problem.n0=10;
        problem.N=10000;
        problem.batchsize=1;
        problem.mu=3*sqrt(10-(1:problem.k)')+1;
        problem.sigma=20*ones(problem.k,1);
        problem.dtype=repelem("normal",problem.k,1);
    case 4 % high-confidence random case
        rng(casenum^2+rep^2+1,"twister");
        problem.k=10;
        problem.m=3;
        problem.n0=10;
        problem.N=10000;
        problem.batchsize=1;
        problem.mu=10*randn(problem.k,1);
        problem.sigma=10*rand(problem.k,1)+5;
        problem.dtype=repelem("normal",problem.k,1);
    case 5 % low-confidence random case
        rng(casenum^2+rep^2+1,"twister");
        problem.k=10;
        problem.m=3;
        problem.n0=10;
        problem.N=10000;
        problem.batchsize=1;
        problem.mu=1*randn(problem.k,1);
        problem.sigma=10*rand(problem.k,1)+5;
        problem.dtype=repelem("normal",problem.k,1);
    case 6 % large non-gaussian case
        rng(casenum^2+rep^2+1,"twister");
        problem.k=100;
        problem.m=30;
        problem.n0=50;
        problem.N=50000;
        problem.batchsize=5;
        problem.mu=(problem.k:-1:1)';
        problem.sigma=50*ones(problem.k,1);
        dlist=["t",'uniform','gamma','poisson'];
        temp_idx=randi(4,problem.k,1);
        problem.dtype=dlist(temp_idx)';
end