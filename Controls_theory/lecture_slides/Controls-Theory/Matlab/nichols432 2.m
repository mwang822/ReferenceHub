function nichols432(sys)
% Simple function to draw a Nichols plot

w = logspace(-3,2,10000);  % or whatever range you want
[m,p,w]=bode(sys,w);
plot(p(:),20*log10(m(:)));

axis([-360,0,-100,100]);   % or whatever limits you want
grid
xlabel('Phase (deg)');
ylabel('Magnitude (dB)');
title('Nichols Plot');
xticks(-360:45:0);
yticks(-100:20:100);
excl = patch([-210 -210 -150 -150],[-6 6 6 -6],'red');
alpha(excl,.5);

% Add additional graphics as desired to label PM, GM, xovers, etc
