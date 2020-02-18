clc
clear all
close all

%input
f = 10e3;
can_periodos = 5;
can_frecuencias=1000; %dientes
A=10;

%process

t = linspace(0,can_periodos/f,500);
w = 2*pi*f;
ds=0;
for N=1:(can_frecuencias)
   
        ds = ds + ((-1)^(N+1))*((1/N)*sin(t*w*N));
    
    
end

ds_a=((2*A)/pi)*ds;


%output

figure(1)
subplot(2,1,1)
plot(t,ds)
subplot(2,1,2)
plot(t,ds_a)

