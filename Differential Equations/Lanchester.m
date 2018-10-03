%BATTLE OF HOGWARTS
%CS-302 Modeling and Simulation
%
%Anishi Mehta: 201401439

%clear all;
dt = 0.0001;
t = 0:dt:20;
n = length(t);
S = zeros(1,n);
D = zeros(1,n);
F = zeros(1,n);
P = zeros(1,n);

S(1) = 200;
P(1) = 120;
D(1) = 140;
F(1) = 200;

s1 = 0.15;
s2 = 0.08;
p1 = 0.008;
d1 = 0.01;
f1 = 0.2;
f2 = 0.09;

for i = 1:n-1
    S(i+1) = S(i) - dt*s1*S(i)*D(i) - dt*s2*S(i)*F(i);    
    P(i+1) = P(i) - dt*p1*P(i)*D(i);    
    D(i+1) = D(i) - dt*d1*D(i)*P(i);   
    F(i+1) = F(i) - dt*f1*F(i)*P(i) - dt*f2*F(i)*S(i);
end

figure;
plot(t, S, 'r');
hold on;
plot(t, P, 'g');
hold on;
plot(t, D, 'b');
hold on;
plot(t, F, 'y');
hold on;
title('Battle of Hogwarts')
xlabel('Time')
ylabel('Population')

