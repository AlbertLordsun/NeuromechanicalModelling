% here is for the plots of figures in the paper

tic
%% plot for the response of different mechanical configuration
% frequency value
% cdata = [0.0509	0.0466	0.0425	0.0393	0.0367	0.0347	0.0329	0.0313	0.0305	0.0303	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0303	0.0302	0.0302	0.0302;...
%          0.051	0.0508	0.0466	0.0433	0.0406	0.0383	0.0363	0.0345	0.0329	0.0315	0.0304	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302;...
%          0.051	0.051	0.0475	0.0442	0.0415	0.0392	0.0372	0.0355	0.0339	0.0325	0.0312	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302;...
%          0.051	0.0507	0.047	0.044	0.0413	0.0391	0.0371	0.0354	0.0338	0.0324	0.0312	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302	0.0302]; 
% % xvalue for the dammping coefficients;
% xvalues = {'0.5','1','1.5','2','2.5','3','3.5','4','4.5','5','5.5','6','6.5','7','7.5','8','8.5','9','9.5','10'}; 
% % yvalue for the spring coefficients;
% yvalues = {'0.5','1','1.5','2'};   
% 
% h = heatmap(xvalues,yvalues,cdata);
% h.Title = 'Frequency value for different mechanical configuration';
% h.XLabel = 'Damping coefficient';
% h.YLabel = 'Spring coefficient';

%% plot for the phase plane 
figure(3) % phase plane for m3;
jet_color = colormap(cool(20));
for i = 1:1:N
    plot(v(i,7)+1-v(i,9),v(i,8),'.','color',jet_color(ceil(i/1000),:));
    hold on;
end
xlabel('L4'); ylabel('v_m_3'); title('Phase plane for m3');
text(1,0,'S'); box off; T = colorbar; title(T,'t');

%% plot for segmental dynamics
figure(4) % dynamics of segmental length during forward peristalsis
plot(t(1:10000),v(1:10000,1)+1-v(1:10000,3));
title('Segmental dynamics'); xlabel('t'); ylabel('L4'); box off; 

toc