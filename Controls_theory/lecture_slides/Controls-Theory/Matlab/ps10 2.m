%Michael Wang
%ENAE432
%PS10

%%1b)
s = tf('s'); 
rSpan = linspace(-10,6,20000);
G1 = 7/(s+2)^2; 
H = 1/s;
L_0 = G1*H; 
figure(1);
rlocus(L_0) 
hold on
title('1b, rlocus of L_0');
k = 0.278; 
H = k/s;
L = G1*H;
T1b = feedback(L,1); 
T1b_poles = pole(T1b) 
figure(2); 
step(T1b);
title('1b) Step of T(s)');
hold on

%%
%%3a)
G3a = 4*(s-1)/(s-5);
H3a = 1/(s-5);
L3a = G3a*H3a;
figure(3);
rlocus(L3a);
hold on;
title('3a rlocus of L(s)')

%3b)
H3b = 1/(s-2);
L3b = G3a*H3b;
figure(4)
rlocus(L3b);
hold on;
title('3b rlocus of L(s)');
