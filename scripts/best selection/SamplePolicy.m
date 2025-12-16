function istar=SamplePolicy(F,sigma2hat,n,policy) % implement different sampling policies
    switch policy
        case "EA" % equal allocation
            istar=find(n==min(n),1);
        case "Oracle" % need to install cvx and mosek
            ratio=F;
            ratio_now=n./sum(n);
            ratio_gap=ratio-ratio_now;
            istar=find(ratio_gap==max(ratio_gap),1);
        case 'OCBA' % Chen et al. (2000)
            wNow=n/sum(n);
            [bestF,best]=max(F);
            wNew=sigma2hat./((F-bestF).^2);
            wNew(best,1)=0;
            wNew(best,1)=sqrt(sum(wNew.^2./sigma2hat)*sigma2hat(best));
            wNew=wNew/sum(wNew);
            wGap=wNew-wNow;
            istar=find(wGap==max(wGap));
        case 'KG' % Frazier et al. (2008)
            [bestF,best]=maxk(F,2);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=-abs(F-bestF(1))./sigmatemp;
            zeta(best(1))=-abs(bestF(1)-bestF(2))./sigmatemp(best(1));
            [~,istar]=max(InformationKG(zeta,sigmatemp));
        case 'EVI' % Chick et al. (2010)
            [bestF,best]=maxk(F,2);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=-abs(F-bestF(1))./sigmatemp;
            zeta(best(1))=-abs(bestF(1)-bestF(2))./sigmatemp(best(1));
            [~,istar]=max(InformationEVI(zeta,sigmatemp,n));
        case 'AOAP' % Peng et al. (2018)
            [k,~]=size(n);
            [bestF,best]=max(F);
            APCS=zeros(k,1);
            for i=1:k
                tempn=n;tempn(i,1)=n(i,1)+1;
                postvar=sigma2hat./tempn;
                dist2=(bestF-F).^2./(postvar+postvar(best));
                dist2(best)=Inf;
                APCS(i,1)=min(dist2);
            end
            istar=find(APCS==max(APCS),1);
        case 'BOLD' % Chen and Ryzhov (2023)
            [bestF,best]=max(F);
            balance1=n.^2./sigma2hat;
            if balance1(best)*2<sum(balance1)
                istar=best;
            else
                postvar=sigma2hat./n;
                dist2=(bestF-F).^2./(postvar+postvar(best));
                dist2(best)=Inf;
                [~,istar]=min(dist2);
            end
        case 'POC' % Li et al. (2025)
            [bestF,best]=maxk(F,2);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=-abs(F-bestF(1))./sigmatemp;
            zeta(best(1))=-abs(bestF(1)-bestF(2))./sigmatemp(best(1));
            [~,istar]=max(zeta);
    end
end


function y=InformationKG(zeta,sigma)
    temp=log(sigma)+log(0.5*zeta.*erfc(vpa(-zeta./sqrt(2)))+1/sqrt(2*pi)*exp(vpa(-zeta.^2/2)));
    y=double(temp);
end

function y=InformationEVI(zeta,sigma,n)
    temp=log(sigma)+log((n-1+zeta.^2)./(n-2).*tpdf(vpa(zeta),n-1)+zeta.*tcdf(zeta,n-1)); % warning: tcdf has very low precision
    y=real(double(temp));
end

% References
% 
% Chen CH, Lin J, Yucesan E, Chick SE (2000) Simulation budget allocation for further enhancing the efficiency 
% of ordinal optimization. Discrete Event Dynam. Systems 10:251–270.
% 
% Frazier PI, Powell WB, Dayanik S (2008) A knowledge-gradient policy for sequential information collection.
% SIAM J. Control Optim. 47(5):2410–2439.
% 
% Chick SE, Branke J, Schmidt C (2010) Sequential sampling to myopically maximize the expected value of
% information. INFORMS J. Comput. 22(1):71–80.
% 
% Peng Y, Chong EK, Chen CH, Fu MC (2018) Ranking and selection as stochastic control. IEEE Trans.
% Automatic Control 63(8):2359–2373.
% 
% Chen Y, Ryzhov IO (2023) Balancing optimal large deviations in sequential selection. Management Sci.
% 69(6):3457–3473.
%
% Li D, Yucesan E, Chen CH (2025) Probability of Improvement Criterion Revisited: 
% Applications to Generalized Ranking and Selection. Working paper
