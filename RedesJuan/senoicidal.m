clc
clear all
close all

%---------- INPUT ---------------

A = 10; %Amplitud Unidad de voltios
f = 10e3; %frecuencia Unidad en khz
theta =0; %angulo
cant_periodos = 2;
%----------- Procesos --------------
t = linspace(0,cant_periodos/f,500); %tiempo (inicia, periodo = 1/frecuencia, resolución de la grafica)



sinus_0 = A*sin(2*pi*f*t + theta); %Función sinusoidal
sinus_90 = A*sin(2*pi*f*t + pi/2);
sinus_18 = A*sin(2*pi*f*t + pi);
sinus_270 = A*sin(2*pi*f*t + 3*pi/2);

%------------ Salidas-------------

figure(1)
subplot(2,2,1)
plot(t,sinus_0),grid on

subplot(2,2,2)
plot(t,sinus_90),grid on

subplot(2,2,3)
plot(t,sinus_18),grid on

subplot(2,2,4)
plot(t,sinus_270),grid on