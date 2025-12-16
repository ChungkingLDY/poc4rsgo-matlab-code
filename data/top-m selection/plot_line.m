clear,clc,close all

casenum=1;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(1);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.16;1.00]);
yticks(0.16:0.21:1.00);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
% ylim([0.001;5]);
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
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=5000;
tickN = 250;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(3);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(1000:1000:N);
ylim([0.6;1.00]);
yticks(0.6:0.1:1.00);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(1000:1000:N);
set(gca, 'YScale', 'log');
% ylim([0.001;5]);
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
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(5);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.0;0.85]);
yticks(0:0.17:0.85);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.1;6]);
yticks([0.1,0.3,1,3]);
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
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(7);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.53;0.98]);
yticks(0.53:0.15:0.98);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.003;3]);
yticks([0.003,0.03,0.3,3]);
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
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(9);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0.05;0.70]);
yticks(0.05:0.13:0.70);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.07;3]);
yticks([0.1,0.3,1,3]);
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
load(append('output_OCBAmPlus_case',sprintf('%g',casenum)));
load(append('output_OCBASS_case',sprintf('%g',casenum)));
load(append('output_AOAPm_case',sprintf('%g',casenum)));
load(append('output_KGm_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=100;
n0=50;
N=50000;
tickN = 2500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(11);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,PCS_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 4;
xlim([n0*k;N]);
xticks(10000:10000:N);
ylim([0;0.9]);
yticks(0.0:0.3:0.9);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','OCBAm+','OCBASS','AOAPm','KGm','POC','Location','southeast','FontSize',18);
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
plot(rangeN,EOC_OCBAmPlus(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,EOC_OCBASS(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,EOC_AOAPm(rangeN),'Color',"#7E2F8E",'LineWidth',1.5,'Marker','diamond','MarkerSize',4);
plot(rangeN,EOC_KGm(rangeN),'Color',"#EDB120",'LineWidth',1.5,'Marker','*');
plot(rangeN,EOC_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=4;
xlim([n0*k;N]);
xticks(10000:10000:N);
set(gca, 'YScale', 'log');
ylim([0.1;30]);
yticks([0.1,0.3,1,3,10,30]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm EOC} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])