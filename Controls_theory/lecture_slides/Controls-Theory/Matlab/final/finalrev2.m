s = tf('s');
span = logspace(-3,3,40000);
G = 60*180/pi*((I2*s^2+s*Bs+Ks)/(s^2*(s^2*I1*I2+s*Bs*I_tot+Ks*I_tot)));
figure(2);
margin(G);


deg = 1;
H = (z1*s+1)^deg/(tau*s+1)^deg;
margin(H);
figure(5)
L = H*G;
Km =10^(-mag2db(abs(evalfr(L,5.24*j))-.0001)/20);
margin(L*Km);
figure(6);
nichols432(L);
hold off
%%
figure(7);
S=(1+L)^-1;
bode(S, span);
hold off
%%
T = feedback(L,1);
T_poles = pole(T)

%%
[t,yd,yma,ua] = simview(G,Km);