clf; clear; close all;
syms t


tc = 2/3;
tc2 = 4/3;
tf= 4;
qc = 0.75;
f1(t)=1+9/16*t^2;
f2(t)=1+0.75*(t-1/3);
f3(t)=2-9/16*(2-t)^2;




v(t)=diff(f1(t), t);
v2(t)=diff(f2(t), t);
v3(t)=diff(f3(t), t);

a1(t) = diff(v(t), t);
a2(t) = diff(v2(t), t);
a3(t) = diff(v3(t), t);


f4(t)=2 - (9*t^2)/32;

f5(t)=5/2 - (3*t)/4;
f6(t)=(9*(t - 4)^2)/32;


v4(t)=diff(f4(t), t);
v5(t)=diff(f5(t), t);
v6(t)=diff(f6(t), t);

a4(t) = diff(v4(t), t);
a5(t) = diff(v5(t), t);
a6(t) = diff(v6(t), t);


figure(1)
subplot(3,1,1);
hold on 
title('Position')
t=linspace(0,tc);
plot(t,f1(t), 'r')
t=linspace(tc,2-tc);
plot(t,f2(t), 'g')
t=linspace(2-tc,2);
plot(t,f3(t), 'b')
grid
hold off

subplot(3,1,2);
hold on 
title('Velocity')
t=linspace(0,tc);
plot(t,v(t), 'r')
t=linspace(tc,2-tc);
plot(t,qc*ones(size(t)), 'g')
t=linspace(2-tc,2);
plot(t,v3(t), 'b')
grid
hold off
% 
subplot(3,1,3);
hold on 
title('Acceleration')
t=linspace(0,tc);
plot(t,9/8*ones(size(t)), 'r')
t=linspace(tc,2-tc);
plot(t,0*ones(size(t)), 'g')
t=linspace(2-tc,2);
plot(t,-9/8*ones(size(t)), 'b')
grid
hold off
% 
%
%between the last 2 points


figure(2)
subplot(3,1,1);
hold on 
title('Position')
t=linspace(0,tc2);
plot(t,f4(t), 'r')
t=linspace(tc2,tf-tc2);
plot(t,f5(t), 'g')
t=linspace(tf-tc2,tf);
plot(t,f6(t), 'b')
grid
hold off

subplot(3,1,2);
hold on 
title('Velocity')
t=linspace(0,tc2);
plot(t,v4(t), 'r')
t=linspace(tc2,tf-tc2);
plot(t,v5(t), 'g')
t=linspace(tf-tc2,tf);
plot(t,v6(t), 'b')
grid
hold off
% 
subplot(3,1,3);
hold on 
title('Acceleration')
t=linspace(0,tc2);
plot(t,a4(t), 'r')
t=linspace(tc2,tf-tc2);
plot(t,a5(t), 'g')
t=linspace(tf-tc2,tf);
plot(t,a6(t), 'b')
grid
hold off






