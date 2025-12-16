function istar=SamplePolicy(F,sigma2hat,n,policy) % implement different sampling policies
    switch policy
        case "EA" % equal allocation
            istar=find(n==min(n),1);
        case "Oracle" % need to install cvx and mosek
            ratio=F;
            ratio_now=n./sum(n);
            ratio_gap=ratio-ratio_now;
            istar=find(ratio_gap==max(ratio_gap),1);
        case "PTV" % proportion to variance
            weight_now=n./sum(n(:));
            weight_target=sigma2hat./sum(sigma2hat(:));
            weight_gap=weight_target-weight_now;
            istar=find(weight_gap==max(weight_gap),1);
        case 'OCBAcr' % Xiao et al. (2014)
            wNow=n/sum(n);
            [k,~]=size(F);
            [~, indextemp] = sort(F, 'descend');
            index1=indextemp(1:k-1);
            index2=indextemp(2:k);
            F1=[Inf;F(index1)];
            F2=[F(index2);Inf];
            dist2=min((F(indextemp)-F1).^2,(F(indextemp)-F2).^2);
            wNew=sigma2hat(indextemp)./dist2;
            wNew=wNew/sum(wNew);
            wGap=wNew-wNow(indextemp);
            [~,itemp]=max(wGap);
            istar=indextemp(itemp);
        case 'POC' % Li et al. (2025)
            [k,~]=size(F);
            [~, indextemp] = sort(F, 'descend');
            index1=indextemp(1:k-1);
            index2=indextemp(2:k);
            F1=[Inf;F(index1)];
            F2=[F(index2);Inf];
            dist=-[abs(F(indextemp)-F1),abs(F(indextemp)-F2)];
            sigmatemp=sqrt(sigma2hat./(n.*(n+1)));
            zeta=dist./sigmatemp(indextemp);
            [~,itemp]=max(InformationPOC(zeta));
            istar=indextemp(itemp);
    end
end

function y=InformationPOC(zeta)
    temp=log(0.5*erfc(vpa(-zeta(:,1)./sqrt(2)))+0.5*erfc(vpa(-zeta(:,2)./sqrt(2))));
    y=double(temp);
end



% References
% Xiao H, Lee LH, Ng KM (2014) Optimal computing budget allocation for complete ranking. IEEE Trans.
% Automation Sci. Engrg. 11(2):516–524.
%
% Li D, Yucesan E, Chen CH (2025) Probability of Improvement Criterion Revisited: 
% Applications to Generalized Ranking and Selection. Working paper

