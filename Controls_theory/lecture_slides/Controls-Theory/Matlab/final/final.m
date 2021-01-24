%Michael Wang
%ENAE432
%Final project
%[w,t]=testdata(7333);
%figure(1);
%title('Test data');
%plot(t,w);
I1 = 250;
I2 = 750;
I_tot = I1+I2;
w_d = 5.236; %freq between peaks from test data
syms x 
Bs = double(solve(.0052==(.00533/2*x)/((.00533/2*x)^2+w_d^2)^.5,x));
Ks = double(solve(w_d*2*I1*I2 == (((I_tot)*Bs)^2-4*I1*I2*(I_tot)*x)^.5,x))*-1;
sigma = -Bs*(I_tot)/(2*I1*I2);
%%
s = tf('s');
span = logspace(-3,3,40000);
G = 60*180/pi*((I2*s^2+s*Bs+Ks)/(s^2*(s^2*I1*I2+s*Bs*I_tot+Ks*I_tot)));
figure(2);
margin(G);
figure(4)
Km = 1.8;
deg = 1;
H = Km*(z1*s+1)^deg/(tau*s+1)^deg;
margin(H);
figure(5)
L = H*G;
bode(L,span);
%%
figure(6);
nichols432(L);
title('Nichols plot of L(s)');
%%
figure(7);
T = feedback(L,1);
T_poles = pole(T)
%%
figure(10);
bode(T, span);
hold on;
w2 = 5000;
sigma_s = ((s^2/w2^2)^2+2*.005*s/(w2^2)+1)^-1-1;
bode(sigma_s, span);
hold off
%%
figure(12);
S = (1+L)^-1;
bode((1+L)^-1,span);
%%
[t,yd,yma,ua] = simview(G,Km);

%%
figure(8);
step(S);
figure(9);
step(3*T);

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
