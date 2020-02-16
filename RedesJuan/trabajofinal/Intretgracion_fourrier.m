clc
clear all
close all

%------Entradas---------
caso = 'caudrada';
f=1;
p=3;
A=10;
con_frecuencia=4;

%------Metodos---------
t=linspace(0,p/f,500);
w = (2*pi)*f;
%casos
% dientes
% triangualos
% sinu
% cuadrada

solv = 0;

switch caso
    case 'dientes'
        for i=1:con_frecuencia
            solv = solv + ((2/pi)*((-1)^(i+1))*((1/i)*sin(t*w*i)));
        end
        
    case 'triangulo'
        for i=1:con_frecuencia+con_frecuencia-1
            if(mod(i,2)~=0)
                solv=solv+((pi/2)-(4/pi)*(cos((i)*w*t)/(i)^2));
            end
        end    
        
    case 'caudrada'
        for N=1:con_frecuencia+con_frecuencia-1
            if(mod(N,2)~=0)
                solv=solv+(1/N)*sin(2*pi*N*f*t);
            end
        end
    case 'sinusoidal 0'
        solv = solv+A*sin(2*pi*f*t + theta);
    case 'sinusoidal 90'
        solv = solv+A*sin(2*pi*f*t + pi/2);
        
    case 'sinusoidal 180'
        solv = solv +A*sin(2*pi*f*t + pi);
    otherwise
        solv = solv +  A*sin(2*pi*f*t + 3*pi/2);
end


figure(1)
plot(t,solv)
