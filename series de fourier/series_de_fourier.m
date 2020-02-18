clc
clear all
close all

%input

f = 10e3;
can_periodos = 5;
can_frecuencias=5;
A=10;
serie='diente';

%process
w=2*pi*f;
t = linspace(0,can_periodos/f,500);
switch serie
    
    %cudrada
    case 'cuadrada'
        fourier= 0;

    for N=1:can_frecuencias+can_frecuencias-1
        if(mod(N,2)~=0)
            fourier=fourier+(1/N)*sin(2*pi*N*f*t);
        end
    
    end
    
    %triangular
    case 'triangular'
        fourier=0;
        for N=1:2:(can_frecuencias*2-1)
   
            fourier = fourier + ((pi/2)-(4/pi)*(1/N^2)*(cos(w*t*N)));

    
        end
        
    %diente
    case 'diente'
        fourier=0;
        for N=1:(can_frecuencias)
   
            fourier = fourier + (((2*A)/pi)*((-1)^(N+1))*((1/N)*sin(t*w*N)));
    
    
        end

    %sinu
    case 'sinusoidal'
        fsinusoidal = '0';
        switch fsinusoidal
            case '0'
                
                fourier = A*sin(2*pi*f*t);
                
            case '90'
                
                fourier = A*sin(2*pi*f*t + pi/2);
                
            case '180'
                
                fourier = A*sin(2*pi*f*t + pi);
                
            case '270'
                
                fourier = A*sin(2*pi*f*t + 3*pi/2);
                
            otherwise
                fprintf('atras')
        end
    otherwise
        fprintf('programa terminado con exito')
end       
    
    
    
    
%output
figure(1)
plot(t,fourier)