%Michael Wang
%PS 9
%ENAE432

%1)
figure(1);
s = tf('s');
span = logspace (-3,3,20000);
G1 = 4/(s*(s+2)^2);
margin(G1);
%%
Kp1 = 2.4;
Tu1 = pi;
KI = 2*Kp1/Tu1;
Kd1 = Kp1*Tu1/8;
H1 = Kp1+s*Kd1*KI/s;
L1 = G1*H1;
figure(2);
margin(L1);
figure(3);
T1 = feedback(L1,1);
T1_poles = pole(T1)
step(T1);

%%
%2)
w2_des = 2;
figure(4);
bode(G1,span);
title('2) Bode of L_0(s) for H(s)=K, where K=1');
figure(5);
H2 = (s+.728)^2/s;
L2 = H2*G1;
bode(L2,span);
title('2) Bode of L_0(s) for H_0(s)')
a = -mag2db(abs(evalfr(L2,w2_des*j)))
K2 = 10^(a/20);
H2 = H2*K2;
L2 = H2*G1;
figure(6);
margin(L2);
T2 = feedback(L2, 1);
T2_poles = pole(T2)
figure(7)
step(T2);
hold on;
step(T1);

%%
%3b)
figure(8);
tau_f = 1/10;
L3_eff = exp(-s*tau_f)*L2;
[L3eff_m,P3eff_m] = margin(L3_eff);
L3eff_m = mag2db(L3eff_m)
step(feedback(L3_eff,1));
%%
%3d)
figure(9);
S3i = G1/(1+L2);
bode(S3i, span);
title('3d) Bode of S_i(s)');
%%
%3e)
figure(10);
bode(feedback(1,L2),span);
title("3e) Bode to seek largest tracking error");
