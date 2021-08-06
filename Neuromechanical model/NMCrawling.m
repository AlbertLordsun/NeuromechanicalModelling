%% video display for base configuration
% writeObj = VideoWriter('NMCrawlingB.avi');
% open(writeObj);
% figure(3);
% d = [v(:,1)+7 v(:,3)+6 v(:,5)+5 v(:,7)+4 v(:,9)+3 v(:,11)+2 v(:,13)+1 v(:,15)];
% t = zeros(1,8);
% h = plot(d(1,:),t,'b--.','MarkerSize',25);
% axis([0 20 -1 1])
% axis off;
% for i = 2: 200
%     set(h,'XData',d(i*100-99,:));
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% video display for different mass configuration
% writeObj = VideoWriter('NMCrawlingM0.5-2-8.avi');
% open(writeObj);
% figure(1);
% m1 = load('Response-m0.5.mat');
% m2 = load('Response-m2.mat');
% m3 = load('Response-m8.mat');
% d1 = [m1.v(:,1)+7 m1.v(:,3)+6 m1.v(:,5)+5 m1.v(:,7)+4 m1.v(:,9)+3 m1.v(:,11)+2 m1.v(:,13)+1 m1.v(:,15)];
% d2 = [m2.v(:,1)+7 m2.v(:,3)+6 m2.v(:,5)+5 m2.v(:,7)+4 m2.v(:,9)+3 m2.v(:,11)+2 m2.v(:,13)+1 m2.v(:,15)];
% d3 = [m3.v(:,1)+7 m3.v(:,3)+6 m3.v(:,5)+5 m3.v(:,7)+4 m3.v(:,9)+3 m3.v(:,11)+2 m3.v(:,13)+1 m3.v(:,15)];
% t1 = zeros(1,8);
% t2 = -1*ones(1,8);
% t3 = -2*ones(1,8);
% for i = 1: 200
%     plot(d1(i*100-99,:),t1,'r--.',d2(i*100-99,:),t2,'c--.',d3(i*100-99,:),t3,'b--.','MarkerSize',25);
%     axis([-1 20 -3 1]);
%     axis off; 
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% video display for different environmental condition configuration
% writeObj = VideoWriter('NMCrawlingFf0-0.000025-0.0001.avi');
% open(writeObj);
% figure(1);
% m1 = load('Response-Ff0.mat');
% m2 = load('Response-Ff0.000025.mat');
% m3 = load('Response-Ff0.0001.mat');
% d1 = [m1.v(:,1)+7 m1.v(:,3)+6 m1.v(:,5)+5 m1.v(:,7)+4 m1.v(:,9)+3 m1.v(:,11)+2 m1.v(:,13)+1 m1.v(:,15)];
% d2 = [m2.v(:,1)+7 m2.v(:,3)+6 m2.v(:,5)+5 m2.v(:,7)+4 m2.v(:,9)+3 m2.v(:,11)+2 m2.v(:,13)+1 m2.v(:,15)];
% d3 = [m3.v(:,1)+7 m3.v(:,3)+6 m3.v(:,5)+5 m3.v(:,7)+4 m3.v(:,9)+3 m3.v(:,11)+2 m3.v(:,13)+1 m3.v(:,15)];
% t1 = zeros(1,8);
% t2 = -1*ones(1,8);
% t3 = -2*ones(1,8);
% for i = 1: 200
%     plot(d1(i*100-99,:),t1,'r--.',d2(i*100-99,:),t2,'c--.',d3(i*100-99,:),t3,'b--.','MarkerSize',25);
%     axis([-1 20 -3 1]);
%     axis off; 
%     frame = getframe;
%     writeVideo(writeObj,frame);
%     drawnow;
% end
% close(writeObj);

%% video display for different feedback configuration
writeObj = VideoWriter('NMCrawlingWith-Without-feedback.avi');
open(writeObj);
figure(1);
m1 = load('Response-withoutfeedback.mat');
m2 = load('Response-withfeedback.mat');
d1 = [m1.v(:,1)+7 m1.v(:,3)+6 m1.v(:,5)+5 m1.v(:,7)+4 m1.v(:,9)+3 m1.v(:,11)+2 m1.v(:,13)+1 m1.v(:,15)];
d2 = [m2.v(:,1)+7 m2.v(:,3)+6 m2.v(:,5)+5 m2.v(:,7)+4 m2.v(:,9)+3 m2.v(:,11)+2 m2.v(:,13)+1 m2.v(:,15)];
t1 = zeros(1,8);
t2 = -1*ones(1,8);
for i = 1: 200
    plot(d1(i*100-99,:),t1,'r--.',d2(i*100-99,:),t2,'c--.','MarkerSize',25);
    axis([-1 20 -2 1]);
    axis off; 
    frame = getframe;
    writeVideo(writeObj,frame);
    drawnow;
end
close(writeObj);