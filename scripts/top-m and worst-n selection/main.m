clear,clc,close all
casenum=1; % [1, 2, 3, 4, 5, 6]
policy='EA'; % ['EA', 'Oracle', 'OCBAmn', 'OCBAsr', 'POC']
R=1e4; % number of macro replications

[PCS,EOC] = Experiment(casenum,policy,R);

temp=append('PCS_',policy);
eval([temp ' = PCS;']);
temp=append('EOC_',policy);
eval([temp ' = EOC;']);

clear R EOC PCS temp
save(append('output_',policy,'_case',sprintf('%g',casenum)));