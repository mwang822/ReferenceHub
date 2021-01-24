[A,B,C,D] = ssdata(ss(c2d(H,.1,'tustin')))
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
Km = 1.8;
deg = 1;
H = Km*(z1*s+1)^deg/(tau*s+1)^deg;
L = H*G;