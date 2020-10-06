%Michael Wang
%ENAE432
%PS7

%1)
s = tf('s');
L = 7/(s/5+1)^3;
span = logspace(-2,2,20000);
figure(1);
bode(L,span);   %bode w/ K = 1
title('For K = 1');
% figure(2);
% margin(L);

%1b)
T_1b = feedback(.3416*L,1);
T_poles = pole(T_1b)
figure(3);
step(T_1b);

%1c)
figure(4);
R = .3416/(1+L*.3416);
step(R);

%1d)
S = (s/5+1)^3/(2.391+(s/5+1)^3);
figure(5);
bode(S, span);
title('Bode S(s)');

%2a)
L2 = (s+1)/(2*s*(s-3));
figure(6);
bode(L2, span); %for K=1, using as base to draw nyquist for small and large K
title('2a), bode of L(s) for K=1');
figure(7);
margin(L2);
title('2a margins for K = 1');

%2b)
K2 = 13.49;
L2 = L2*K2;
T2b = feedback(L2,1);
T2_poles = pole(T2b)
figure(8);
step(T2b);

%2c)
H2 = K2/s;
R2 = H2/(1+L2);
figure(9);
step(R2);
title('2c) Step of u(t)');

%2d)
figure(10);
S2 = 2*s*(s-3)/(K2*(s+1)+2*s*(s-3));
bode(S2,span);
title('2d) Bode of S(s)');

%%
%3a)
L3 = 12/(s^2*(s+1)); %using K = 1 and tau = 1 for baseline
figure(12);
margin(L3);
figure(13);
margin(-L3); % K = -1 

%%
%3b)
L3b = 12*(2*s+1)/(s^2*(s+1)); %stable
figure(14);
margin(L3b);
figure(15);
L3b = 12*(s+1)/(s^2*(2*s+1)); %unstable
margin(L3b);

%%
%3c)
L3c = 12*(s+1)/(s^2*(.17*s+1));
figure(16);
margin(L3c);
K3c = .21135;
L3c = L3c*K3c;
T3 = feedback(L3c, 1);
T3c_Poles = pole(T3)

%%
%3d)
figure(17)
step(T3);

%%
%3e)
figure(18);
L3e = L3c*10;
step(feedback(L3e,1));
%%
%3f)
a3f = mag2db(abs(evalfr(L3c/K3c,1.855*j)))