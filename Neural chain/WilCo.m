%% here is for the function based on the Wilson_Cowan model
%% function for different parameters:
% tau: time duration increase with it;

%% first is for the test of the model unit assumed;
% function V = WilCo(externalInput,tGiven,varargin)
% 	tSpan = [tGiven(1) tGiven(end)];
% 	theta_E = -1; theta_X = -1; theta_I = -1;
% 	w_EX = -0; w_XE = 0; w_IE = 10; w_EId = -10; w_EI = -10;
% 	kappa = 15; tauE = 0.1; tauI = 0.1; tauX = 0.1;
%     
%     % convert the input signal into the timeflow within differential equation
%     sampleInput = @(t) interp1(tGiven,externalInput,t);
%     sigmoid = @(x) 1/(1+exp(-5*x));
%     
%     % simplified model with E-X-N-E
%     % structure: Input == E(1) == N(3) == E(4)
%     %                     ||
%     %                     X(2)
%     function dei = deidt(t,ei)
%         dei = zeros(4,1);
%         dei(1) = (-ei(1) + sigmoid(theta_E + w_EX*ei(2) + kappa*sampleInput(t)))/tauE;
%         dei(2) = (-ei(2) + sigmoid(theta_X + w_XE*ei(1)))/tauX;
%         dei(3) = (-ei(3) + sigmoid(theta_I + w_IE*ei(1)))/tauI;
%         dei(4) = (-ei(4) + sigmoid(theta_E + w_EId*dei(3)+w_EI*ei(3)))/tauE;     
%     end
% 
%     % model solutions and results
%     startValues = [0 0 0 0];
%     [t,v] = ode45(@deidt,tSpan,startValues);
%     V = interp1(t,v,tGiven);      % interpolate to the time scale configured
% end

%% second is for the test for the sequential connection without X group
function V = WilCo(externalInput,tGiven)
    tSpan = [tGiven(1) tGiven(end)];
    theta_E = 1; theta_I = 1;           % original: 3, 3
    w_IE = 10; w_EId = 10;          
    kappa = 15; tauE = 0.1;tauI = 0.1;    % original: 0.08, 0.08
    
    % sequential neural connection
    % structure:    Input
    %               ||
    %     - N(1) = E(2) = N(3) = E(4) = N(5) = E(6) --form a cycle

    sigmoid = @(x) 1/(1+exp(-100*x));
    sampleInput = @(t) interp1(tGiven,externalInput,t);
    function dei = deidt(t,ei)
        dei = zeros(6,1);
        dei(1) = (-ei(1)+sigmoid(w_IE*ei(6)-theta_I))/tauI;
        dei(2) = (-ei(2)+sigmoid(-w_EId*dei(1)+kappa*sampleInput(t)-theta_E))/tauE;
        dei(3) = (-ei(3)+sigmoid(w_IE*ei(2)-theta_I))/tauI;
        dei(4) = (-ei(4)+sigmoid(-w_EId*dei(3)-theta_E))/tauE;
        dei(5) = (-ei(5)+sigmoid(w_IE*ei(4)-theta_I))/tauI;
        dei(6) = (-ei(6)+sigmoid(-w_EId*dei(5)-theta_E))/tauE;
    end

    initialValues = [0 0 0 0 0 0];
    [t,v] = ode45(@deidt,tSpan,initialValues);
    V = interp1(t,v,tGiven);
end

%% forth is for the adjustment for the sequential connection
%% change for the frequency and the response signal duration
% function V = WilCo(externalInput,tGiven)
%     tSpan = [tGiven(1) tGiven(end)];
%     theta_E = 1; theta_X = 1; theta_N = 1;
%     w_XE = 10; w_EX = -9;  
%     w_IE = 10; w_EId = -10;
%     kappa = 15; tauE = 0.1; tauI = 0.1; tauX = 0.1;
%     
%     % sequential neural connection
%     % structure:    Input
%     %               ||
%     %     - N(1) = E(2) = N(4) = E(5) = N(7) = E(8) --form a cycle
%     %               ||            ||            ||
%     %              X(3)          X(6)          X(9)
%     sigmoid = @(x) 1/(1+exp(-1000*x));
%     sampleInput = @(t) interp1(tGiven,externalInput,t);
%     function dei = deidt(t,ei)
%         dei = zeros(9,1);
%         dei(1) = (-ei(1)+sigmoid(w_IE*ei(8)-theta_N))/tauI;
%         dei(2) = (-ei(2)+sigmoid(w_EX*ei(3)+w_EId*dei(1)+kappa*sampleInput(t)-theta_E))/tauE;
%         dei(3) = (-ei(3)+sigmoid(w_XE*ei(2)-theta_X))/tauX;
%         dei(4) = (-ei(4)+sigmoid(w_IE*ei(2)-theta_N))/tauI;
%         dei(5) = (-ei(5)+sigmoid(w_EX*ei(6)+w_EId*dei(4)-theta_E))/tauE;
%         dei(6) = (-ei(6)+sigmoid(w_XE*ei(5)-theta_X))/tauX;
%         dei(7) = (-ei(7)+sigmoid(w_IE*ei(5)-theta_N))/tauI;
%         dei(8) = (-ei(8)+sigmoid(w_EX*ei(9)+w_EId*dei(7)-theta_E))/tauE;
%         dei(9) = (-ei(9)+sigmoid(w_XE*ei(8)-theta_X))/tauX;
%     end
% 
%     initialValues = [0 0 0 0 0 0 0 0 0];
%     [t,v] = ode45(@deidt,tSpan,initialValues);
%     V = interp1(t,v,tGiven);
% end