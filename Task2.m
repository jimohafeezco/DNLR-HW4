
clear; clc; clf;
syms a1 a2 a3 a4 a5 a0 b0 b1 b2 b3 b4 b5 t a b c c0 c1 c2 c3 c4 c5
%  spline starts hrer
qa=1;t1=0;
qb=2;t2=2;
qc=0;t3=4;


q1 = a0+a1*t+a2*t^2+a3*t^3 +a4*t^4 +a5*t^5;
q2 = b0+b1*t+b2*t^2+b3*t^3 + b4*t^4 +b5*t^5;

% q12 = (a0-b0)+(a1-b1)*t + (a2-b2)*t^2+(a3-b3)*t^3+(a4-b4)*t^4+(a5-b5)*t^5;


eqn1 = subs(q1, t1)==qa;
eqn2 = subs(q1, t2) ==qb;
% ini vel =0
eqn3 = subs(diff(q1), t1)==0;
% % vel at t=2  is 1
eqn4 = subs(diff(q1), t2)==1;

eqn5 = subs(diff(diff(q1)), t2)==1/2;

eqn6 = subs(diff(diff(q1)), t1)==0;

[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4 eqn5 eqn6], [a0, a1, a2, a3 a4 a5])

X = linsolve(A,B);

q1= X(1)+X(2)*t+X(3)*t^2+X(4)*t^3 +X(5)*t^4 + X(6)*t^5;







q2 = b0+b1*t+b2*t^2+b3*t^3 + b4*t^4 +b5*t^5;

% q12 = (a0-b0)+(a1-b1)*t + (a2-b2)*t^2+(a3-b3)*t^3+(a4-b4)*t^4+(a5-b5)*t^5;


eqn7 = subs(q2, t2)==2;
eqn8 = subs(q2, t3) ==0;
% ini vel =0
eqn9 = subs(diff(q2), t2)==1;
% % vel at t=2  is 1
eqn10 = subs(diff(q2), t3)==0;

eqn11 = subs(diff(diff(q2)), t2)==1/2;

eqn12 = subs(diff(diff(q2)), t3)==0;

[C,D] = equationsToMatrix([eqn7, eqn8, eqn9, eqn10, eqn11 eqn12], [b0, b1, b2, b3 b4 b5])

Y = linsolve(C,D);

q2= Y(1)+Y(2)*t+Y(3)*t^2+Y(4)*t^3 +Y(5)*t^4 + Y(6)*t^5;

figure(1)
subplot(3,1,1)
title('The position');
hold on
fplot(q1, [t1 t2])
fplot(q2, [t2 t3])
grid on
hold off
subplot(3,1,2)
title('The velocity');
hold on
fplot(diff(q1), [t1 t2])
fplot(diff(q2), [t2 t3])
hold off
grid on
subplot(3,1,3)
title('The acceleration')
hold on
fplot(diff(diff(q1)), [t1 t2])
fplot(diff(diff(q2)), [t2 t3])
grid on
hold off






syms a1 a2 a3 a4 a5 a0 b0 b1 b2 b3 b4 b5 t a b c c0 c1 c2 c3 c4 c5 c6
% polynomial starts here
qa=1;t1=0;
qb=2;t2=2;
qc=0;t3=4;


q3 = c0+c1*t+c2*t^2+c3*t^3 + c4*t^4 +c5*t^5 + c6*t^6;



eqn1p = subs(q3, t1)==qa;
eqn2p = subs(q3, t2) ==qb;
% ini vel =0
eqn3p = subs(q3, t3)==0;
% % vel at t=2  is 1
eqn4p = subs(diff(q3), t1)==0;

eqn5p = subs(diff(q3), t3)==0;

eqn6p = subs(diff(diff(q3)), t1)==0;

eqn7p = subs(diff(diff(q3)), t3)==0;

[E,F] = equationsToMatrix([eqn1p, eqn2p, eqn3p, eqn4p eqn5p eqn6p eqn7p], [c0, c1, c2, c3 c4 c5 c6])
Z = linsolve(E,F);

q3(t)= Z(1)+Z(2)*t+Z(3)*t^2+Z(4)*t^3 +Z(5)*t^4 + Z(6)*t^5 + Z(7)*t^6;



figure(2)
subplot(3,1,1)
title('Position');
hold on
fplot(q3(t), [t1 t3])
grid on
hold off
subplot(3,1,2)
title('Velocity');
hold on
fplot(diff(q3(t)), [t1 t3], 'r')
hold off
grid on
subplot(3,1,3)
title('Acceleration')
hold on
fplot(diff(diff(q3(t))), [t1 t3], 'g')
grid on
hold off