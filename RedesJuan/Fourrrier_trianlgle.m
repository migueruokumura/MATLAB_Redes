clc
clear all
close all
%Triangular
%--------Entradas---------

A = 10; % amplitud
f = 10e3; %frecuencia
p = 1;
n= 5; %cantidad

%--------Procesos---------
t = linspace(0,n/f,500);
w = (2*pi)*f; 
solv=0;

for i=1:n+n-1
    if(mod(i,2)~=0)
        solv=solv+(cos((i)*w*t)/(i)^2);
    end
end
sol_n=(pi/2)-(4/pi)*solv;

%--------salida---------
figure(1)
subplot(2,1,1)
plot(t,solv)

subplot(2,1,2)
plot(t,sol_n)