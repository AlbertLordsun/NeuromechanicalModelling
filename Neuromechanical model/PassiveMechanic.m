% mechanics for the larval body system without considering the neurons

% first test: 3-segments 4-blocks system
clc;
tic
[t,x] = ode15s(@dvdt,[0 100],[2 0 1 0 0 1]);

figure(1)
plot(t,x(:,5)+3,t,x(:,1),t,x(:,3),t,x(:,5));
title('Segmental boundary displacement');
toc

%% function for the mechanical system
% first step: establish function based on newton law
% second step: dimension scaling for reduced parameters
function Der = dvdt(~,x)
    % parameter configuration
    kl = 1; nl = 3.5;   % scaled parameters;

    Der = zeros(6,1); %normed form: p0 = p3+3
    Der(1) = x(2);
    if x(2) ~= 0
        Der(2) = kl*(x(5)+3+x(3)-2*x(1))+nl*(x(6)+x(4)-2*x(2))+ten(x(5)+3-x(1))-ten(x(1)-x(3))-f(x(2));
    else
        Der(2) = 0;
    end
    Der(3) = x(4);
    if x(4) ~= 0
        Der(4) = kl*(x(1)+x(5)-2*x(3))+nl*(x(2)+x(6)-2*x(4))+ten(x(1)-x(3))-ten(x(3)-x(5))-f(x(4));
    else
        Der(4) = 0;
    end
    Der(5) = x(6);
    if x(6) ~= 0
        Der(6) = kl*(x(1)+x(3)-2*x(5)-3)+nl*(x(2)+x(4)-2*x(6))+ten(x(3)-x(5))-ten(x(5)+3-x(1))-2*f(x(6));
    else
        Der(6) = 0;
    end
end

function tension = ten(l)
    tl = 0;  % scaled tension amplitude
    alphal = 0.2; betal = 0;
    tension = tl/(1+exp(-alphal*(1-l-betal))); % alpha*l; beta/l; 
end

function FF = f(x)
    mub = 2; Ff = 1; % scaled friction amplitude
    FF = (1+mub)/2*Ff*sign(x)+(1-mub)/2*Ff;
end









