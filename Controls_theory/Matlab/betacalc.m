%beta calc
w_des = 5;
beta = betaCalc(70);
tau = tauCalc(beta,w_des);
z1 = beta*tau;





function out = betaCalc(theta)
out = (1+sind(theta))/(1-sind(theta));
end

function out = tauCalc(beta, w)
out = 1/(w*(beta)^.5);

end

