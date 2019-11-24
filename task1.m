clear; clc; clf;
syms a1 a2 a3 a4 a5 a0 b0 b1 b2 b3 b4 t a b c 

qa=1;t1=0;
qb=4;t2=2;
% qc=0;t3=4;

q1 = a0+a1*t+a2*t^2+a3*t^3;
% q2 = b0+b1*t+b2*t^2+b3*t^3;

eqn1 = subs(q1, t1)==qa;
eqn2 = subs(q1, t2) ==qb;
eqn3 = subs(diff(q1), t1)==0;
eqn4 = subs(diff(q1), t2)==0;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4], [a0, a1, a2, a3])
X = linsolve(A,B);
q1= X(1)+X(2)*t+X(3)*t^2+X(4)*t^3
set(0, 'DefaultTextInterpreter', 'latex') 
set(0, 'DefaultLegendInterpreter', 'latex')

figure(1)
hold on
subplot(3,1,1)
fplot(q1, [t1 t2])
title('Polynomial position profile')
legend('$q$ ')
grid on
subplot(3,1,2)
fplot(diff(q1), [t1 t2], 'r')
legend('$\dot{q}$ ')
grid on
subplot(3,1,3)
fplot(diff(diff(q1)), [t1 t2], 'g')
legend('$\ddot{q}$ ')
grid on
hold off

% % % TAsk 1c starts here
figure(2)

a=3*pi/4;c= pi/2;b=0;d=5/2;
q3= a *b*t +d- a/c*(cos(c*t))
hold on
subplot(3,1,1)
fplot(q3, [0 2])
title('Velocity profile of $a(b+sin(ct)$')
legend('q')
grid on
subplot(3,1,2)
fplot(diff(q3), [0 2], 'r')
legend('$\dot{q}$')
grid on
subplot(3,1,3)
fplot(diff(diff(q3)), [0 2], 'g')
legend('$\ddot{q}$')
grid on
hold off
 




syms t
f1(t)=1+2*t.^2;
f2(t)=0.5+2*t;
f3(t)=4-2*(2-t)^2;

v(t)=4*t;
v2(t)=8-4*t;

figure(3)
subplot(3,1,1);
hold on 
title('Position')
t=linspace(0,0.5);
plot(t,f1(t), 'b')
t=linspace(0.5,1.5);
plot(t,f2(t), 'b')
t=linspace(1.5,2);
plot(t,f3(t), 'b')
grid
hold off

subplot(3,1,2);
hold on 
title('Velocity')
t=linspace(0,0.5);
plot(t,v(t), 'r')
t=linspace(0.5,1.5);
plot(t,2*ones(size(t)), 'r')
t=linspace(1.5,2);
plot(t,v2(t), 'r')
grid
hold off

subplot(3,1,3);
hold on 
title('Acceleration')
t=linspace(0,0.5);
plot(t,4*ones(size(t)), 'g')
t=linspace(0.5,1.5);
plot(t,0*ones(size(t)), 'g')
t=linspace(1.5,2);
plot(t,-4*ones(size(t)), 'g')
grid
hold off



