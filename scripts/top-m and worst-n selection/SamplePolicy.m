function istar=SamplePolicy(F,sigma2hat,m,l,n,policy) % implement different sampling policies
    switch policy
        case "EA" % equal allocation
            istar=find(n==min(n),1);
        case "Oracle" % need to install cvx and mosek
            ratio=F;
            ratio_now=n./sum(n);
            ratio_gap=ratio-ratio_now;
            istar=find(ratio_gap==max(ratio_gap),1);
        case 'OCBAmn' % Xiao et al. (2017)
            [k,~]=size(n);
            wNow=n/sum(n);
            wNew=zeros(k,1);
            [~,topindex]=maxk(F,m);
            [~,bottomindex]=mink(F,l);
            middleindex=setdiff((1:k)',[topindex;bottomindex]);
            Fm = F(topindex(m));
            Fl = F(bottomindex(l));
            Fmiddle = (Fm+Fl)/2;
            upperindex = F >= Fmiddle;
            lowerindex = F < Fmiddle;
            deltatop = F(topindex(1:m-1))-F(topindex(m));
            deltabottom = -F(bottomindex(1:l-1))+F(bottomindex(l));
            deltamiddle = min(-F(middleindex)+F(topindex(m)),F(middleindex)-F(bottomindex(l)));
            wNew(topindex(1:m-1))=sigma2hat(topindex(1:m-1))./(deltatop.^2);
            wNew(bottomindex(1:l-1))=sigma2hat(bottomindex(1:l-1))./(deltabottom.^2);
            wNew(middleindex)=sigma2hat(middleindex)./(deltamiddle.^2);
            wNew(topindex(m),1)=sqrt(sum(wNew(upperindex).^2./sigma2hat(upperindex))*sigma2hat(topindex(m)));
            wNew(bottomindex(l),1)=sqrt(sum(wNew(lowerindex).^2./sigma2hat(lowerindex))*sigma2hat(bottomindex(l)));
            wNew=wNew/sum(wNew);
            wGap=wNew-wNow;
            istar=find(wGap==max(wGap),1);
        case 'OCBAsr' % Zhang et al. (2016)
            wNow=n/sum(n);
            [~,temptopindex]=maxk(F,m+1);
            [~,tempbottomindex]=mink(F,l+1);
            c1=(F(temptopindex(m))+F(temptopindex(m+1)))/2;
            c2=(F(tempbottomindex(l))+F(tempbottomindex(l+1)))/2;
            dist2=min((F-c1).^2,(F-c2).^2);
            wNew=sigma2hat./dist2;
            wNew=wNew/sum(wNew);
            wGap=wNew-wNow;
            istar=find(wGap==max(wGap),1);
        case 'POC' % Li et al. (2025)
            [k,~]=size(n);
            [~,topindex]=maxk(F,m);
            [~,bottomindex]=mink(F,l);
            [~,temptopindex]=maxk(F,m+1);
            [~,tempbottomindex]=mink(F,l+1);
            middleindex=setdiff((1:k)',[topindex;bottomindex]);
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            POC=zeros(k,1);
            zetatop=-abs(F(topindex)-F(temptopindex(m+1)))./sigmatemp(topindex);
            zetabottom=-abs(F(bottomindex)-F(tempbottomindex(l+1)))./sigmatemp(bottomindex);
            zetamiddle=[-abs(F(middleindex)-F(temptopindex(m)))./sigmatemp(middleindex),-abs(F(middleindex)-F(tempbottomindex(l)))./sigmatemp(middleindex)];
            POC(topindex)=InformationPOC1(zetatop);
            POC(bottomindex)=InformationPOC1(zetabottom);
            POC(middleindex)=InformationPOC2(zetamiddle);
            [~,istar]=max(POC);
    end
end



function y=InformationPOC1(zeta)
    temp=log(0.5*erfc(vpa(-zeta./sqrt(2))));
    y=double(temp);
end

function y=InformationPOC2(zeta)
    temp=log(0.5*erfc(vpa(-zeta(:,1)./sqrt(2)))+0.5*erfc(vpa(-zeta(:,2)./sqrt(2))));
    y=double(temp);
end



% References
% Xiao H, Gao S, Lee LH (2017) Simulation budget allocation for simultaneously selecting the best and worst
% subsets. Automatica 84:117–127.
% 
% Zhang J, Li Z, Wang C, Zang D, Zhou M (2016a) Approximate simulation budget allocation for subset
% ranking. IEEE Trans. Control Systems Tech. 25(1):358–365.
%
% Li D, Yucesan E, Chen CH (2025) Probability of Improvement Criterion Revisited: 
% Applications to Generalized Ranking and Selection. Working paper

