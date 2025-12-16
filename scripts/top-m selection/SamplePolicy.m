function istar=SamplePolicy(F,sigma2hat,m,n,policy) % implement different sampling policies
    switch policy
        case "EA" % equal allocation
            istar=find(n==min(n),1);
        case "Oracle" % need to install cvx and mosek
            ratio=F;
            ratio_now=n./sum(n);
            ratio_gap=ratio-ratio_now;
            istar=find(ratio_gap==max(ratio_gap),1);
        case 'OCBAmPlus' % Zhang et al. (2015)
            wNow=n/sum(n);
            [~,tempindex]=maxk(F,m+1);
            wNew1=sigma2hat./((F-F(tempindex(m))).^2);
            wNew1(tempindex(m),1)=0;
            wNew1(tempindex(m),1)=sqrt(sum(wNew1.^2./sigma2hat)*sigma2hat(tempindex(m)));
            wNew1=wNew1/sum(wNew1);
            wNew2=sigma2hat./((F-F(tempindex(m+1))).^2);
            wNew2(tempindex(m+1),1)=0;
            wNew2(tempindex(m+1),1)=sqrt(sum(wNew2.^2./sigma2hat)*sigma2hat(tempindex(m+1)));
            wNew2=wNew2/sum(wNew2);
            N=sum(n)+1;
            N1=N*wNew1;
            N2=N*wNew2;
            postvar1=sigma2hat./N1;
            postvar2=sigma2hat./N2;
            dist1=-abs(F-F(tempindex(m)))./sqrt(postvar1+postvar1(tempindex(m)));dist1(tempindex(m))=-Inf;
            dist2=-abs(F-F(tempindex(m+1)))./sqrt(postvar2+postvar2(tempindex(m+1)));dist2(tempindex(m+1))=-Inf;
            APCS1=1-sum(normcdf(dist1));
            APCS2=1-sum(normcdf(dist2));
            if APCS1>APCS2
                wGap=wNew1-wNow;
            else
                wGap=wNew2-wNow;
            end
            istar=find(wGap==max(wGap),1);
        case 'OCBASS' % Gao and Chen (2016)
            [k,~]=size(n);
            [~,topindex]=maxk(F,m);
            bottomindex=setdiff((1:k)',topindex);
            postvar=sigma2hat./n;
            dist2=(F(topindex)-F(bottomindex)').^2./(postvar(topindex)+postvar(bottomindex)');
            [temp1,temp2]=ind2sub([m,k-m],find(dist2==min(dist2(:)),1));
            if randn>0.5
                istar=topindex(temp1);
            else
                istar=bottomindex(temp2);
            end
        case 'AOAPm' % Zhang et al. (2023)
            [k,~]=size(n);
            [~,topindex]=maxk(F,m);
            bottomindex=setdiff((1:k)',topindex);
            APCS=zeros(k,1);
            for i=1:k
                tempn=n;tempn(i,1)=n(i,1)+1;
                postvar=sigma2hat./tempn;
                dist2=(F(topindex)-F(bottomindex)').^2./(postvar(topindex)+postvar(bottomindex)');
                APCS(i,1)=min(dist2(:));
            end
            istar=find(APCS==max(APCS),1);
        case 'KGm' % Li et al. (2025a)
            [k,~]=size(n);
            [~,tempindex]=maxk(F,m+1);
            [~,topindex]=maxk(F,m);
            bottomindex=setdiff((1:k)',topindex);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=zeros(k,1);
            zeta(topindex)=-abs(F(topindex)-F(tempindex(m+1)))./sigmatemp(topindex);
            zeta(bottomindex)=-abs(F(bottomindex)-F(tempindex(m)))./sigmatemp(bottomindex);
            [~,istar]=max(InformationKGm(zeta,sigmatemp));
        case 'POC' % Li et al. (2025b)
            [k,~]=size(n);
            [~,tempindex]=maxk(F,m+1);
            [~,topindex]=maxk(F,m);
            bottomindex=setdiff((1:k)',topindex);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=zeros(k,1);
            zeta(topindex)=-abs(F(topindex)-F(tempindex(m+1)))./sigmatemp(topindex);
            zeta(bottomindex)=-abs(F(bottomindex)-F(tempindex(m)))./sigmatemp(bottomindex);
            [~,istar]=max(zeta);
    end
end


function y=InformationKGm(zeta,sigma)
    temp=log(sigma)+log(0.5*zeta.*erfc(vpa(-zeta./sqrt(2)))+1/sqrt(2*pi)*exp(vpa(-zeta.^2/2)));
    y=double(temp);
end


% References
% Zhang S, Lee LH, Chew EP, Xu J, Chen CH (2015) A simulation budget allocation procedure for enhancing
% the efficiency of optimal subset selection. IEEE Trans. Automatic Control 61(1):62–75.
% 
% Gao S, Chen W (2016) A new budget allocation framework for selecting top simulated designs. IIE trans.
% 48(9):855–863.
% 
% Zhang G, Peng Y, Zhang J, Zhou E (2023) Asymptotically optimal sampling policy for selecting top-m
% alternatives. INFORMS J. Comput. 35(6):1261–1285.
% 
% Li D, Chew EP, Li H, Yucesan E, Chen CH (2025a) Knowledge gradient procedure to select the best system
% under pairwise comparisons. Naval Res. Logist.
%
% Li D, Yucesan E, Chen CH (2025b) Probability of Improvement Criterion Revisited: 
% Applications to Generalized Ranking and Selection. Working paper



