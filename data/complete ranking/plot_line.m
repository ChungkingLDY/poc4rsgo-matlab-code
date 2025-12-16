clear,clc,close all

casenum=1;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(1);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
% ylim([0.16;1.00]);
% yticks(0.16:0.21:1.00);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(2);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.0003;0.5]);
yticks([0.0003,0.003,0.03,0.3]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])



casenum=2;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(3);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0;0.84]);
yticks(0:0.21:0.84);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(4);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.008;0.3]);
yticks([0.01,0.03,0.1,0.3]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])


casenum=3;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(5);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0;0.16]);
yticks(0:0.04:0.16);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(6);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.07;0.8]);
yticks([0.1,0.2,0.4,0.8]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])


casenum=4;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(7);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0;0.76]);
yticks(0:0.19:0.76);
ax.YAxis.Exponent = -2;
legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(8);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.012;0.2]);
yticks([0.02,0.05,0.1,0.2]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])


casenum=5;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=10;
n0=10;
N=10000;
tickN = 500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(9);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 3;
xlim([n0*k;N]);
xticks(2000:2000:N);
ylim([0;0.03]);
yticks(0:0.006:0.03);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(10);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=3;
xlim([n0*k;N]);
xticks(2000:2000:N);
set(gca, 'YScale', 'log');
ylim([0.17;0.81]);
yticks([0.2,0.3,0.4,0.6,0.8]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])


casenum=6;
load(append('output_EA_case',sprintf('%g',casenum)));
load(append('output_Oracle_case',sprintf('%g',casenum)));
load(append('output_PTV_case',sprintf('%g',casenum)));
load(append('output_OCBAcr_case',sprintf('%g',casenum)));
load(append('output_POC_case',sprintf('%g',casenum)));
k=100;
n0=50;
N=50000;
tickN = 2500;
rangeN=[n0*k,(floor(n0*k/tickN)+1)*tickN:tickN:N];

figure(11);hold on;
plot(rangeN,PCS_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,PCS_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,PCS_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,PCS_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,PCS_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent = 4;
xlim([n0*k;N]);
xticks(10000:10000:N);
ylim([0;0.12]);
yticks(0:0.04:0.12);
ax.YAxis.Exponent = -2;
% legend('EA','Oracle','PTV','OCBAcr','POC','Location','southeast','FontSize',18);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm PCS} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=50;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure(12);hold on;
plot(rangeN,KTD_EA(rangeN),'Color',"k",'LineWidth',2);
plot(rangeN,KTD_Oracle(rangeN),'Color',"#D95319",'LineWidth',2,'LineStyle','--');
plot(rangeN,KTD_PTV(rangeN),'Color',"#0072BD",'LineWidth',1.5,'Marker','|');
plot(rangeN,KTD_OCBAcr(rangeN),'Color',"#77AC30",'LineWidth',1.5,'Marker','x');
plot(rangeN,KTD_POC(rangeN),'Color',"r",'LineWidth',1.5,'Marker','o');
ax=gca;
ax.XAxis.Exponent=4;
xlim([n0*k;N]);
xticks(10000:10000:N);
set(gca, 'YScale', 'log');
% ylim([0.2;0.81]);
yticks([0.001,0.002,0.005,0.01,0.02]);
xlabel('$ N $','Interpreter','latex','FontSize',18);
% ylabel('$ \widehat{\rm KTD} $','Interpreter','latex','FontSize',18,'Rotation',90);
set(gca,'fontsize',18);
x0=700;
y0=50;
width=600;
height=450;
set(gcf,'position',[x0,y0,width,height])