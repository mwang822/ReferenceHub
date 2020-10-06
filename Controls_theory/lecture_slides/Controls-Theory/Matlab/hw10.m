s = tf('s');
span = logspace(-2,2,20000);
TF = 7/(7+s*(s+2)^2);
figure(1);
bode(TF,span);