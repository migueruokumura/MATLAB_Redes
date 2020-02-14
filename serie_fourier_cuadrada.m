clc
clear all
close all

% ____________Input____________

f = 1;
can_periodos = 3;
S=4; %componentes de frecuencias
% ____________Procesos____________

t = linspace(0,can_periodos/f,500);

comp1= 0;

for N=1:S+S-1
    if(mod(N,2)~=0)
        comp1=comp1+(1/N)*sin(2*pi*N*f*t);
    end
    
end

% ____________Salida____________

figure(1)
plot(t,comp1)
