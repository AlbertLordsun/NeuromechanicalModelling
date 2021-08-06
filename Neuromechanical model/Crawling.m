%% visualizing the dynamics for larval forward crawling

%% plot position trajectory and save as gif
% Pos = csvread('Results5-116.csv',1,0);
% figure(1);
% pic_num = 1;
% for i = 1:112
%     s = 22*i-21; e = 22*i;
%     plot(Pos(s:e,1),480-Pos(s:e,2),'o');
%     set(0,'defaultfigurecolor','w');
%     axis([0 640 0 480]);
%     axis off;
%     
%     c=getframe(gcf);
%     C=frame2im(c);
%     [C,map]=rgb2ind(C,256);
%     if pic_num==1
%         imwrite(C,map,'CrawlingOL.gif','gif','loopcount',inf,'DelayTime',0.0001);
%     else
%         imwrite(C,map,'Crawling.gif','gif','writemode','append','DelayTime',0.0001);
%     end
% %     pause(0.001);
%     pic_num = pic_num+1;
%     %drawnow;
% end

%% read video, add label and save as avi
%% Video of left and right label dots for forward crawling
% Pos = csvread('Results5-116.csv',1,0);
% obj = VideoReader('CrawlingNL.avi');
% numFrames = obj.NumberOfFrame;
% writeObj = VideoWriter('CrawlingL.avi');
% open(writeObj);
% for i = 1: numFrames
%     frame = read(obj,i);
%     imshow(frame); hold on;
%     plot(Pos(22*i-21:22*i,1),Pos(22*i-21:22*i,2),'o','MarkerFaceColor','r');
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% Video of Middleline crawling for forward crawling
% Pos = csvread('Results5-116.csv',1,0);
% writeObj = VideoWriter('CrawlingOM.avi');
% open(writeObj);
% for i = 1:112
%     x = []; y = [];
%     xall = Pos(22*i-21:22*i,1); yall = 480-Pos(22*i-21:22*i,2);
%     x(1) =(Pos(22*i-21,1)+Pos(22*i-20,1))/2; y(1) =(Pos(22*i-21,2)+Pos(22*i-20,2))/2;
%     x(2) =(Pos(22*i-19,1)+Pos(22*i-18,1))/2; y(2) =(Pos(22*i-19,2)+Pos(22*i-18,2))/2;
%     x(3) =(Pos(22*i-17,1)+Pos(22*i-16,1))/2; y(3) =(Pos(22*i-17,2)+Pos(22*i-16,2))/2;
%     x(4) =(Pos(22*i-15,1)+Pos(22*i-14,1))/2; y(4) =(Pos(22*i-15,2)+Pos(22*i-14,2))/2;
%     x(5) =(Pos(22*i-13,1)+Pos(22*i-12,1))/2; y(5) =(Pos(22*i-13,2)+Pos(22*i-12,2))/2;
%     x(6) =(Pos(22*i-11,1)+Pos(22*i-10,1))/2; y(6) =(Pos(22*i-11,2)+Pos(22*i-10,2))/2;
%     x(7) =(Pos(22*i-9,1)+Pos(22*i-8,1))/2;   y(7) =(Pos(22*i-9,2)+Pos(22*i-8,2))/2;
%     x(8) =(Pos(22*i-7,1)+Pos(22*i-6,1))/2;   y(8) =(Pos(22*i-7,2)+Pos(22*i-6,2))/2;
%     x(9) =(Pos(22*i-5,1)+Pos(22*i-4,1))/2;   y(9) =(Pos(22*i-5,2)+Pos(22*i-4,2))/2;
%     x(10) =(Pos(22*i-3,1)+Pos(22*i-2,1))/2;  y(10) =(Pos(22*i-3,2)+Pos(22*i-2,2))/2;
%     x(11) =(Pos(22*i-1,1)+Pos(22*i,1))/2;    y(11) =(Pos(22*i-1,2)+Pos(22*i,2))/2;
%     plot(x,480-y,'o','MarkerFaceColor','r');
% %     hold on;
%     set(0,'defaultfigurecolor','w');
%     axis([0 640 0 480]);
%     axis off;
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% Video of Kymograph for forward crawling
% Pos = csvread('Results5-116.csv',1,0);
% x0 = (Pos(1,1)+Pos(2,1))/2; y0 = (Pos(1,2)+Pos(2,2))/2;
% writeObj = VideoWriter('CrawlingT.avi');
% open(writeObj);
% for i =1:112
%     x = []; y = []; d = [];
%     x(1) =(Pos(22*i-21,1)+Pos(22*i-20,1))/2; y(1) =(Pos(22*i-21,2)+Pos(22*i-20,2))/2;
%     x(2) =(Pos(22*i-19,1)+Pos(22*i-18,1))/2; y(2) =(Pos(22*i-19,2)+Pos(22*i-18,2))/2;
%     x(3) =(Pos(22*i-17,1)+Pos(22*i-16,1))/2; y(3) =(Pos(22*i-17,2)+Pos(22*i-16,2))/2;
%     x(4) =(Pos(22*i-15,1)+Pos(22*i-14,1))/2; y(4) =(Pos(22*i-15,2)+Pos(22*i-14,2))/2;
%     x(5) =(Pos(22*i-13,1)+Pos(22*i-12,1))/2; y(5) =(Pos(22*i-13,2)+Pos(22*i-12,2))/2;
%     x(6) =(Pos(22*i-11,1)+Pos(22*i-10,1))/2; y(6) =(Pos(22*i-11,2)+Pos(22*i-10,2))/2;
%     x(7) =(Pos(22*i-9,1)+Pos(22*i-8,1))/2;   y(7) =(Pos(22*i-9,2)+Pos(22*i-8,2))/2;
%     x(8) =(Pos(22*i-7,1)+Pos(22*i-6,1))/2;   y(8) =(Pos(22*i-7,2)+Pos(22*i-6,2))/2;
%     x(9) =(Pos(22*i-5,1)+Pos(22*i-4,1))/2;   y(9) =(Pos(22*i-5,2)+Pos(22*i-4,2))/2;
%     x(10) =(Pos(22*i-3,1)+Pos(22*i-2,1))/2;  y(10) =(Pos(22*i-3,2)+Pos(22*i-2,2))/2;
%     x(11) =(Pos(22*i-1,1)+Pos(22*i,1))/2;    y(11) =(Pos(22*i-1,2)+Pos(22*i,2))/2;
%     d(1) = sqrt((x(1)-x0)^2+(y(1)-y0)^2);
%     d(2) = sqrt((x(2)-x0)^2+(y(2)-y0)^2);
%     d(3) = sqrt((x(3)-x0)^2+(y(3)-y0)^2);
%     d(4) = sqrt((x(4)-x0)^2+(y(4)-y0)^2);
%     d(5) = sqrt((x(5)-x0)^2+(y(5)-y0)^2);
%     d(6) = sqrt((x(6)-x0)^2+(y(6)-y0)^2);
%     d(7) = sqrt((x(7)-x0)^2+(y(7)-y0)^2);
%     d(8) = sqrt((x(8)-x0)^2+(y(8)-y0)^2);
%     d(9) = sqrt((x(9)-x0)^2+(y(9)-y0)^2);
%     d(10) = sqrt((x(10)-x0)^2+(y(10)-y0)^2);
%     d(11) = sqrt((x(11)-x0)^2+(y(11)-y0)^2);
%     plot(i,d(1),'r.',i,d(2),'g.',i,d(3),'b.',i,d(4),'c.',...
%         i,d(5),'m.',i,d(6),'y.',i,d(7),'k.',i,d(8),'r.',...
%         i,d(9),'g.',i,d(10),'b.',i,d(11),'c.','MarkerSize',15);
%     set(0,'defaultfigurecolor','w');
%     axis([0 112 0 600]); xlabel('Time frame'); ylabel('Displacements on the picture');
% %     axis off;
%     box off;
%     hold on;
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% Kymograph for forward crawling, compared with the real larvae
% Pos = csvread('Results5-116.csv',1,0);
% x0 = (Pos(1,1)+Pos(2,1))/2; y0 = (Pos(1,2)+Pos(2,2))/2;
% writeObj = VideoWriter('CrawlingHTD.avi');
% open(writeObj);
% for i =1:90
%     x = []; y = []; d = [];
%     x(1) =(Pos(22*i-21,1)+Pos(22*i-20,1))/2; y(1) =(Pos(22*i-21,2)+Pos(22*i-20,2))/2;
%     x(2) =(Pos(22*i-19,1)+Pos(22*i-18,1))/2; y(2) =(Pos(22*i-19,2)+Pos(22*i-18,2))/2;
%     x(3) =(Pos(22*i-17,1)+Pos(22*i-16,1))/2; y(3) =(Pos(22*i-17,2)+Pos(22*i-16,2))/2;
%     x(4) =(Pos(22*i-15,1)+Pos(22*i-14,1))/2; y(4) =(Pos(22*i-15,2)+Pos(22*i-14,2))/2;
%     x(5) =(Pos(22*i-13,1)+Pos(22*i-12,1))/2; y(5) =(Pos(22*i-13,2)+Pos(22*i-12,2))/2;
%     x(6) =(Pos(22*i-11,1)+Pos(22*i-10,1))/2; y(6) =(Pos(22*i-11,2)+Pos(22*i-10,2))/2;
%     x(7) =(Pos(22*i-9,1)+Pos(22*i-8,1))/2;   y(7) =(Pos(22*i-9,2)+Pos(22*i-8,2))/2;
%     x(8) =(Pos(22*i-7,1)+Pos(22*i-6,1))/2;   y(8) =(Pos(22*i-7,2)+Pos(22*i-6,2))/2;
%     x(9) =(Pos(22*i-5,1)+Pos(22*i-4,1))/2;   y(9) =(Pos(22*i-5,2)+Pos(22*i-4,2))/2;
%     x(10) =(Pos(22*i-3,1)+Pos(22*i-2,1))/2;  y(10) =(Pos(22*i-3,2)+Pos(22*i-2,2))/2;
%     x(11) =(Pos(22*i-1,1)+Pos(22*i,1))/2;    y(11) =(Pos(22*i-1,2)+Pos(22*i,2))/2;
%     d(1) = sqrt((x(1)-x0)^2+(y(1)-y0)^2);
%     d(2) = sqrt((x(2)-x0)^2+(y(2)-y0)^2);
%     d(3) = sqrt((x(3)-x0)^2+(y(3)-y0)^2);
%     d(4) = sqrt((x(4)-x0)^2+(y(4)-y0)^2);
%     d(5) = sqrt((x(5)-x0)^2+(y(5)-y0)^2);
%     d(6) = sqrt((x(6)-x0)^2+(y(6)-y0)^2);
%     d(7) = sqrt((x(7)-x0)^2+(y(7)-y0)^2);
%     d(8) = sqrt((x(8)-x0)^2+(y(8)-y0)^2);
%     d(9) = sqrt((x(9)-x0)^2+(y(9)-y0)^2);
%     d(10) = sqrt((x(10)-x0)^2+(y(10)-y0)^2);
%     d(11) = sqrt((x(11)-x0)^2+(y(11)-y0)^2);
%     set(0,'defaultfigurecolor','w');set(gcf,'Position',[100 100 485 379]);
%     plot(i/30,d(1)/84,'r.',i/30,d(2)/84,'g.',i/30,d(3)/84,'b.',i/30,d(4)/84,'c.',...
%         i/30,d(5)/84,'m.',i/30,d(6)/84,'y.',i/30,d(7)/84,'k.',i/30,d(8)/84,'r.',...
%         i/30,d(9)/84,'g.',i/30,d(10)/84,'b.',i/30,d(11)/84,'c.','MarkerSize',15);
% %     plot(i/30,d(11)/84-d(1)/84,'r.','MarkerSize',15);
%     axis([0 3 0 6]); xlabel('Time/s','FontSize',12); ylabel('Displacements/mm','FontSize',12);
% %     axis off;
%     box off;
%     hold on;
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);
% print('F_Kymograph','-djpeg','-r600');

%% Kymograph for forward crawling, compared with the real larvae
% clc; clear all; % considering the standard displacement
% Pos = csvread('Results5-116.csv',1,0);
% t = (0:90)/30;
% x = []; y = []; d = [];
% for i =1:91
%     x(i,1) =(Pos(22*i-21,1)+Pos(22*i-20,1))/2; y(i,1) =(Pos(22*i-21,2)+Pos(22*i-20,2))/2;
%     x(i,2) =(Pos(22*i-19,1)+Pos(22*i-18,1))/2; y(i,2) =(Pos(22*i-19,2)+Pos(22*i-18,2))/2;
%     x(i,3) =(Pos(22*i-17,1)+Pos(22*i-16,1))/2; y(i,3) =(Pos(22*i-17,2)+Pos(22*i-16,2))/2;
%     x(i,4) =(Pos(22*i-15,1)+Pos(22*i-14,1))/2; y(i,4) =(Pos(22*i-15,2)+Pos(22*i-14,2))/2;
%     x(i,5) =(Pos(22*i-13,1)+Pos(22*i-12,1))/2; y(i,5) =(Pos(22*i-13,2)+Pos(22*i-12,2))/2;
%     x(i,6) =(Pos(22*i-11,1)+Pos(22*i-10,1))/2; y(i,6) =(Pos(22*i-11,2)+Pos(22*i-10,2))/2;
%     x(i,7) =(Pos(22*i-9,1)+Pos(22*i-8,1))/2;   y(i,7) =(Pos(22*i-9,2)+Pos(22*i-8,2))/2;
%     x(i,8) =(Pos(22*i-7,1)+Pos(22*i-6,1))/2;   y(i,8) =(Pos(22*i-7,2)+Pos(22*i-6,2))/2;
%     x(i,9) =(Pos(22*i-5,1)+Pos(22*i-4,1))/2;   y(i,9) =(Pos(22*i-5,2)+Pos(22*i-4,2))/2;
%     x(i,10) =(Pos(22*i-3,1)+Pos(22*i-2,1))/2;  y(i,10) =(Pos(22*i-3,2)+Pos(22*i-2,2))/2;
%     x(i,11) =(Pos(22*i-1,1)+Pos(22*i,1))/2;    y(i,11) =(Pos(22*i-1,2)+Pos(22*i,2))/2;
%     if i == 1
%         for j =1:11
%             d(i,j) = sqrt((x(i,j)-x(i,1))^2+(y(i,j)-y(i,1))^2);
%         end
%     else
%         d(i,1) = sqrt((x(i,1)-x(i-1,1))^2+(y(i,1)-y(i-1,1))^2);
%         d(i,2) = sqrt((x(i,2)-x(i-1,2))^2+(y(i,2)-y(i-1,2))^2);
%         d(i,3) = sqrt((x(i,3)-x(i-1,3))^2+(y(i,3)-y(i-1,3))^2);
%         d(i,4) = sqrt((x(i,4)-x(i-1,4))^2+(y(i,4)-y(i-1,4))^2);
%         d(i,5) = sqrt((x(i,5)-x(i-1,5))^2+(y(i,5)-y(i-1,5))^2);
%         d(i,6) = sqrt((x(i,6)-x(i-1,6))^2+(y(i,6)-y(i-1,6))^2);
%         d(i,7) = sqrt((x(i,7)-x(i-1,7))^2+(y(i,7)-y(i-1,7))^2);
%         d(i,8) = sqrt((x(i,8)-x(i-1,8))^2+(y(i,8)-y(i-1,8))^2);
%         d(i,9) = sqrt((x(i,9)-x(i-1,9))^2+(y(i,9)-y(i-1,9))^2);
%         d(i,10) = sqrt((x(i,10)-x(i-1,10))^2+(y(i,10)-y(i-1,10))^2);
%         d(i,11) = sqrt((x(i,11)-x(i-1,11))^2+(y(i,11)-y(i-1,11))^2);
%     end
% end
% dis = d(1,:);
% for i=2:91
%     dis(i,:) = dis(i-1,:)+d(i,:);
% end
% figure(1)
% plot(t,dis/84);

%% kymograph for other larvae 2,3,4
% clc; clear all; close all;
% Pos = csvread('Results1-5-116.csv',1,0); % here the last number is 0 for 1, and 1 for others.
% t = (0:111)/30;
% x = []; y = []; d = [];
% for i =1:112
%     for n = 1:11
%         x(i,n) = (Pos(22*i-23+2*n,1)+Pos(22*i-22+2*n,1))/2; y(i,n) =(Pos(22*i-23+2*n,2)+Pos(22*i-22+2*n,2))/2;
%         d(i,n) = sqrt((x(i,n)-x(1,1))^2+(y(i,n)-y(1,1))^2);
%     end
% 
% end
% 
% figure(1)
% plot(t,d/84,'.','MarkerSize',15);
% stride duration:
% 1) 1s; 1.1s; 1.1333s; 2) 1.07s; 3) 1s; 4) 1s;
% velocity:
% 1) 1.001mm/s; 2)0.8085mm/s; 3) 0.6862mm/s 4) 0.6542mm/s;
% average value: 

%% plotting when we refering to the first point along the trajectory
clc; clear all; close all;
Pos = csvread('Data/Results1-5-116.csv',1,0);
t = (0:90)/30;
x = []; y = []; d = [];
for i =1:91
    x(i,1) =(Pos(22*i-21,1)+Pos(22*i-20,1))/2; y(i,1) =(Pos(22*i-21,2)+Pos(22*i-20,2))/2;
    x(i,2) =(Pos(22*i-19,1)+Pos(22*i-18,1))/2; y(i,2) =(Pos(22*i-19,2)+Pos(22*i-18,2))/2;
    x(i,3) =(Pos(22*i-17,1)+Pos(22*i-16,1))/2; y(i,3) =(Pos(22*i-17,2)+Pos(22*i-16,2))/2;
    x(i,4) =(Pos(22*i-15,1)+Pos(22*i-14,1))/2; y(i,4) =(Pos(22*i-15,2)+Pos(22*i-14,2))/2;
    x(i,5) =(Pos(22*i-13,1)+Pos(22*i-12,1))/2; y(i,5) =(Pos(22*i-13,2)+Pos(22*i-12,2))/2;
    x(i,6) =(Pos(22*i-11,1)+Pos(22*i-10,1))/2; y(i,6) =(Pos(22*i-11,2)+Pos(22*i-10,2))/2;
    x(i,7) =(Pos(22*i-9,1)+Pos(22*i-8,1))/2;   y(i,7) =(Pos(22*i-9,2)+Pos(22*i-8,2))/2;
    x(i,8) =(Pos(22*i-7,1)+Pos(22*i-6,1))/2;   y(i,8) =(Pos(22*i-7,2)+Pos(22*i-6,2))/2;
    x(i,9) =(Pos(22*i-5,1)+Pos(22*i-4,1))/2;   y(i,9) =(Pos(22*i-5,2)+Pos(22*i-4,2))/2;
    x(i,10) =(Pos(22*i-3,1)+Pos(22*i-2,1))/2;  y(i,10) =(Pos(22*i-3,2)+Pos(22*i-2,2))/2;
    x(i,11) =(Pos(22*i-1,1)+Pos(22*i,1))/2;    y(i,11) =(Pos(22*i-1,2)+Pos(22*i,2))/2;
    for j = 1:11
        d(i,j) = sqrt((x(i,j)-x(1,1))^2+(y(i,j)-y(1,1))^2)/84;
    end
end
SD = []; % segmental distance
for i=1:10
    SD(:,i) = d(:,i+1)-d(:,i);
end

figure(1) % segmental kymograph
plot(t,d/84,'.','MarkerSize',15);

figure(2) % segmental dynamcis
[Res1, pos1] = tight_subplot(5,1,[.025 .03],[.1 .05],[.1 .53]); 
axes(Res1(1)); plot(t,SD(:,10)); box off; ylabel('T2','FontSize',11); ylim([0 0.5]); set(Res1(1),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res1(2)); plot(t,SD(:,9)); box off; ylabel('T3','FontSize',11); ylim([0 0.5]); set(Res1(2),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res1(3)); plot(t,SD(:,8)); box off; ylabel('A1','FontSize',11); ylim([0 0.5]); set(Res1(3),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res1(4)); plot(t,SD(:,7)); box off; ylabel('A2','FontSize',11); ylim([0 0.5]); set(Res1(4),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res1(5)); plot(t,SD(:,6)); box off; ylabel('A3','FontSize',11); ylim([0 0.5]); xlabel('Time/s','FontSize',11);
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
[Res2, pos2] = tight_subplot(5,1,[.025 .03],[.1 .05],[.58 .05]);
axes(Res2(1)); plot(t,SD(:,5)); box off; ylabel('A4','FontSize',11); ylim([0 0.5]); set(Res2(1),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res2(2)); plot(t,SD(:,4)); box off; ylabel('A5','FontSize',11); ylim([0 0.5]); set(Res2(2),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res2(3)); plot(t,SD(:,3)); box off; ylabel('A6','FontSize',11); ylim([0 0.5]); set(Res2(3),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res2(4)); plot(t,SD(:,2)); box off; ylabel('A7','FontSize',11); ylim([0 0.5]); set(Res2(4),'xtick','');
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
axes(Res2(5)); plot(t,SD(:,1)); box off; ylabel('A8','FontSize',11); ylim([0 0.5]); xlabel('Time/s','FontSize',11);
set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
set(gcf,'Position',[100 100 500 375]);
print('F1E_Segmental dynamics','-djpeg','-r600');

figure(3)
subplot(1,2,1);
MN1 = [max(SD(:,6)),min(SD(:,6)); max(SD(:,7)),min(SD(:,7)); max(SD(:,8)),...
       min(SD(:,8)); max(SD(:,9)),min(SD(:,9)); max(SD(:,10)),min(SD(:,10))];
h1 = barh(MN1); xlim([0 0.6]); xticks(0:0.2:0.6); box off;
yticklabels({'A3','A2','A1','T3','T2'});xlabel('Length/mm','FontSize',12);
subplot(1,2,2);
MN2 = [max(SD(:,1)),min(SD(:,1)); max(SD(:,2)),min(SD(:,2)); max(SD(:,3)),...
       min(SD(:,3)); max(SD(:,4)),min(SD(:,4)); max(SD(:,5)),min(SD(:,5))];
h2 = barh(MN2); xlim([0 0.6]); xticks(0:0.2:0.6); box off;
yticklabels({'A8','A7','A6','A5','A4'});xlabel('Length/mm','FontSize',12);
legend(fliplr(h2),{'min','max'},'Location','northeast');
set(gcf,'Position',[100 100 500 375]);
print('F1E_Segmental length in bar','-djpeg','-r600');
Ave_contraction = (sum(MN1(:,1)+MN2(:,1))-MN2(1,1))/(9*0.4);

figure(4)
% below1 = SD(:,1)<0.4; sumbelow1 = find([below1;0]+[0;below1]==1); Con1_t = (sumbelow1(2)-sumbelow1(1)-1);
below2 = SD(:,2)<0.4; sumbelow2 = find([below2;0]+[0;below2]==1); Con2_t = (sumbelow2(4)-sumbelow2(3)-1)/30;
below3 = SD(:,3)<0.4; sumbelow3 = find([below3;0]+[0;below3]==1); Con3_t = (sumbelow3(4)-sumbelow3(3)-1)/30;
below4 = SD(:,4)<0.4; sumbelow4 = find([below4;0]+[0;below4]==1); Con4_t = (sumbelow4(2)-sumbelow4(1)-1)/30;
below5 = SD(:,5)<0.4; sumbelow5 = find([below5;0]+[0;below5]==1); Con5_t = (sumbelow5(2)-sumbelow5(1)-1)/30;
below6 = SD(:,6)<0.4; sumbelow6 = find([below6;0]+[0;below6]==1); Con6_t = (sumbelow6(4)-sumbelow6(3)-1)/30;
below7 = SD(:,7)<0.4; sumbelow7 = find([below7;0]+[0;below7]==1); Con7_t = (sumbelow7(4)-sumbelow7(3)-1)/30;
below8 = SD(:,8)<0.4; sumbelow8 = find([below8;0]+[0;below8]==1); Con8_t = (sumbelow8(4)-sumbelow8(3)-1)/30;
below9 = SD(:,9)<0.4; sumbelow9 = find([below9;0]+[0;below9]==1); Con9_t = (sumbelow9(4)-sumbelow9(3)-1)/30;
% below10 = SD(:,10)<0.4; sumbelow10 = find([below10;0]+[0;below10]==1); Con10_t = (sumbelow10(2)-sumbelow10(1)-1)/30;
subplot(1,2,1);
MN1 = [Con6_t; Con7_t; Con8_t; Con9_t];
barh(MN1); xlim([0 1]); xticks(0:0.5:1); box off;
yticklabels({'A3','A2','A1','T3'});xlabel('Time/s','FontSize',12);
subplot(1,2,2);
MN2 = [Con2_t; Con3_t; Con4_t; Con5_t];
barh(MN2); xlim([0 1]); xticks(0:0.5:1); box off;
yticklabels({'A7','A6','A5','A4'});xlabel('Time/s','FontSize',12);
set(gcf,'Position',[100 100 500 375]);
print('F1E_Contraction duration','-djpeg','-r600');
Aver_con_t = (Con6_t+Con7_t+Con8_t+Con9_t+Con2_t+Con3_t+Con4_t+Con5_t)/8;   %% average contraction time;

figure(5)
subplot(4,2,1); plot(t, below9); ylabel('T3');
subplot(4,2,2); plot(t, below8); ylabel('A1');
subplot(4,2,3); plot(t, below7); ylabel('A2');
subplot(4,2,4); plot(t, below6); ylabel('A3');
subplot(4,2,5); plot(t, below5); ylabel('A4');
subplot(4,2,6); plot(t, below4); ylabel('A5');
subplot(4,2,7); plot(t, below3); ylabel('A6');
subplot(4,2,8); plot(t, below2); ylabel('A7');
% larval 1
% TD_A1T3 = (sumbelow9(4)-sumbelow8(4))/30*1000; % time delay in millisecond scale
% TD_A2A1 = (sumbelow8(4)-sumbelow7(4))/30*1000;
% TD_A3A2 = (sumbelow7(4)-sumbelow6(4))/30*1000;
% TD_A4A3 = (sumbelow6(4)-sumbelow5(2))/30*1000;
% TD_A5A4 = (sumbelow5(2)-sumbelow4(2))/30*1000;
% TD_A6A5 = (sumbelow4(2)-sumbelow3(4))/30*1000;
% TD_A7A6 = (sumbelow3(4)-sumbelow2(2))/30*1000;
% larval 2
% TD_A1T3 = (sumbelow9(4)-sumbelow8(8))/30*1000;
% TD_A2A1 = (sumbelow8(8)-sumbelow7(6))/30*1000;
% TD_A3A2 = (sumbelow7(6)-sumbelow6(8))/30*1000;
% TD_A4A3 = (sumbelow6(8)-sumbelow5(2))/30*1000;
% TD_A5A4 = (sumbelow5(2)-sumbelow4(2))/30*1000;
% TD_A6A5 = (sumbelow4(2)-sumbelow3(2))/30*1000;
% TD_A7A6 = (sumbelow3(2)-sumbelow2(2))/30*1000;
% larval 3
TD_A1T3 = (sumbelow9(4)-sumbelow8(4))/30*1000;
TD_A2A1 = (sumbelow8(4)-sumbelow7(2))/30*1000;
TD_A3A2 = (sumbelow7(2)-sumbelow6(2))/30*1000;
TD_A4A3 = (sumbelow6(2)-sumbelow5(2))/30*1000;
TD_A5A4 = (sumbelow5(2)-sumbelow4(2))/30*1000;
TD_A6A5 = (sumbelow4(2)-sumbelow3(4))/30*1000;
TD_A7A6 = (sumbelow3(4)-sumbelow2(2))/30*1000;
Ave_TD = (TD_A1T3+TD_A2A1 +TD_A3A2 +TD_A4A3 +TD_A5A4 +TD_A6A5 +TD_A7A6)/7; % average time delay
%% value 