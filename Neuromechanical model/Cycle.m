% cycle calculation
clc; 
clear all;
close all;

tic
global m L k1 k2 c mu_bf Ff t_max w_ENd w_NE w_EN w_tE w_ES theta_E tauE theta_N tauN theta_t taut theta_S
%     global m L k1 k2 c mu_bf Ff t_max  w_NE w_EN w_EE w_tE w_ES  w_En theta_E tauE theta_N tauN theta_t taut theta_S

% parameter space
% 1) parameters for the mechanical model
m = 0.1; L = 0.4;
k1 = 3; k2 = 3; 
c = 475000;
mu_bf =10; Ff =0.05;
t_max = 4;
% 2) parameters for the neural circuit chain
w_ENd = -10000; 
w_NE = 1; 
w_EN = -1; w_tE = 1; w_ES = -1;
theta_E = 0.5; TauE = 5:5:50;
theta_N = 0.5; tauN = 10;
theta_t =0.2; taut = 150;
theta_S = 0.8;
%% for pheleven's work
% default configuration: w_NE = 0.6; w_EN = -2; w_tE = 1; w_ES = 1.95; w_EE = 1; w_En = 0.6;
% w_NE = 0.6; w_EN = -2; w_tE = 1; w_ES = 1.95; w_EE = 1; w_En = 0.6; % here w_ES = w_NS;
% % default configuration: theta_E = theta_N = 0.6; tauE = tauN = 20;
% theta_E = 0.6; TauE = 5:5:50;
% theta_N = 0.6; tauN = 20;
% theta_t =0.2; taut = 150;
% theta_S = 0.8;  

for j = 1:size(TauE,2)
    tauE = TauE(j);
% parameter configuration and calculation
N = 500; td = 0.01;
t = td: td: N*td;
externalInput = zeros(N,1);
for i = 1 : 5
    externalInput(i) = 1;  % externalInput is used to stimulate the excitatory unit in this chain
end
v = NMCycle(externalInput,t);

%  for assessment through the parameter space;
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
plot(t,v(:,1)+10,t,v(:,3)+9,t,v(:,5)+8,t,v(:,7)+7,t,v(:,9)+6,t,v(:,11)+5,t,v(:,13)+4,t,v(:,15)+3,t,v(:,17)+2,t,v(:,19)+1,t,v(:,21)); box off;
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

%% response factors
above1 = v(:,37)>0.1;  % tension5 signal
sumAbove1 = find([above1;0]+[0;above1]==1);
Ton_t = (sumAbove1(2)-sumAbove1(1)-1)/100; P1 = (sumAbove1(3)-sumAbove1(1))/100;
above2 = v(:,51)>0.1;  % E5 signal
sumAbove2 = find([above2;0]+[0;above2]==1);
Ton_E = (sumAbove2(2)-sumAbove2(1)-1)/100; P2 = (sumAbove2(3)-sumAbove2(1))/100;
above3 = v(:,52)>0.1;  % N5 signal
sumAbove3 = find([above3;0]+[0;above3]==1);
Ton_N = (sumAbove3(2)-sumAbove3(1)-1)/100; P3 = (sumAbove3(3)-sumAbove3(1))/100;
above4 = v(:,36)>0.1; % tension 4;
sumAbove4 = find([above4;0]+[0;above4]==1);
TDelay = (sumAbove4(1)-sumAbove1(1))/100;
response = [P1, P2, P3, 1/P1, 1/P2, 1/P3, ...   % period and frequency of t4, E4, N4
                       Ton_t, Ton_E, Ton_N, TDelay, TDelay/P1, ...  % On_time duration of t5, E5, N5, time delay and phase delay
                       max(v(:,9)+1-v(:,11)), min(v(:,9)+1-v(:,11)), (v(sumAbove2(3),9)-v(sumAbove2(1),9))/P2, (v(sumAbove2(3),9)-v(sumAbove2(1),9))]';    % contraction range max, min and velocity, wave num;

vlength = size(v,1);
save(['Response-tauE-' num2str(tauE) '-tauN-' num2str(tauN) '.mat'], 'response','vlength');

end
toc