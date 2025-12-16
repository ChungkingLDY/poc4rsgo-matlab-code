clear,clc,close all

PCS_final = zeros(7,6);
EOC_final = zeros(7,6);

for casenum=1:6
    load(append('output_EA_case',sprintf('%g',casenum)));
    load(append('output_Oracle_case',sprintf('%g',casenum)));
    load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
    load(append('output_OCBASS_case',sprintf('%g',casenum)));
    load(append('output_AOAPm_case',sprintf('%g',casenum)));
    load(append('output_KGm_case',sprintf('%g',casenum)));
    load(append('output_POC_case',sprintf('%g',casenum)));
    PCS_final(1,casenum)=PCS_EA(end);
    PCS_final(2,casenum)=PCS_Oracle(end);
    PCS_final(3,casenum)=PCS_OCBAmPlus(end);
    PCS_final(4,casenum)=PCS_OCBASS(end);
    PCS_final(5,casenum)=PCS_AOAPm(end);
    PCS_final(6,casenum)=PCS_KGm(end);
    PCS_final(7,casenum)=PCS_POC(end);
    EOC_final(1,casenum)=EOC_EA(end);
    EOC_final(2,casenum)=EOC_Oracle(end);
    EOC_final(3,casenum)=EOC_OCBAmPlus(end);
    EOC_final(4,casenum)=EOC_OCBASS(end);
    EOC_final(5,casenum)=EOC_AOAPm(end);
    EOC_final(6,casenum)=EOC_KGm(end);
    EOC_final(7,casenum)=EOC_POC(end);
end

EOC_final = max(1e-4-1e-5,EOC_final); % modify zero values for log-scale plot
limitsPCS = [min(0.97,min(PCS_final));max(PCS_final)];
limitsEOC = [min(EOC_final);max(1e-4,max(EOC_final))];
labels = {"Case 1","Case 2","Case 3","Case 4","Case 5","Case 6"};
colors = {'k','#D95319','#0072BD','#77AC30','#7E2F8E','#EDB120','r'};
lines = {'-','--','-','-','-','-','-'};
linewidth = [1.5,1.5,1.5,1.5,1.5,1.5,1.5];
markers = {'.','.','s','x','d','*','o'};
markersize = [1,1,50,50,50,50,50];
rgb = zeros(numel(colors),3);
for i = 1:numel(colors)
    rgb(i,:) = color2rgb(colors{i});
end

figure(1);
spider_plot(PCS_final, ...
    'Color', rgb,...
    'LineStyle', lines,...
    'LineWidth', linewidth,...
    'Marker', markers,...
    'MarkerSize', markersize,...
    'AxesLabels',labels, ...
    'AxesLabelsEdge', 'none',...
    'AxesLimits', limitsPCS, ...
    'AxesPrecision', 2, ...
    'AxesFontSize', 16,...
    'LabelFontSize', 18, ...
    'AxesStart',pi/3, ...
    'AxesLabelsOffset',0.12, ...
    'AxesColor', [0.85, 0.85, 0.85]);
lgd=legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','west','FontSize',17);
lgd.Units = 'normalized';
lgd.Position = [0.205 0.615 0.10 0.2];
x0=50;
y0=50;
width=1200;
height=900;
set(gcf,'position',[x0,y0,width,height])

figure(2);
spider_plot(EOC_final, ...
    'Color', rgb,...
    'LineStyle', lines,...
    'LineWidth', linewidth,...
    'Marker', markers,...
    'MarkerSize', markersize,...
    'AxesLabels',labels, ...
    'AxesLabelsEdge', 'none',...
    'AxesLimits', limitsEOC, ...
    'AxesScaling', 'log',...
    'AxesPrecision', 3, ...
    'AxesFontSize', 16,...
    'LabelFontSize', 18, ...
    'AxesStart',pi/3, ...
    'AxesLabelsOffset',0.12, ...
    'AxesColor', [0.85, 0.85, 0.85]);
lgd=legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','west','FontSize',17);
lgd.Units = 'normalized';
lgd.Position = [0.205 0.615 0.10 0.2];
x0=50;
y0=50;
width=1200;
height=900;
set(gcf,'position',[x0,y0,width,height])



function rgb = color2rgb(c)
    if ismember(c, ["k","r","g","b","c","m","y","w"])
        map = containers.Map( ...
            ["k","r","g","b","c","m","y","w"], ...
            {[0 0 0],[1 0 0],[0 1 0],[0 0 1], ...
             [0 1 1],[1 0 1],[1 1 0],[1 1 1]});
        rgb = map(c);
    else
        rgb = sscanf(c(2:end), '%2x%2x%2x', [1 3]) / 255;
    end
end