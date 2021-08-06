% visualing the dynamics for the larval floating

%% left and right label dots for forward crawling
% Pos = csvread('Results360-474.csv',1,0);
% obj = VideoReader('FloatingNL.avi');
% numFrames = obj.NumberOfFrame;
% writeObj = VideoWriter('FloatingOL.avi');
% open(writeObj);
% for i = 1: numFrames
%     frame = read(obj,i);
%     imshow(frame); hold on;
%     plot(Pos(14*i-13:14*i,1),Pos(14*i-13:14*i,2),'o','MarkerFaceColor','r');
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% only  plot left and right label dots for forward crawling
% Pos = csvread('Results360-474.csv',1,0);
% writeObj = VideoWriter('FloatingOL.avi');
% open(writeObj);
% for i = 1: 115
%     plot(Pos(14*i-13:14*i,1),480-Pos(14*i-13:14*i,2),'o','MarkerFaceColor','r');
%     set(0,'defaultfigurecolor','w');
%     axis([0 640 0 480]);
%     axis off;
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% Middleline crawling for forward crawling
% Pos = csvread('Results360-474.csv',1,0);
% writeObj = VideoWriter('FloatingOMT.avi');
% open(writeObj);
% for i = 1:115
%     x = []; y = [];
%     x(1) =(Pos(14*i-13,1)+Pos(14*i-12,1))/2; y(1) =(Pos(14*i-13,2)+Pos(14*i-12,2))/2;
%     x(2) =(Pos(14*i-11,1)+Pos(14*i-10,1))/2; y(2) =(Pos(14*i-11,2)+Pos(14*i-10,2))/2;
%     x(3) =(Pos(14*i-9,1)+Pos(14*i-8,1))/2; y(3) =(Pos(14*i-9,2)+Pos(14*i-8,2))/2;
%     x(4) =(Pos(14*i-7,1)+Pos(14*i-6,1))/2; y(4) =(Pos(14*i-7,2)+Pos(14*i-6,2))/2;
%     x(5) =(Pos(14*i-5,1)+Pos(14*i-4,1))/2; y(5) =(Pos(14*i-5,2)+Pos(14*i-4,2))/2;
%     x(6) =(Pos(14*i-3,1)+Pos(14*i-2,1))/2; y(6) =(Pos(14*i-3,2)+Pos(14*i-2,2))/2;
%     x(7) =(Pos(14*i-1,1)+Pos(14*i,1))/2;   y(7) =(Pos(14*i-1,2)+Pos(14*i,2))/2;
%     plot(x,480-y,'o','MarkerFaceColor','r');
%     hold on;
%     set(0,'defaultfigurecolor','w');
%     axis([0 640 0 480]);
%     axis off;
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% Kymograph for forward crawling
Pos = csvread('ResultsF-360-474.csv',1,0);
x0 = (Pos(13,1)+Pos(14,1))/2; y0 = (Pos(13,2)+Pos(14,2))/2;
writeObj = VideoWriter('FloatingT.avi');
open(writeObj);
for i =1:115
    x = []; y = []; d = [];
    x(1) =(Pos(14*i-13,1)+Pos(14*i-12,1))/2; y(1) =(Pos(14*i-13,2)+Pos(14*i-12,2))/2;
    x(2) =(Pos(14*i-11,1)+Pos(14*i-10,1))/2; y(2) =(Pos(14*i-11,2)+Pos(14*i-10,2))/2;
    x(3) =(Pos(14*i-9,1)+Pos(14*i-8,1))/2; y(3) =(Pos(14*i-9,2)+Pos(14*i-8,2))/2;
    x(4) =(Pos(14*i-7,1)+Pos(14*i-6,1))/2; y(4) =(Pos(14*i-7,2)+Pos(14*i-6,2))/2;
    x(5) =(Pos(14*i-5,1)+Pos(14*i-4,1))/2; y(5) =(Pos(14*i-5,2)+Pos(14*i-4,2))/2;
    x(6) =(Pos(14*i-3,1)+Pos(14*i-2,1))/2; y(6) =(Pos(14*i-3,2)+Pos(14*i-2,2))/2;
    x(7) =(Pos(14*i-1,1)+Pos(14*i,1))/2;   y(7) =(Pos(14*i-1,2)+Pos(14*i,2))/2;

    d(1) = sqrt((x(1)-x0)^2+(y(1)-y0)^2);
    d(2) = sqrt((x(2)-x0)^2+(y(2)-y0)^2);
    d(3) = sqrt((x(3)-x0)^2+(y(3)-y0)^2);
    d(4) = sqrt((x(4)-x0)^2+(y(4)-y0)^2);
    d(5) = sqrt((x(5)-x0)^2+(y(5)-y0)^2);
    d(6) = sqrt((x(6)-x0)^2+(y(6)-y0)^2);
    d(7) = sqrt((x(7)-x0)^2+(y(7)-y0)^2);
    plot(i/30,d(1)/84,'r.',i/30,d(2)/84,'g.',i/30,d(3)/84,'b.',i/30,d(4)/84,'c.',...
        i/30,d(5)/84,'m.',i/30,d(6)/84,'y.','MarkerSize',15);
    hold on;
    plot(i/30,d(7)/84,'.','MarkerEdgeColor',[1 0.5 0],'MarkerFaceColor',[1 0.5 0],'MarkerSize',15);
%     plot(i,d(1),'r.',i,d(2),'g.',i,d(3),'b.',i,d(4),'c.',...
%         i,d(5),'m.',i,d(6),'y.',i,d(7),'k.','MarkerSize',15);
    set(0,'defaultfigurecolor','w');set(gcf,'Position',[100 100 485 379]);
    axis([0 4 0 3]); xlabel('Time/s','FontSize',12); ylabel('Displacement/mm','FontSize',12);
%     axis off;
    box off;
    hold on;
    frame = getframe;
    writeVideo(writeObj,frame);
    drawnow;
end
close(writeObj);
print('F_Kymograph floating','-djpeg','-r600');