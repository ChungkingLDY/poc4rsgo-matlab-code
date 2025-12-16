function [PCS,EOC] = Experiment(casenum,policy,R)
    problem=generate(casenum,0);
    correct=zeros(1,problem.N);
    oppcost=zeros(1,problem.N);
    
    for rep=1:R % independent macro replications and parallel computing via HPC is suggested
        problem=generate(casenum,rep);
        rng(rep^2+2*rep+1,'twister');
        k=problem.k;
        m=problem.m;
        l=problem.l;
        n0=problem.n0;
        N=problem.N;
        batchsize=problem.batchsize;
        mu=problem.mu;
        sigma=problem.sigma;
        dtype=problem.dtype;
        [~, topindex] = maxk(mu,m);
        [~, bottomindex] = mink(mu,l);
        if strcmp(policy, 'Oracle')
            [ratio,~,G]=BestRatio(mu,sigma.^2/batchsize,m,l);
            if isnan(G)
                ratio=ones(problem.k,1)/problem.k;
            end
        end
        correct_temp=zeros(1,N);
        oppcost_temp=zeros(1,N);
        
        simulation=cell(k,1);
        F=zeros(k,1);
        sigma2hat=zeros(k,1);
        n=n0*ones(k,1);
        for i=1:k
            simulation{i,1}=simulate(n0,batchsize,dtype(i,1))*sigma(i,1)+mu(i,1);
            F(i,1)=mean(simulation{i,1});
            sigma2hat(i,1)=var(simulation{i,1});
        end
        [~, choicem]=maxk(F,m);
        [~, choicel]=mink(F,l);
        correct_temp(1,n0*k)=(sum(choicem)==sum(topindex))*(sum(choicel)==sum(bottomindex));
        oppcost_temp(1,n0*k)=sum(mu(topindex))-sum(mu(sort(choicem)))+sum(mu(sort(choicel)))-sum(mu(bottomindex));
        
        for t=n0*k+batchsize:batchsize:N
            if strcmp(policy, 'Oracle')
                istar=SamplePolicy(ratio,[],m,l,n/batchsize,policy);
            else
                istar=SamplePolicy(F,sigma2hat,m,l,n/batchsize,policy);
            end
            simulation{istar,1}=[simulation{istar,1};simulate(batchsize,batchsize,dtype(istar,1))*sigma(istar,1)+mu(istar,1)];
            n(istar,1)=n(istar,1)+batchsize;
            F(istar,1)=mean(simulation{istar,1});
            sigma2hat(istar,1)=var(simulation{istar,1});
            [~, choicem]=maxk(F,m);
            [~, choicel]=mink(F,l);
            correct_temp(1,t)=(sum(choicem)==sum(topindex))*(sum(choicel)==sum(bottomindex));
            oppcost_temp(1,t)=sum(mu(topindex))-sum(mu(sort(choicem)))+sum(mu(sort(choicel)))-sum(mu(bottomindex));
        end
        
        correct=correct+correct_temp;
        oppcost=oppcost+oppcost_temp;
    end
    
    PCS=correct/R;
    EOC=oppcost/R;
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

function [ratio,rate,G]=BestRatio(mu,sigma2,m,l) % solve for OCBA ratios
    k=size(mu,1);
    [~,topindex]=maxk(mu,m);
    [~, bottomindex] = mink(mu,l);
    middleindex=setdiff((1:k)',[topindex;bottomindex]);
    mudif2top=(mu(topindex)-mu(middleindex)').^2;
    mudif2bottom=(mu(bottomindex)-mu(middleindex)').^2;

    cvx_begin quiet
    cvx_solver mosek
    % cvx_solver SeDuMi % alternative solver if mosek is not installed
    cvx_precision high
    
    variable a(k,1)
    variable z
    dual variables lambdatop lambdabottom

    minimize(z)
    subject to
        sum(a(:))==1;
        a>=0;
        lambdatop: (repmat(sigma2(topindex,1).*inv_pos(a(topindex,1)),1,k-m-l)+repmat((sigma2(middleindex,1).*inv_pos(a(middleindex,1)))',m,1))./mudif2top<=z;
        lambdabottom: (repmat(sigma2(bottomindex,1).*inv_pos(a(bottomindex,1)),1,k-m-l)+repmat((sigma2(middleindex,1).*inv_pos(a(middleindex,1)))',l,1))./mudif2bottom<=z;
    cvx_end
    
    ratio=a;
    rate1=mudif2top./(sigma2(topindex,1).*inv_pos(a(topindex,1))+(sigma2(middleindex,1).*inv_pos(a(middleindex,1)))');
    rate2=mudif2bottom./(sigma2(bottomindex,1).*inv_pos(a(bottomindex,1))+(sigma2(middleindex,1).*inv_pos(a(middleindex,1)))');
    rate=[rate1',rate2'];
    G=1/z;
end