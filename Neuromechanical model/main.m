%% main program for the neuromechanical model
clc; 
clear all;
close all;
tic

% parameter configuration and calculation
N = 300; td = 0.01;
t = td: td: N*td;
externalInput = zeros(N,1);
for i = 1 : 5
    externalInput(i) = 1; % externalInput is used to stimulate the excitatory unit in this chain
end

v = NM(externalInput,t);
% L = 1; % with the normalized length, we use it for plotting in figures
L = 0.4; % corresponding to the actual parameter of larval segmental length

above1 = v(:,37)>0.1;  % tension5 signal
sumAbove1 = find([above1;0]+[0;above1]==1);
Ton_t = (sumAbove1(2)-sumAbove1(1)-1)/100; P1 = (sumAbove1(3)-sumAbove1(1)-1)/100;  % Time for activation; and stride duration;
above2 = v(:,51)>0.1;  % E5 signal
sumAbove2 = find([above2;0]+[0;above2]==1);
Ton_E = (sumAbove2(2)-sumAbove2(1)-1)/100; P2 = (sumAbove2(3)-sumAbove2(1)-1)/100;
above3 = v(:,52)>0.1;  % N5 signal
sumAbove3 = find([above3;0]+[0;above3]==1);
Ton_N = (sumAbove3(2)-sumAbove3(1)-1)/100; P3 = (sumAbove3(3)-sumAbove3(1)-1)/100;
above4 = v(:,36)>0.1; % tension 4;
sumAbove4 = find([above4;0]+[0;above4]==1);
TDelay = (sumAbove4(1)-sumAbove1(1)-1)/100;
response = [P1, P2, P3, 1/P1, 1/P2, 1/P3, ...   % period and frequency of t4, E4, N4
                       Ton_t, Ton_E, Ton_N, TDelay, TDelay/P1, ...  % On_time duration of t5, E5, N5, time delay and phase delay
                       max(v(:,9)+1-v(:,11)), min(v(:,9)+1-v(:,11)), v(300,21)/3, v(1+100*P2,9)-v(1,9)]';    % contraction range max, min and velocity, stride length;
% save('Response.mat','v','response');

%% result display
%% second is for the display of the integration of neural circuit and mechanical model
%% figure 1 includes activities of NN, muscle, displacement and friction
figure(1)
% ativity of neural circuit
[Res1, pos1] = tight_subplot(10,1,[.01 .03],[.7 .05],[.1 .53]); 
for i = 1:10; axes(Res1(i)); plot(t,v(:,2*i+41),'g-',t,v(:,2*i+42),'r--'); box off; ylabel(['E' num2str(i) 'I' num2str(i)]); end
% yticks([0 1]); yticklabels({'0','1'}); 
xlabel('t'); title(Res1(1),'Neuron activity'); set(Res1(1:9), 'xtick',''); set(Res1(1:10),'ytick','');
% activity of muscle tension
[Res2, pos2] = tight_subplot(10,1,[.01 .03],[.7 .05],[.53 .1]); 
for i = 1:10; axes(Res2(i)); plot(t,v(:,i+32)); box off; ylabel(['t' num2str(i)]); end
% yticks([0 1]); yticklabels({'0','t_m_a_x'}); 
xlabel('t'); title(Res2(1),'Muscle tension'); set(Res2(1:9), 'xtick',''); set(Res2(1:10),'ytick','');
% segmental displacement
[Res3, pos3] = tight_subplot(1,1,[0 0],[.4 .35],[.1 .53]); 
axes(Res3(1)); 
plot(t,v(:,1)+10*L,t,v(:,3)+9*L,t,v(:,5)+8*L,t,v(:,7)+7*L,t,v(:,9)+6*L,t,v(:,11)+5*L,t,v(:,13)+4*L,t,v(:,15)+3*L,t,v(:,17)+2*L,t,v(:,19)+1*L,t,v(:,21)); box off;
% legend('x0','x1','x2','x3','x4','x5','x6','x7'); 
ylabel('Displacement'); xlabel('t'); title(Res3,'Kymograph');
% force for viscoelastic force 
[Res4, pos4] = tight_subplot(10,1,0.01,[.4 .35],[.53 .1]);
for i = 1:10; axes(Res4(i));plot(t,v(:,i+22)); box off; ylabel(['F' num2str(i)]); end
% yticks([0 1]); 
% yticklabels({'0','t_m_a_x'}); xlabel('t'); title(Res2(1),'Muscle tension'); 
set(Res4(1:10), 'xtick',''); set(Res4(1:10),'ytick',''); xlabel('t'); title(Res4(1),'Viscoelastic force');
% force summation
[Res5, pos5] = tight_subplot(11,1,[.01 .03],[.05 .65],[0.1 .53]);
axes(Res5(1)); plot(t, (v(:,32)-v(:,23)+v(:,42)-v(:,33)));	ylabel(['S' num2str(1)]); box off;
for i = 1: 9
    axes(Res5(i+1))
    plot(t, (v(:,i+22)-v(:,i+23)+v(:,i+32)-v(:,i+33)));	ylabel(['S' num2str(i+1)]); box off; 
end
axes(Res5(11)); plot(t, (v(:,32)-v(:,23)+v(:,42)-v(:,33))); box off; %ylabel(['S' num2str(8)]);
set(Res5(1:10), 'xtick',''); set(Res5(1:10),'ytick',''); xlabel('t'); title(Res5(1),'Joint force');

% parameter for figures
fsize = 14;

figure(2)
plot(t,(v(:,1)+10)*L,t,(v(:,3)+9)*L,t,(v(:,5)+8)*L,t,(v(:,7)+7)*L,t,(v(:,9)+6)*L,t,(v(:,11)+5)*L,t,(v(:,13)+4)*L,t,(v(:,15)+3)*L,t,(v(:,17)+2)*L,t,(v(:,19)+1)*L,t,v(:,21)*L); 
box off;
ylabel('Displacement(mm)','FontSize',fsize); xlabel('Time/s','FontSize',fsize); 
set(gcf,'Position',[100 100 500 375]); set(gca,'FontSize',fsize);
xticks(0:1:3);
% legend({'x_0','x_1','x_2','x_3','x_4','x_5','x_6','x_7','x_8','x_9','x_10'},'Location','northwest');
print('F4-Kymograph','-djpeg','-r600');

figure(3)
for i = 1:10
    subplot('Position',[0.15 1.01-0.09*i 0.75 0.06])
    plot(t,v(:,2*i+41),'g-',t,v(:,2*i+42),'r--'); box off;
    ylabel(['E_{' num2str(i) '},' 'I_{' num2str(i) '}'],'FontSize',fsize-2)
    set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
    xticks([]); ylim([0 1]); yticks([0 1]);
end
xlabel('Time/s','FontSize',12);  xticks(0:1:5);
set(gcf,'Position',[100 100 500 375]);
print('F4-Neuron activity','-djpeg','-r600');

figure(4)
for i = 1:10
    subplot('Position',[0.15 1.01-0.09*i 0.75 0.06])
    plot(t,v(:,i+32)); box off;
    ylabel(['F_{M}_{' num2str(i) '}'],'FontSize',fsize-2);
    set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
    xticks([]); ylim([0 4]); yticks([0 4]); yticklabels({'0','F_{M}_{max}'})
end
xlabel('Time/s','FontSize',12);  xticks(0:1:5); 
set(gcf,'Position',[100 100 500 375]);
print('F4-tension force','-djpeg','-r600');

figure(5)
for i = 1:10
    subplot('Position',[0.2 1.01-0.09*i 0.75 0.06])
    plot(t,L*(v(:,2*i-1)+1-v(:,2*i+1))); box off;
    ylabel(['L_{' num2str(i) '}(mm)'],'FontSize',fsize-2);
    set(get(gca,'ylabel'),'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right');
    xticks([]); ylim([0 0.6]); yticks([0 0.6])
end
xlabel('Time/s','FontSize',12);  xticks(0:1:5);
set(gcf,'Position',[100 100 500 375]);
print('F4-segmental length','-djpeg','-r600');

toc