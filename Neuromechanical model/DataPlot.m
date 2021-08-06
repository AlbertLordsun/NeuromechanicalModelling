% This is for plotting the data folder with Viscoelasticity, friction, neuralnetwork, tension and feedback
% All the results are simulation responses

clc; clear all; close all;
fsize = 14; % fontsize
fposition = [100 100 500 375]; % figure position;

%% for viscoelasticity
% C = 100000:100000:1000000;
% for i = 1:size(C,2)
%     filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\' ...
%         'Neuromechanical model\MyModel\NM\Data\Viscoelasticity\Response-c-' num2str(C(i))];
%     load(filename);
%     Cdata(:,i) = response; 
% end
% figure(1) % Stride frequency(Hz) & Locomotion speed(mm/s)
% plot(C,roundn(Cdata(14,:)*0.4,-4),'Color',[1 0.5 0]); box off;
% ylim([0.5 0.56]); yticks(0.5:0.02:0.56); xlim([1e5 1e6]);
% xlabel('c','FontSize',fsize);ylabel('Locomotion speed(mm/s)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F5B_C_f&v','-djpeg','-r600');
% figure(2)
% set(gcf,'defaultAxesColorOrder',[[0 0.45 0.74]; [1 0.5 0]]);
% yyaxis left
% plot(C,roundn(Cdata(5,:),-4)); box off;
% ylim([0.8 1.2]); yticks(0.8:0.2:1.2); xlim([1e5 1e6]);
% ylabel('Stride frequency(Hz)','FontSize',fsize);
% yyaxis right
% plot(C,Cdata(15,:)*0.4,'Color',[1 0.5 0]); box off;
% ylim([0.5 0.56]); yticks(0.5:0.02:0.56); xlim([100000 1000000]);
% xlabel('c','FontSize',fsize); ylabel('Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5B_Stride length(mm)','-djpeg','-r600');
% figure(3) % Segmental length range(mm)
% plot(C, Cdata(12,:)*0.4,'Color',[1 0.5 0]); hold on;
% plot(C, Cdata(13,:)*0.4,'Color',[0 0.45 0.74]); box off; legend('Max','Min');
% xlim([1e5 1e6]); ylim([0 0.5]); yticks(0.0:0.1:0.5);
% xlabel('c','FontSize',fsize);ylabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5B_C_Mm','-djpeg','-r600');
% 
% K1 = 2:0.5:5; K2 = 5:-0.5:2;
% for i = 1:size(K1,2)
% 	for j = 1:size(K2,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\Viscoelasticity\'...
%             'Response-k1-' num2str(K1(i)) '-k2-' num2str(K2(j)) '.mat'];
% 		load(filename);
% 		K1K2data(:,7*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(K1K2data(5,:),7,7);
% heatmap(K1,K2,Z1,'CellLabelColor','none','XLabel','k1','YLabel','k2','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',[100 100 520 375]); print('F5A_K1K2_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(K1K2data(14,:)*0.4,7,7);
% heatmap(K1,K2,Z2,'CellLabelColor','none','XLabel','k1','YLabel','k2','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition); print('F5A_K1K2_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(K1K2data(12,:)*0.4,7,7); Z4 = reshape(K1K2data(13,:)*0.4,7,7);
% mesh(K1,K2,Z3); hold on;
% mesh(K1,K2,Z4);
% colorbar; caxis([0 0.6]);  xlim([2 5]); ylim([2 5]); zlim([0 0.5]);
% xlabel('k1','FontSize',fsize); ylabel('k2','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5A_K1K2_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(K1K2data(15,:)*0.4,7,7);
% heatmap(K1,K2,Z5,'CellLabelColor','none','XLabel','k1','YLabel','k2','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5A_Stride length(mm)','-djpeg','-r600');

%% for friction
% FF = 0.01:0.01:0.1; MU = 10:-1:1;
% for i = 1:size(FF,2)
% 	for j = 1:size(MU,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab'...
%             '\Neuromechanical model\MyModel\NM\Data\Friction\'... 
%             'Response-mu_bf-' num2str(MU(j)) '-Ff-' num2str(FF(i)) '.mat'];
% 		load(filename);
% 		FFMUdata(:,10*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(FFMUdata(4,:),10,10);
% heatmap(FF,MU,roundn(Z1,-3),'CellLabelColor','none','XLabel','Ff','YLabel','\mu_{bf}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5D_FFMU_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(FFMUdata(14,:)*0.4,10,10);
% heatmap(FF,MU,Z2,'CellLabelColor','none','XLabel','Ff','YLabel','\mu_{bf}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition); print('F5D_FFMU_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(FFMUdata(12,:)*0.4,10,10); Z4 = reshape(FFMUdata(13,:)*0.4,10,10);
% mesh(FF,MU,Z3); hold on;
% mesh(FF,MU,Z4);
% colorbar; caxis([0 0.6]); xlim([0.01 0.1]); ylim([1 10]); zlim([0 0.6]); zticks(0:0.2:0.6);
% xlabel('Ff','FontSize',fsize); ylabel('\mu_{bf}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5D_FFMU_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(FFMUdata(15,:)*0.4,10,10);
% heatmap(FF,MU,Z5,'CellLabelColor','none','XLabel','Ff','YLabel','\mu_{bf}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F5D_Stride length(mm)','-djpeg','-r600');
% 
%% for neural network
% W_EN = -10:1:-1; W_NE = 10:-1:1;
% for i = 1:size(W_EN,2)
% 	for j = 1:size(W_NE,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\NeuralNetwork\'...
%             'Response-w_NE-' num2str(W_NE(j)) '-w_EN-' num2str(W_EN(i)) '.mat'];
% 		load(filename);
% 		WW_ENdata(:,10*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(WW_ENdata(4,:),10,10);
% heatmap(W_EN,W_NE,Z1,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{IE}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F6A_WW_EN_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(WW_ENdata(14,:)*0.4,10,10);
% heatmap(W_EN,W_NE,Z2,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{IE}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F6A_WW_EN_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(WW_ENdata(12,:)*0.4,10,10); Z4 = reshape(WW_ENdata(13,:)*0.4,10,10);
% mesh(W_EN,W_NE,Z3); hold on;
% mesh(W_EN,W_NE,Z4);
% colorbar; caxis([0.0 0.6]);xlim([-10 -1]); ylim([1 10]); zlim([0 0.6]); zticks(0:0.2:0.6);
% xlabel('w_{EI}','FontSize',fsize); ylabel('w_{IE}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F6A_WW_EN_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(WW_ENdata(15,:)*0.4,10,10);
% heatmap(W_EN,W_NE,Z5,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{IE}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition); print('F6A_WW_EN_Stride length(mm)','-djpeg','-r600');
%
% W_EN = -10:1:-1; W_ENd = -1000:-1000:-10000;
% for i = 1:size(W_EN,2)
% 	for j = 1:size(W_ENd,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\NeuralNetwork\'...
%             'Response-w_ENd-' num2str(W_ENd(j)) '-w_EN-' num2str(W_EN(i)) '.mat'];
% 		load(filename);
% 		WW_ENddata(:,10*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(WW_ENddata(4,:),10,10);
% heatmap(W_EN,W_ENd,Z1,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{EId}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_ENd_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(WW_ENddata(14,:)*0.4,10,10);
% heatmap(W_EN,W_ENd,Z2,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{EId}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F6S_WW_ENd_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(WW_ENddata(12,:)*0.4,10,10); Z4 = reshape(WW_ENddata(13,:)*0.4,10,10);
% mesh(W_EN,W_ENd,Z3); hold on;
% mesh(W_EN,W_ENd,Z4);
% colorbar; caxis([0 0.6]); xlim([-10 -1]); ylim([-10000 -1000]); zlim([0 0.6]); zticks(0:0.2:0.6);
% xlabel('w_{EI}','FontSize',fsize); ylabel('w_{EId}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_ENd_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(WW_ENddata(15,:)*0.4,10,10);
% heatmap(W_EN,W_ENd,Z5,'CellLabelColor','none','XLabel','w_{EI}','YLabel','w_{EId}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_ENd_Stride length(mm)','-djpeg','-r600');

% W_NE = 1:1:10; W_ENd = -1000:-1000:-10000;
% for i = 1:size(W_NE,2)
% 	for j = 1:size(W_ENd,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\NeuralNetwork\'...
%             'Response-w_ENd-' num2str(W_ENd(j)) '-w_NE-' num2str(W_NE(i)) '.mat'];
% 		load(filename);
% 		WW_NENddata(:,10*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(WW_NENddata(4,:),10,10);
% heatmap(W_NE,W_ENd,Z1,'CellLabelColor','none','XLabel','w_{IE}','YLabel','w_{EId}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_NENd_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(WW_NENddata(14,:)*0.4,10,10);
% heatmap(W_NE,W_ENd,Z2,'CellLabelColor','none','XLabel','w_{IE}','YLabel','w_{EId}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F6S_WW_NENd_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(WW_NENddata(12,:)*0.4,10,10); Z4 = reshape(WW_NENddata(13,:)*0.4,10,10);
% mesh(W_NE,W_ENd,Z3); hold on;
% mesh(W_NE,W_ENd,Z4);
% colorbar; caxis([0 0.6]); xlim([1 10]); ylim([-10000 -1000]); zlim([0 0.6]); zticks(0:0.2:0.6);
% xlabel('w_{IE}','FontSize',fsize); ylabel('w_{EId}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_NENd_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(WW_NENddata(15,:)*0.4,10,10);
% heatmap(W_NE,W_ENd,Z5,'CellLabelColor','none','XLabel','w_{IE}','YLabel','w_{EId}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6S_WW_NENd_Stride length(mm)','-djpeg','-r600');

% 
% Tau_E = 5:5:50; Tau_N = 35:-5:5;
% for i = 1:size(Tau_E,2)
% 	for j = 1:size(Tau_N,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\NeuralNetwork\'...
%             'Response-tauE-' num2str(Tau_E(i)) '-tauN-' num2str(Tau_N(j)) '.mat'];
% 		load(filename);
% 		Tau_ENdata(:,7*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(Tau_ENdata(4,:),7,10);
% heatmap(Tau_E,Tau_N,Z1,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6B_Tau_EN_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(Tau_ENdata(14,:)*0.4,7,10);
% heatmap(Tau_E,Tau_N,Z2,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F6B_Tau_EN_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(Tau_ENdata(12,:)*0.4,7,10); Z4 = reshape(Tau_ENdata(13,:)*0.4,7,10);
% mesh(Tau_E,Tau_N,Z3); hold on;
% mesh(Tau_E,Tau_N,Z4); 
% colorbar; caxis([0 0.6]); xlim([5 50]); ylim([5 35]);
% xlabel('\tau_{E}','FontSize',fsize); ylabel('\tau_{I}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6B_Tau_EN_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(Tau_ENdata(15,:)*0.4,7,10);
% heatmap(Tau_E,Tau_N,Z5,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6B_Tau_EN_Stride length(mm)','-djpeg','-r600');
% % 
% Theta_E = 0.1:0.1:0.9; Theta_N = 0.9:-0.1:0.1;
% for i = 1:size(Theta_E,2)
% 	for j = 1:size(Theta_N,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\NeuralNetwork\'...
%             'Response-theta_E-' num2str(Theta_E(i)) '-theta_N-' num2str(Theta_N(j)) '.mat'];
% 		load(filename);
% 		Theta_ENdata(:,9*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(Theta_ENdata(4,:),9,9);
% heatmap(Theta_E,Theta_N,Z1,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6C_Theta_EN_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(Theta_ENdata(14,:)*0.4,9,9);
% heatmap(Theta_E,Theta_N,Z2,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F6C_Theta_EN_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(Theta_ENdata(12,:)*0.4,9,9); Z4 = reshape(Theta_ENdata(13,:)*0.4,9,9);
% mesh(Theta_E,Theta_N,Z3); hold on;
% mesh(Theta_E,Theta_N,Z4);
% colorbar; caxis([0 0.6]); xlim([0.1 0.9]); ylim([0.1 0.9]); zlim([0 0.6]); zticks(0:0.2:0.6);
% xlabel('\theta_{E}','FontSize',fsize); ylabel('\theta_{I}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6C_Theta_EN_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(Theta_ENdata(15,:)*0.4,9,9);
% heatmap(Theta_E,Theta_N,Z5,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Strid length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F6C_Theta_EN_Stride length(mm)','-djpeg','-r600');
% 

%% comparison of Pheleven's work
% Theta_E = 0.5:0.1:0.9; Theta_N = 0.9:-0.1:0.2;
% for i = 1:size(Theta_E,2)
% 	for j = 1:size(Theta_N,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\Comparison\'...
%             'Response-theta_E-' num2str(Theta_E(i)) '-theta_N-' num2str(Theta_N(j)) '.mat'];
% 		load(filename);
% 		Theta_ENdata(:,8*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(Theta_ENdata(4,:),8,5);
% heatmap(Theta_E,Theta_N,Z1,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Theta_EN_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(Theta_ENdata(14,:)*0.4,8,5);
% heatmap(Theta_E,Theta_N,Z2,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('SF6_Theta_EN_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(Theta_ENdata(12,:)*0.4,8,5); Z4 = reshape(Theta_ENdata(13,:)*0.4,8,5);
% mesh(Theta_E,Theta_N,Z3); hold on;
% mesh(Theta_E,Theta_N,Z4);
% colorbar; caxis([0 1.8]); xlim([0.5 0.9]); ylim([0.2 0.9]); zlim([0 0.7]); zticks(0:0.2:0.7);
% xlabel('\theta_{E}','FontSize',fsize); ylabel('\theta_{I}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Theta_EN_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(Theta_ENdata(15,:)*0.4,8,5);
% heatmap(Theta_E,Theta_N,Z5,'CellLabelColor','none','XLabel','\theta_{E}','YLabel','\theta_{I}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Theta_EN_Stride length(mm)','-djpeg','-r600');

%% comparison of Pheleven's work
% Tau_E = 10:5:50; Tau_N = 50:-5:5;
% for i = 1:size(Tau_E,2)
% 	for j = 1:size(Tau_N,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\'...
%             'Matlab\Neuromechanical model\MyModel\NM\Data\Comparison\'...
%             'Response-tauE-' num2str(Tau_E(i)) '-tauN-' num2str(Tau_N(j)) '.mat'];
% 		load(filename);
% 		Tau_ENdata(:,10*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(Tau_ENdata(4,:),10,9);
% heatmap(Tau_E,Tau_N,Z1,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Tau_EN_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(Tau_ENdata(14,:)*0.4,10,9);
% heatmap(Tau_E,Tau_N,Z2,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('SF6_Tau_EN_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(Tau_ENdata(12,:)*0.4,10,9); Z4 = reshape(Tau_ENdata(13,:)*0.4,10,9);
% mesh(Tau_E,Tau_N,Z3); hold on;
% mesh(Tau_E,Tau_N,Z4); 
% colorbar; caxis([0 0.6]);xlim([10 50]); ylim([5 50]);
% xlabel('\tau_{E}','FontSize',fsize); ylabel('\tau_{I}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Tau_EN_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(Tau_ENdata(15,:)*0.4,10,9);
% heatmap(Tau_E,Tau_N,Z5,'CellLabelColor','none','XLabel','\tau_{E}','YLabel','\tau_{I}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('SF6_Tau_EN_Stride length(mm)','-djpeg','-r600');

%% for tension
% T_max = 1:1:6;
% for i = 1:size(T_max,2)
%     filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\' ...
%         'Neuromechanical model\MyModel\NM\Data\Tension\Response-t_max-' num2str(T_max(i))];
%     load(filename);
%     T_maxdata(:,i) = response; 
% end
% figure(1) % Stride frequency(Hz) & Locomotion speed(mm/s)
% plot(T_max,roundn(T_maxdata(14,:)*0.4,-4),'Color',[1,0.5 0]); box off;
% xlim([1 6]); ylim([0 1]); yticks(0:0.2:1);
% xlabel('F_{M}_{max}/mN','FontSize',fsize); ylabel('Locomotion speed(mm/s)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7A_t_{max}_f&v','-djpeg','-r600');
% figure(2)
% set(gcf,'defaultAxesColorOrder',[[0 0.45 0.74]; [1 0.5 0]]);
% yyaxis left
% plot(T_max,roundn(T_maxdata(4,:),-4)); box off;
% ylim([0.8 1.2]); yticks(0.8:0.2:1.2); ylabel('Stride frequency(Hz)','FontSize',fsize);
% yyaxis right
% plot(T_max, T_maxdata(15,:)*0.4,'Color',[1,0.5 0]); box off;
% ylim([0 1]); yticks(0:0.2:1);
% xlabel('F_{M}_{max}/mN','FontSize',fsize); ylabel('Stride length(mm)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7A_t_{max}_Stride length(mm)','-djpeg','-r600');
% figure(3) % Segmental length range(mm)
% plot(T_max, T_maxdata(12,:)*0.4,'Color',[1 0.5 0]); hold on;
% plot(T_max, T_maxdata(13,:)*0.4,'Color',[0 0.45 0.74]);   box off; 
% legend('Max','Min');
% xlim([1 6]); ylim([0 0.6]); yticks(0:0.2:0.6); xlabel('F_{M}_{max}/mN','FontSize',fsize);ylabel('Segmental length range(mm)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7A_t_{max}_Mm','-djpeg','-r600');

% 
% Tau_t = 100:20:200;
% for i = 1:size(Tau_t,2)
%     filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\' ...
%         'Neuromechanical model\MyModel\NM\Data\Tension\Response-taut-' num2str(Tau_t(i)) '.mat'];
%     load(filename);
%     Tau_tdata(:,i) = response; 
% end
% figure(1) % Stride frequency(Hz) & Locomotion speed(mm/s)
% plot(Tau_t,roundn(Tau_tdata(14,:)*0.4,-4),'Color',[1 0.5 0]); box off;
% xlim([100 200]); ylim([0.4 0.65]); yticks(0.4:0.1:0.65);
% xlabel('\tau_{M}/ms','FontSize',fsize);ylabel('Locomotion speed(mm/s)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7B_taut_f&v','-djpeg','-r600');
% figure(11) % ton_t & Locomotion speed(mm/s)
% yyaxis left
% plot(Tau_t,roundn(Tau_tdata(7,:),-4)); box off;
% yticks(0.4:0.1:0.7);
% xlabel('\tau_{M}/ms','FontSize',fsize);ylabel('Contraction duration_{M}(s)','FontSize',fsize);  
% yyaxis right
% plot(Tau_t,roundn(Tau_tdata(14,:)*0.4,-4)); box off;
% xlim([100 200]); yticks(0.4:0.1:0.7); ylabel('Locomotion speed(mm/s)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7S_taut_Duration_t&v','-djpeg','-r600');
% figure(2)
% set(gcf,'defaultAxesColorOrder',[[0 0.45 0.74]; [1 0.5 0]]);
% yyaxis left
% plot(Tau_t,roundn(Tau_tdata(4,:),-4)); box off;
% ylim([0.9 1.1]); yticks(0.9:0.1:1.1);
% xlabel('\tau_{M}/ms','FontSize',fsize);ylabel('Stride frequency(Hz)','FontSize',fsize); 
% yyaxis right
% plot(Tau_t, Tau_tdata(15,:)*0.4,'Color',[1 0.5 0]); box off;
% ylim([0.4 0.7]);yticks(0.4:0.1:0.7);
% xlabel('\tau_{M}/ms','FontSize',fsize);ylabel('Stride length(mm)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7B_taut_Stride length(mm)','-djpeg','-r600');
% figure(3) % Segmental length range(mm) 
% plot(Tau_t, Tau_tdata(12,:)*0.4,'Color',[1 0.5 0]); hold on;
% plot(Tau_t, Tau_tdata(13,:)*0.4,'Color',[0 0.45 0.74]); box off;
% xlim([100 200]); ylim([0 0.6]); yticks(0:0.2:0.6); 
% xlabel('\tau_{M}/ms','FontSize',fsize); ylabel('Segmental length range(mm)','FontSize',fsize); legend('Max','Min');
% set(gcf,'Position',fposition); print('F7B_taut_Mm','-djpeg','-r600');
% 
% Theta_t = 0.1:0.1:0.9;
% for i = 1:size(Theta_t,2)
%     filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\' ...
%         'Neuromechanical model\MyModel\NM\Data\Tension\Response-theta_t-' num2str(Theta_t(i)) '.mat'];
%     load(filename);
%     Theta_tdata(:,i) = response; 
% end
% figure(1) % Stride frequency(Hz) & Locomotion speed(mm/s)
% plot(Theta_t,roundn(Theta_tdata(14,:)*0.4,-4),'Color',[1 0.5 0]); box off;
% xlim([0.1 0.9]); ylim([0.2 0.7]); yticks(0.2:0.2:0.7);
% xlabel('\theta_{M}','FontSize',fsize);ylabel('Locomotion speed(mm/s)','FontSize',fsize); 
% set(gcf,'Position',fposition);print('F7C_theta_t_f&v','-djpeg','-r600');
% figure(11) % Stride frequency(Hz) & Locomotion speed(mm/s)
% yyaxis left
% plot(Theta_t,roundn(Theta_tdata(7,:),-3)); box off;
% xlim([0.1 0.9]); ylim([0.4 0.6]); yticks(0.4:0.05:0.6);
% xlabel('\theta_{M}','FontSize',fsize); ylabel('Contraction duration_{M}(s)','FontSize',fsize); 
% yyaxis right
% plot(Theta_t,roundn(Theta_tdata(14,:)*0.4,-4)); box off;
% xlim([0.1 0.9]); ylim([0.2 0.6]); yticks(0.2:0.1:0.6);
% ylabel('Locomotion speed(mm/s)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7S_theta_t_Duration_t&v','-djpeg','-r600');
% figure(2)
% set(gcf,'defaultAxesColorOrder',[[0 0.45 0.74]; [1 0.5 0]]);
% yyaxis left
% plot(Theta_t,roundn(Theta_tdata(4,:),-3)); box off;
% xlim([0.1 0.9]); ylim([0.9 1.1]); yticks(0.9:0.1:1.1);
% xlabel('\theta_{M}','FontSize',fsize); ylabel('Stride frequency(Hz)','FontSize',fsize);
% yyaxis right
% plot(Theta_t, Theta_tdata(15,:)*0.4); box off;
% ylim([0.2 0.7]); yticks(0.2:0.1:0.7);
% xlabel('\theta_{M}','FontSize',fsize);ylabel('Stride length(mm)','FontSize',fsize); 
% set(gcf,'Position',fposition); print('F7B_theta_t_Stride length(mm)','-djpeg','-r600');
% figure(3) % Segmental length range(mm)
% plot(Theta_t, Theta_tdata(12,:)*0.4,'Color',[1 0.5 0]); hold on;
% plot(Theta_t, Theta_tdata(13,:)*0.4,'Color',[0 0.45 0.74]); box off;  
% xlim([0.1 0.9]); ylim([0 0.5]); yticks(0:0.1:0.5);
% xlabel('\theta_{M}'); ylabel('Segmental length range(mm)','FontSize',fsize); legend('Max','Min');
% set(gcf,'Position',fposition); print('F7C_theta_t_Mm','-djpeg','-r600');

%% for proprioceptive feedback
% W_ES = -10:1:0; Theta_S = 0.9:-0.1:0.1;
% for i = 1:size(W_ES,2)
% 	for j = 1:size(Theta_S,2)
% 		filename = ['D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\'...
%             'Neuromechanical model\MyModel\NM\Data\'...
%             'Feedback\' 'Response-w_ES-' num2str(W_ES(i)) '-theta_S-' num2str(Theta_S(j)) '.mat'];
% 		load(filename);
% 		WT_Sdata(:,9*(i-1)+j) = response; 
% 	end
% end
% figure(1)
% Z1 = reshape(WT_Sdata(4,:),9,11);  % frequency
% h1=heatmap(W_ES,Theta_S,Z1,'CellLabelColor','none','XLabel','w_{ES}','YLabel','\theta_{S}','Title','Stride frequency(Hz)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F8_WT_S_f','-djpeg','-r600');
% figure(2)
% Z2 = reshape(WT_Sdata(14,:)*0.4,9,11); % velocity
% h2=heatmap(W_ES,Theta_S,Z2,'CellLabelColor','none','XLabel','w_{ES}','YLabel','\theta_{S}','Title','Locomotion speed(mm/s)','FontSize',fsize,'Colormap',flipud(autumn(50)));
% set(gcf,'Position',fposition);print('F8_WT_S_v','-djpeg','-r600');
% figure(3)
% Z3 = reshape(WT_Sdata(12,:)*0.4,9,11); Z4 = reshape(WT_Sdata(13,:)*0.4,9,11); 
% mesh(W_ES,Theta_S,Z3); hold on;
% mesh(W_ES,Theta_S,Z4); colorbar; caxis([0 0.6]);
% xlabel('w_{ES}','FontSize',fsize); ylabel('\theta_{ES}','FontSize',fsize); zlabel('Segmental length range(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F8_WT_S_Mm','-djpeg','-r600');
% figure(4)
% Z5 = reshape(WT_Sdata(15,:)*0.4,9,11);
% heatmap(W_ES,Theta_S,Z5,'CellLabelColor','none','XLabel','w_{ES}','YLabel','\theta_{S}','Title','Stride length(mm)','FontSize',fsize);
% set(gcf,'Position',fposition);print('F8_WT_S_Stride length(mm)','-djpeg','-r600');