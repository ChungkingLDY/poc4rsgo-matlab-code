function [PCS,KTD] = Experiment(casenum,policy,R)
    problem=generate(casenum,0);
    correct=zeros(1,problem.N);
    ktdistance=zeros(1,problem.N);

    for rep=1:R % independent macro replications and parallel computing via HPC is suggested
    problem=generate(casenum,rep);
    rng(rep^2+2*rep+1,'twister');
    k=problem.k;
    n0=problem.n0;
    N=problem.N;
    batchsize=problem.batchsize;
    mu=problem.mu;
    sigma=problem.sigma;
    dtype=problem.dtype;
    rankofdesign=k+1-tiedrank(mu);
    if strcmp(policy, 'Oracle')
        [ratio,~,G]=BestRatio(problem.mu,problem.sigma.^2/problem.batchsize);
        if isnan(G)
            ratio=ones(problem.k,1)/problem.k;
        end
    end
    correct_temp=zeros(1,N);
    ktdistance_temp=zeros(1,N);
    
    simulation=cell(k,1);
    F=zeros(k,1);
    sigma2hat=zeros(k,1);
    n=n0*ones(k,1);
    for i=1:k
        simulation{i,1}=simulate(n0,batchsize,dtype(i,1))*sigma(i,1)+mu(i,1);
        F(i,1)=mean(simulation{i,1});
        sigma2hat(i,1)=var(simulation{i,1});
    end
    choice=k+1-tiedrank(F);
    correct_temp(1,n0*k)=prod(choice==rankofdesign);
    ktdistance_temp(1,n0*k)=1-corr(choice,rankofdesign,'type','Kendall');
    
    for t=n0*k+batchsize:batchsize:N
        if strcmp(policy, 'Oracle')
            istar=SamplePolicy(ratio,[],n/batchsize,policy);
        else
            istar=SamplePolicy(F,sigma2hat,n/batchsize,policy);
        end
        simulation{istar,1}=[simulation{istar,1};simulate(batchsize,batchsize,dtype(istar,1))*sigma(istar,1)+mu(istar,1)];
        n(istar,1)=n(istar,1)+batchsize;
        F(istar,1)=mean(simulation{istar,1});
        sigma2hat(istar,1)=var(simulation{istar,1});
        choice=k+1-tiedrank(F);
        correct_temp(1,t)=prod(choice==rankofdesign);
        ktdistance_temp(1,t)=1-corr(choice,rankofdesign,'type','Kendall');
    end
    
    correct=correct+correct_temp;
    ktdistance=ktdistance+ktdistance_temp;
    end
    
    PCS=correct/R;
    KTD=ktdistance/R;
end


function output=simulate(nsize,batchsize,dtype) % generate standarlized sampling output
    switch dtype
        case 'normal'
            output=mean(randn(nsize/batchsize,batchsize),2);
        case 't'
            output=mean(trnd(5,nsize/batchsize,batchsize)*sqrt(3/5),2);
        case 'uniform'
            output=mean(rand(nsize/batchsize,batchsize)*2*sqrt(3)-sqrt(3),2);
        case 'gamma'
            output=mean(gamrnd(5,sqrt(1/5),nsize/batchsize,batchsize)-sqrt(5),2);
        case 'poisson'
            output=mean(poissrnd(5,nsize/batchsize,batchsize)/sqrt(5)-sqrt(5),2);
    end
end

function [ratio,rate,G]=BestRatio(mu,sigma2) % solve for OCBA ratios
    k=size(mu,1);
    [~, indextemp] = sort(mu, 'descend');
    index1=indextemp(1:k-1);
    index2=indextemp(2:k);
    mudif2=(mu(index1)-mu(index2)).^2;

    cvx_begin quiet
    cvx_solver mosek
    % cvx_solver SeDuMi % alternative solver if mosek is not installed
    cvx_precision high
    
    variable a(k,1)
    variable z
    dual variables lambda

    minimize(z)
    subject to
        sum(a(:))==1;
        a>=0;
        lambda: (sigma2(index1,1).*inv_pos(a(index1,1))+sigma2(index2,1).*inv_pos(a(index2,1)))./mudif2<=z;
    cvx_end
    
    ratio=a;
    rate=mudif2./(sigma2(index1,1).*inv_pos(a(index1,1))+sigma2(index2,1).*inv_pos(a(index2,1)));
    G=1/z;
end