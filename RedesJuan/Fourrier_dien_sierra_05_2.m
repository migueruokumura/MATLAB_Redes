clc
clear all
close all
%diente sierra
%--------Entradas---------

A = 10; % amplitud
f = 10; %frecuencia
p = 1;
n= 10; %cantidad

%--------Procesos---------
t = linspace(0,n/f,500);
w = (2*pi)*f; 
solv=0;

for i=1:n
    solv = solv + ((-1)^(i+1))*((1/i)*sin(t*w*i))
end
sol_n=(2/pi)*solv;

%--------salida---------
figure(1)
subplot(2,1,1)
plot(t,solv)

subplot(2,1,2)
plot(t,sol_n)