%% here is the function for the neuromechanical model
%% for the integration of seven-segment eight-block system
%% x represents the displacement without velocity;
function V = NM(externalInput,tGiven)
%     global L
	tSpan = [tGiven(1) tGiven(end)];
    %% parameter space
    % 1) parameters for the mechanical model
    %% parameter units have been conversed
    %    t_max = 4.0 mN = 4.0x10^-3 kgm/sec^2 = 4.0 mg mm/msec^2 = 4.0 (in this code)
    %    k1 = 3 N/m = 3 kg/sec^2 = 3 mg/msec^2 = 3 (in this code)
    %    k2 = 3 N/m = 3 kg/sec^2 = 3 mg/msec^2 = 3 (in this code)
    %    c = 475 Nsec/m = 4.75x10^2 kg/sec = 4.75x10^5 mg/msec = 4.75x10^5 (in this code)
    %    m = 0.11 mg (1.1mg/10segments) = 1.1x10^-1 mg = 1.1x10^-1 (in this code)
    %    L = 0.4 mm (single segment length) = 0.4 (in this code)    
    %    f-reference = 0.05mN;
    %% here we use the tau = t/1000ms;
    m = 0.1; L = 0.4;
    k1 = 3; k2 = 3; c = 475000; % k1:[1,5]; k2:[1,5]; c:[100,1000];
    mu_bf = 10; Ff =0.05;
    t_max = 4;  % t:[2,7]; representing the tension force
    % 2) parameters fro the neural circuit chain
	w_ENd = -10000; w_NE = 1; w_EN = -1; w_tE = 1; w_ES = -0; 
    theta_E = 0.5; tauE = 15;
    theta_N = 0.5; tauN = 15;  % here N corresponds the I population in the paper.
    theta_t = 0.2; taut =150;
    theta_S = 0.8;   
    
    kappa = 15; % for the adjustment of the externalInput value;

    % convert the input signal into the timeflow within differential equation
    sampleInput = @(t) interp1(tGiven,externalInput,t);
    sigmoidt = @(x) 1/(1+exp(-1000*x)); sigmoidE = @(x) 1/(1+exp(-1000*x));
    sigmoidN = @(x) 1/(1+exp(-1000*x)); sigmoidS = @(x) 1/(1+exp(-1000*x));
    sigmoidf = @(x) 1/(1+exp(-1000*x));
	%% simplified model
    % structure:    seg2            seg1
    %        externalInput
    %             ||                      
    %     - N(7)=E(7) =N(6)=E(6) =N(5)=E(5) =N(4)=E(4) =N(3)=E(3) =N(2)=E(2) =N(1)=E(1) -
    %          // ||      // ||      // ||      // ||      // ||      // ||      // ||
    %      SR(7) t(7) SR(6) t(6) SR(5) t(5) SR(4) t(4) SR(3) t(3) SR(2) t(2) SR(1) t(1)
    %        ||   ||    ||   ||    ||   ||    ||   ||    ||   ||    ||   ||    ||   ||
    %    x(7)-------x(6)-------x(5)-------x(4)-------x(3)-------x(2)-------x(1)-------x(0)   
    %% varabilities for this model
    % here let n equal to 10
    % var space: position/velocity(1-22); viscoelastic force(23-32); tension(33-42); neuron activity(43-62);
    % function are all dimension scaled, based on time unit tau and segmental length L
    function dv = dvdt(t,v)
        dv = zeros(62,1);     
        %% simplified equations with dimension scaling, (the calculation process doesn't cost extra time)
        % displacement and time are scaled by the segmental length and time relaxation constant for E unit
        dv(1) = v(2);
        if abs(v(2))<=0.0001 && -mu_bf*Ff<= v(32)-v(23)+v(42)-v(33) && v(32)-v(23)+v(42)-v(33)<=Ff
            dv(2) = 0;
        else
            dv(2) = (10^6)/(m*L)*(v(32)-v(23)+v(42)-v(33)-f(v(2)));
        end
        for i = 1:9
            dv(2*i+1)=v(2*i+2);
            if abs(v(2*i+2))<=0.0001 && -mu_bf*Ff<=v(i+22)-v(i+23)+v(i+32)-v(i+33) && v(i+22)-v(i+23)+v(i+32)-v(i+33)<=Ff
                dv(2*i+2)=0;
            else
                dv(2*i+2) =  (10^6)/(m*L)*(v(i+22)-v(i+23)+v(i+32)-v(i+33)-f(v(2*i+2)));
            end
            dv(i+22) = k2*1000/c*(-v(i+22)+k1*L*(v(2*i-1)-v(2*i+1)+c*(k1+k2)/(k1*k2*1000)*(v(2*i)-v(2*i+2))));
            dv(i+32) = 1000/taut*(-v(i+32)+t_max*sigmoidt(w_tE*v(2*i+41)-theta_t));
            dv(2*i+42) = 1000/tauN*(-v(2*i+42)+sigmoidN(w_NE*v(2*i+43)-theta_N));
            dv(2*i+41) = 1000/tauE*(-v(2*i+41)+sigmoidE(w_ENd/1000*dv(2*i+42)+w_EN*v(2*i+42)+w_ES*sigmoidS(L*(theta_S-v(2*i-1)-1+v(2*i+1)))-theta_E));
        end
        dv(21) = v(22);
        if abs(v(22))<=0.0001 && -mu_bf*Ff<=v(32)-v(23)+v(42)-v(33) && v(32)-v(23)+v(42)-v(33)<=Ff
            dv(22) = 0;
        else
            dv(22) = (10^6)/(m*L)*(v(32)-v(23)+v(42)-v(33)-f(v(2)));
        end
        dv(32) = k2*1000/c*(-v(32)+k1*L*(v(19)-v(21)+c*(k1+k2)/(k1*k2*1000)*(v(20)-v(22))));        
        dv(42) = 1000/taut*(-v(42)+t_max*sigmoidt(w_tE*v(61)-theta_t));
        dv(62) = 1000/tauN*(-v(62)+sigmoidN(w_NE*v(43)-theta_N));
        dv(61) = 1000/tauE*(-v(61)+sigmoidE(w_ENd/1000*dv(62)+w_EN*v(62)+w_ES*sigmoidS(L*(theta_S-v(19)-1+v(21)))+kappa*sampleInput(t)-theta_E));
    end
      
    % model solutions and results
    startValues = zeros(62,1);  % dimension scaled values;
    [t,v] = ode15s(@dvdt,tSpan,startValues);
    V = interp1(t,v,tGiven);      % interpolate to the time scale configured
    
    % function of friction when velocity ~= 0
    function Fric = f(x)
        Fric = Ff*sigmoidf(x)-mu_bf*Ff*sigmoidf(-x);
    end
end

%% referring to the Pehleven paper
% function V = NM(externalInput,tGiven)
%     global L tauE
% 	tSpan = [tGiven(1) tGiven(end)];
%     %% parameter space
%     % 1) parameters for the mechanical model
%     %% parameter units have been conversed 
%     m = 0.1; L = 0.4;
%     k1 = 3; k2 = 3; c = 475000; % k1:[1,5]; k2:[1,5]; c:[100,1000];
%     mu_bf =10; Ff =0.05;
%     t_max = 4;  % t:[2,7];
%     % 2) parameters fro the neural circuit chain
% 	w_NE = 0.6; w_EN = -2; w_tE = 1; w_ES = 1.95; w_EE = 1; w_En = 0.6; % here w_ES = w_NS;
%     theta_E = 0.6; tauE = 20;
%     theta_N = 0.6; tauN = 20;
%     theta_t =0.2; taut = 150;
%     theta_S = 0.8;  
%     kappa = 15; % for the adjustment of the externalInput value;
% 
%     % convert the input signal into the timeflow within differential equation
%     sampleInput = @(t) interp1(tGiven,externalInput,t);
%     sigmoidt = @(x) 1/(1+exp(-1000*x)); sigmoidE = @(x) 1/(1+exp(-1000*x));
%     sigmoidN = @(x) 1/(1+exp(-1000*x)); sigmoidS = @(x) 1/(1+exp(-1000*x));
%     sigmoidf = @(x) 1/(1+exp(-1000*x));
%     %% varabilities for this model
%     % here let n equal to 7
%     % var space: position/velocity(1-16); viscoelastic force(17-23); tension(24-30); neuron activity(31-44);
%     % function are all dimension scaled, based on time unit tau and segmental length L
%     function dv = dvdt(t,v)
%         dv = zeros(62,1);     
%         %% simplified equations with dimension scaling, (the calculation process doesn't cost extra time)
%         % displacement and time are scaled by the segmental length and time relaxation constant for E unit
%         dv(1) = v(2);
%         if abs(v(2))<=0.0001 && -mu_bf*Ff<= v(32)-v(23)+v(42)-v(33) && v(32)-v(23)+v(42)-v(33)<=Ff    
%             dv(2) = 0;
%         else
%             dv(2) = 10^6/(m*L)*(v(32)-v(23)+v(42)-v(33)-f(v(2)));
%         end   
%         for i = 1:9
%             dv(2*i+1)=v(2*i+2);
%             if abs(v(2*i+2))<=0.0001 && -mu_bf*Ff<=v(i+22)-v(i+23)+v(i+32)-v(i+33) && v(i+22)-v(i+23)+v(i+32)-v(i+33)<=Ff
%                 dv(2*i+2)=0;
%             else
%                 dv(2*i+2) =  10^6/(m*L)*(v(i+22)-v(i+23)+v(i+32)-v(i+33)-f(v(2*i+2)));
%             end
%             dv(i+22) = k2*1000/c*(-v(i+22)+k1*L*(v(2*i-1)-v(2*i+1)+c*(k1+k2)/(k1*k2*1000)*(v(2*i)-v(2*i+2))));
%             dv(i+32) = 1000/taut*(-v(i+32)+t_max*sigmoidt(w_tE*v(2*i+41)-theta_t));
%             dv(2*i+42) = 1000/tauN*(-v(2*i+42)+sigmoidN(w_NE*v(2*i+41)+w_ES*sigmoidS(L*(theta_S-v(2*i-1)-1+v(2*i+1)))-theta_N));
%             dv(2*i+41) = 1000/tauE*(-v(2*i+41)+sigmoidE(w_En*v(2*i+43)+w_EE*v(2*i+41)+w_EN*v(2*i+42)+w_ES*sigmoidS(L*(theta_S-v(2*i+1)-1+v(2*i+3)))-theta_E));
%         end
%         dv(21) = v(22);
%         if abs(v(22))<=0.0001 && -mu_bf*Ff<=v(32)-v(23)+v(42)-v(33) && v(32)-v(23)+v(42)-v(33)<=Ff
%             dv(22) = 0;
%         else
%             dv(22) = (10^6)/(m*L)*(v(32)-v(23)+v(42)-v(33)-f(v(2)));
%         end
%         dv(32) = k2*1000/c*(-v(32)+k1*L*(v(19)-v(21)+c*(k1+k2)/(k1*k2*1000)*(v(20)-v(22))));        
%         dv(42) = 1000/taut*(-v(42)+t_max*sigmoidt(w_tE*v(61)-theta_t));
%         dv(62) = 1000/tauN*(-v(62)+sigmoidN(w_NE*v(61)+w_ES*sigmoidS(L*(theta_S-v(19)-1+v(21)))-theta_N));
%         dv(61) = 1000/tauE*(-v(61)+sigmoidE(w_En*v(43)+w_EE*v(61)+w_EN*v(62)+w_ES*sigmoidS(L*(theta_S-v(1)-1+v(3)))+kappa*sampleInput(t)-theta_E));
%     end
%       
%     % model solutions and results
%     startValues = zeros(62,1);  % dimension scaled values;
% %     startValues(2,1) = 0.005; startValues(16,1) = 0.005;
%     [t,v] = ode15s(@dvdt,tSpan,startValues);
% %     F = f([v(:,2) v(:,4) v(:,6) v(:,8) v(:,10) v(:,12) v(:,14) v(:,16)]);
% %     v = [v F];
%     V = interp1(t,v,tGiven);      % interpolate to the time scale configured
%     
%     % function of friction when velocity ~= 0
%     function Fric = f(x)
% %         Fric = (1+mu_bf)/2*Ff*sign(x)+(1-mu_bf)/2*Ff;
%         Fric = Ff*sigmoidf(x)-mu_bf*Ff*sigmoidf(-x);
%     end
% end