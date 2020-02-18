clc
clear all
close all

%input
f = 10e3;
can_periodos = 5;
can_frecuencias=1000; %redondeo
A=10;

%process
t = linspace(0,can_periodos/f,500);
w = 2*pi*f;
tri=0;
for N=1:2:(can_frecuencias*2-1)
   
        tri = tri + (1/N^2)*(cos(w*t*N));
    
    
end

tri_ca=(pi/2)-(4/pi)*tri;


%output
figure(1)
subplot(2,1,1)
plot(t,tri)
subplot(2,1,2)
plot(t,tri_ca)

