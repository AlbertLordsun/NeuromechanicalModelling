%  Results plotting for the physical measurement

clc; clear all; close all;

%% plot for the typical viscoelastic curve and tension force
%% example selected: viscoelastic-No.18    tension force-No.18
% for the viscoelasticity measurement
% filename = 'D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\Neuromechanical model\MyModel\NM\ExampleData.mat';
% load(filename);
% figure(1)
% fposition = [100 100 500 375]; % figure position;
% fsize = 12;
% plot(x,y,x,y_fit,'LineWidth',2); box off;
% xlabel('Time/s','FontSize',fsize); ylabel('Force/N','FontSize',fsize); 
% xlim([0 600]); ylim([0.004 0.018]); yticks(0.004:0.004:0.018);
% legend('Force','SLS model fitting');
% title('Stress relaxation curve','FontSize',fsize);
% set(gcf,'Position',fposition);
% print('F12_Stress relaxation','-djpeg','-r600');

% for tension force
% dic = 'D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\Neuromechanical model\MyModel\NM\tension\';
% filename = 'ATR+Gal4-9'; format = '.csv';
% data = csvread([dic filename format],1,0);
% time = data(:,1);
% force = data(:,2)+0;
% length = data(:,3);
% [force_M,force_m] = envelope(force,150,'peak');
% TensionArray = force_M-force_m;
% figure(12)
% fposition = [100 100 500 375]; % figure position;
% fsize = 12;
% plot(time,force,'k', time,force_M,'r', time,force_m,'g');
% legend('Force','Upper envelope','Lower envelope');
% xlabel('Time/s','FontSize',fsize); box off;
% ylabel('Force/N','FontSize',fsize);
% xlim([0 200]);
% title('Tension force','FontSize',fsize);
% set(gcf,'Position',fposition);
% print('F3_Tension measurement','-djpeg','-r600');

%% plot for the parameter results for the measurements
VE = [4.785	2.718	307.439; ...
         2.568	2.698	473.235; ...
         1.484	1.143	86.144; ...
         0.883	3.771	868.814; ...
         1.515	1.391	116.272; ...
         5.361	4.117	936.759; ...
         3.133	1.482	173.902; ...
         3.308	1.25	89.706; ...
         0.535	4.491	995.406; ...
         4.139	2.814	497.761; ...
         2.254	3.287	242.986; ...
         1.275	2.025	524.07; ...
         4.952	3.132	430.309; ...
         2.583	6.404	890.975; ...
         2.6	2.539	478.558];
VE_L = {'k1','k2','c'};
T = [0.0041 0.0061 0.0047 0.0069 0.0018 0.0025 0.0028 0.0038 0.0039 ...
       0.0024 0.0063 0.0026 0.0028 0.0038 0.0043 0.005 0.0025 0.0055];
T_L = {'Tension'};

figure(1)
h1=boxplot(VE(:,1:2),VE_L(1:2)); box off; 
set(h1,'LineWidth',1.5);
ylabel('Elastic coefficient (mg/msec^2)','FontSize',12); ylim([0 7]);
set(gca,'FontSize',12,'YTick',0:2:7); set(gcf,'Position',[130 110 400 500]);
print('F1_Elastic coefficient','-djpeg','-r600');
figure(2)
h2=boxplot(VE(:,3)*1e3,VE_L(3)); box off; 
set(h2,'LineWidth',1.5);
ylabel('Viscous coefficient (mg/msec)','FontSize',12); ylim([0 1100000]);
set(gca,'FontSize',12,'YTick',0:200000:1100000); set(gcf,'Position',[130 110 300 500]);
print('F2_Viscous coefficient','-djpeg','-r600');
figure(3)
h3=boxplot(T*1e3,T_L); box off;
ylabel('Tension force (mN)','FontSize',12); ylim([0 8]);
set(h3,'LineWidth',1.5);
set(gca,'FontSize',12,'YTick',0:2:8); set(gcf,'Position',[130 110 300 500]);
print('F3_Tension force','-djpeg','-r600');