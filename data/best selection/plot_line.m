clear,clc,close all

casenum=1;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(1);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.37;1.00]);
yticks(0.4:0.2:1.00);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(2);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
% ylim([0.008;0.15]);
yticks([0.0001,0.001,0.01,0.1,1]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])



casenum=2;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=2000;
tickN = 100;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(3);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=2;
xlim([n0*k;N]);
xticks(500:500:N);
ylim([0.77;1.00]);
yticks(0.79:0.07:1.00);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(4);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=2;
xlim([n0*k;N]);
xticks(500:500:N);
set(gca, 'YScale', 'log');
% ylim([0.008;0.15]);
% yticks([0.0001,0.001,0.01,0.1,1]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])





casenum=3;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(5);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.06;0.86]);
yticks(0.06:0.2:0.86);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(6);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.09;3.2]);
yticks([0.1,0.2,0.4,0.8,1.6,3.2]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])





casenum=4;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(7);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.74;0.99]);
yticks(0.75:0.06:0.99);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(8);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.001;1.00]);
yticks([0.001,0.01,0.1,1]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])





casenum=5;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(9);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.15;0.85]);
yticks(0.15:0.14:0.85);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(10);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.029;1.5]);
yticks([0.03,0.1,0.3,1]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])




casenum=6;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_BOLD_case',sprintf('%g',casenum)));
load(append('output_AOAP_case',sprintf('%g',casenum)));
load(append('output_OCBA_case',sprintf('%g',casenum)));
load(append('output_KG_case',sprintf('%g',casenum)));
load(append('output_EVI_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=100;
n0=50;
N=50000;
tickN = 2500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(11);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(10000:10000:N);
ylim([0.04;0.94]);
yticks(0.04:0.30:0.94);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBA','KG','EVI','AOAP','BOLD','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(12);hold on;
plot(rangeN,EOC_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,EOC_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,EOC_OCBA(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_KG(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_EVI(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAP(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_BOLD(rangeN),'Color',"#4DBEEE",'LineWidth',1.5,'Marker','.','MarkerSize',16);
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(10000:10000:N);
set(gca, 'YScale', 'log');
ylim([0.06;6]);
yticks([0.1,0.3,1,3]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])





