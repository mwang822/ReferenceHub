%Michael Wang
%ENAE432
%PS8

%%
%1a)
s = tf('s');
span = logspace(-3,3,20000);
L1a = -1.5*(s+1)/(s*(s-1)^2);
G1a = L1a;
figure(1);
margin(L1a);
%1d)
figure(2);
margin(-L1a);

%%
%2a)
L2a = -L1a*(s+1);
figure(3);
margin(L2a);

%%
%2b)
figure(4);
hold on
bode(L2a, span);
title('Bode of L(s) for K = -1');

%%
%2c)
figure(5);
K2c = -2.489*(s+1);
L2c = -K2c*(s+1)*1.5/(s*(s-1)^2);
T2c = feedback(L2c,1);
step(T2c);
R2c = K2c*(s+1)/(1+L2c);
%step(R2c);

%%
%2d)
figure(6);
S2d = feedback(1, L2c);
bode(S2d, span);
title('Bode of S(s)');
[Gm2d,Pm2d,Wcg2d,Wcp2d] = margin(S2d);
Gm2dEval = mag2db(abs(evalfr(S2d, Wcg2d*j)))
hold on

%%
%3a)
figure(7);
bode(G1a, span); %to find angle at w = 30
title('Bode G(s)');
beta3a = 57.7;
tau3a = .0353;
H3a_0 = (beta3a*tau3a*s+1)/(tau3a*s+1);
L3a_0 = H3a_0*G1a;
figure(8);
bode(L3a_0, span); %to find mag at w = 30
title('Bode of L_0(s)');
%%
%3b)
figure(9);
H3b = -1.26*(2.037*s+1)/(.0353*s+1);
L3b = L1a*H3b;
T3b = feedback(L3b,1);
step(T3b);
hold on
R3b = H3b/(1+L3b);
figure(10);
hold on;
step(R3b);

%%
%3c)
figure(11);
G_wdesAngle = angle(evalfr(G1a, 2*j))*180/pi
H3c_0 = (1.586*s+1)^2/(.1576*s+1)^2;
L3c_0 = H3c_0*G1a; 
L3c_wmag = mag2db(abs(evalfr(L3c_0, 2*j)))



%%
%4e)
figure(12)
Kp = 45.77;
Ki = 138.46;
L4e = 1.3*(s*Kp+Ki)/(5*s^2+.5*s);
T4e = feedback(L4e, 1);
step(L4e);
