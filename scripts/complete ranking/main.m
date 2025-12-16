clear,clc,close all
casenum=1; % [1, 2, 3, 4, 5, 6]
policy='EA'; % ['EA', 'Oracle', 'PTV', 'OCBAcr', 'POC']
R=1e4; % number of macro replications

[PCS,KTD] = Experiment(casenum,policy,R);

temp=append('PCS_',policy);
eval([temp ' = PCS;']);
temp=append('KTD_',policy);
eval([temp ' = KTD;']);

clear R KTD PCS temp
save(append('output_',policy,'_case',sprintf('%g',casenum)));