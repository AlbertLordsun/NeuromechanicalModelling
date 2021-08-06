% main program for the EI connection hypothesis

clc;
clear all;

tic
N = 500; td = 0.01;
tGiven = td: td: N*td;

externalInput = zeros(N,1);
for i =1: 50
    externalInput(i) = 1;  % externalInput is used to stimulate the excitatory unit in this chain
end

V = WilCo(externalInput,tGiven);
% above = V(:,5)>0.1;  % considering the threshold: thredhold/weight;
% sumAbove = find([above;0]+[0;above]==1);
% tOn = (sumAbove(2)-sumAbove(1))/100; Period = (sumAbove(3)-sumAbove(1))/100; f = 1/Period;
% response = [f,tOn];
% save('Response-wEX0.mat','tGiven','V','externalInput','response');

%% first display for the model unit
% display for the model unit
% figure(1)
% % plot(tGiven,V(:,1),'g-',tGiven,V(:,2),'b-',tGiven,V(:,3),'r:',tGiven,V(:,4),'g-','linewidth',1);
% plot(tGiven,V(:,1),'g-',tGiven,V(:,3),'r-',tGiven,V(:,4),'g--','linewidth',1);
% axis([0,2,0,1]); box off;
% % title('Neural activity of model unit');
% legend('E2','N1','E1');
% yticks([0 1]);% ylabel('Activity level');
% xticks([0 0.5 1 1.5 2]);xlabel('t','FontSize',12);
% set(gcf,'Position',[100 100 500 375]);
% print('F1_response','-djpeg','-r600');

%% second display for sequential connection
%% display for individual segmental result without X group
figure(1)
subplot(3,1,1)
plot(tGiven,V(:,5),'Color',[1 0.5 0]); hold on;
plot(tGiven,V(:,6),'g-');
set(gca,'xtick',[]); set(gca,'ytick',[]);
% title('Neural activity of model chain');
legend('I1','E1'); yticks([0 1]);
axis([tGiven(1),tGiven(end),0,1]); box off;
subplot(3,1,2)
plot(tGiven,V(:,3),'Color',[1 0.5 0]); hold on;
plot(tGiven,V(:,4),'g-');
set(gca,'xtick',[]); set(gca,'ytick',[]);
legend('I2','E2'); yticks([0 1]);
% ylabel('Activity levels');
axis([tGiven(1),tGiven(end),0,1]); box off;
subplot(3,1,3)
plot(tGiven,V(:,1),'Color',[1 0.5 0]); hold on;
plot(tGiven,V(:,2),'g-');
legend('I3','E3');
axis([tGiven(1),tGiven(end),0,1]); box off;
xlabel('t');yticks([0 1]);xticks([0 1 2 3 4 5]);
xlabel('t','FontSize',12);
set(gcf,'Position',[100 100 500 375]);
print('SF1_response','-djpeg','-r600');

%% third display for individual segmental result with X group
% figure(1)
% subplot(3,1,1)
% plot(tGiven,V(:,7),'r-',tGiven,V(:,8),'g-',tGiven,V(:,9),'b-');
% set(gca,'xtick',[]); set(gca,'ytick',[]);
% % title('Model activity');
% legend('N1','E1','X1'); yticks([0 1]);
% axis([tGiven(1),tGiven(end),0,1]); box off;
% subplot(3,1,2)
% plot(tGiven,V(:,4),'r-',tGiven,V(:,5),'g-',tGiven,V(:,6),'b-');
% set(gca,'xtick',[]); set(gca,'ytick',[]);
% legend('N2','E2','X2');
% yticks([0 1]); % ylabel('Activity levels');
% axis([tGiven(1),tGiven(end),0,1]); box off;
% subplot(3,1,3)
% plot(tGiven,V(:,1),'r-',tGiven,V(:,2),'g-',tGiven,V(:,3),'b-');
% legend('N3','E3','X3');
% axis([tGiven(1),tGiven(end),0,1]); box off;
% yticks([0 1]);xticks([0 1 2 3 4 5]);xlabel('t','FontSize',12);
% set(gcf,'Position',[100 100 500 375]);
% print('F2_response','-djpeg','-r600');

%% plot for the phase plane of third display
% figure(2)
% plot(V(:,4),V(:,5));
% title('Phase plane');
% axis([-0.1 1.1 -0.1 1.1]);
% xlabel('N2'); ylabel('E2'); box off;

toc