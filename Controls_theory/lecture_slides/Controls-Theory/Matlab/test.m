s = tf('s');
figure(2);
span = logspace(-2,2,20000);
L = 1.5*(s+1)^2/(s*(s-1)^2+1.5*(s+1)^2);
bode(L, span);