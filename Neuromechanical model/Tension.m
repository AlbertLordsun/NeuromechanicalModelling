% program file for the tension force calculation

dic = 'D:\Research files\Nose kohsaka lab\Soft robotics\Design\Matlab\Neuromechanical model\MyModel\NM3\tension\';
filename = 'ATR+Gal4-18'; format = '.csv';
data = csvread([dic filename format],1,0);
time = data(:,1);
force = data(:,2);
length = data(:,3);

%% Two components for the tension measurement: 1) baseline; 2) envelope for the maximum values;
% configurations for tension measurement
% [force_M,force_m] = envelope(force,100,'analytic');
% [force_M,force_m] = envelope(force,200,'rms');
[force_M,force_m] = envelope(force,130,'peak');

% configure for the baseline 
% base = msbackadj(time,force,'WindowSize',500);
% [base, forceNoBase] = baseline(force);

% average for tension during a suitable duration, with sampling frequency of 20Hz
TensionArray = force_M-force_m;
tension = sum(TensionArray(401:2000))/1800;
% tension = roundn(tension,-4);

% results plotting
figure(1)
fposition = [100 100 500 375]; % figure position;
plot(time,force,'k');
legend('Force','Upper envelope','Lower envelope');
xlabel('Time/s'); xlim([0 200]);
ylabel('Force/N');
box off;
title('Tension force');
set(gcf,'Position',fposition);
print('F3_Tension measurement','-djpeg','-r600');