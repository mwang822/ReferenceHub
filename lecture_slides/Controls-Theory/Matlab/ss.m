clc, clear, close all
%% 1
I1 = [10;0;0];
I2 = [0;20;0];
I3 = [0;0;30];
I = [I1,I2,I3];
 
%a
w = (pi/180).*[10,0,30];
wmag = norm(w*I)
Tmag = 1/2*(I1(1)*w(1)^2 + I2(2)*w(2)^2 + I3(3)*w(3)^2)
 
%b
L = [0,0,0];
t=[0 100];
tolerance= 1*10^-13;
options = odeset('reltol',tolerance,'abstol',tolerance);
[t,W]=ode45(@AngVelProp,t,w,options,I,L);
figure(1)
plot(t,W(:,1));
hold on ;
plot(t,W(:,2));
hold on ;
plot(t,W(:,3));
title('angular velocity vs time');
xlabel('time (s)');
ylabel('angular velocity (rads/s)');
legend('x velocity','y velocity','z velocity');
%%
%c
Hmag = sqrt(I1(1)^2*w(1)^2 + I2(2)^2*w(2)^2 + I3(3)^2*w(3)^2)
for k = 1:length(W)
    Tv(k)=(1/2)*I(1)*W(k,1)^2+(1/2)*I(5)*W(k,2)^2+(1/2)*I(9)*W(k,3)^2;
    T(k) = 1/2*W(k,:)*I*W(k,:)';
    Tdev(k) = Tmag - T(k);
    H(k) = sqrt((I(1,1)*W(k,1))^2+(I(2,2)*W(k,2))^2+(I(3,3)*W(k,3))^2);
    Hdev(k) = Hmag - H(k);
end
figure(2)
plot(t,Tdev)
grid on
title('Energy Deviation vs time');
xlabel('time (s)');
ylabel('Energy Deviation');
 
figure(3)
plot(t,Hdev)
grid on
title('Angular Momentum Deviation vs time');
xlabel('time (s)');
ylabel('Angular Momentum Deviation');
 
%d
figure(4)
[x,y,z] = ellipsoid(0,0,0,(H(:,1))^2/(2*I(1,1)*T(:,1)),(H(:,2))^2/(2*I(2,2)*T(:,1)),(H(:,3))^2/(2*I(3,3)*T(:,1)));
surf(x,y,z,'FaceColor',[0 0 1])
hold on

[x,y,z] = ellipsoid(0,0,0,H(:,1)^2/norm(H(:,1:3)),H(:,2)^2/norm(H(:,1:3),H(:,3)^2)/norm(H(:,1:3)));
surf(x,y,z,'FaceColor',[1 0 1])
 
 
function out = AngVelProp(t,w,I,L)
%     out(1,1) = w(1); %derivative of x position value
%     out(2,1) = w(2); %derivative of y position value
%     out(3,1) = w(3); %derivative of z position value
    out(1,1) = (-(I(3,3)-I(2,2))*w(2)*w(3)+L(1))/I(1,1);
    out(2,1) = (-(I(1,1)-I(3,3))*w(3)*w(1)+L(2))/I(2,2);
    out(3,1) = (-(I(2,2)-I(1,1))*w(1)*w(2)+L(3))/I(3,3);
end