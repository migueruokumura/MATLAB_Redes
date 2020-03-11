clc
clear all
close all

%input

datos = '00110100010';
reglaPolar=0;
regla_bit_alto = 0;
voltaje=20;


%process
tb=100;
uno = ones(1,tb); %matriz de unos
cero = zeros(1,tb); %matriz de ceros
frame=[];
frameInv=[];
list=[];
f='0';
framePolar=[];
framePolarInv=[];

for n=1:length(datos)
    if (datos(n)=='1')
        frame = [ frame uno ]; %vector que se autoacumula
        frameInv = [frameInv cero];
        %
        framePolar=[framePolar uno];
        framePolarInv=[framePolarInv -1*uno];
    else 
        frame = [ frame cero ];
        frameInv = [frameInv uno];
        %
        framePolar=[framePolar -1*uno];
        framePolarInv=[framePolarInv uno];
    end
    if (datos(n)~= f)
        f=datos(n);
        list = [list length(frame)];
    end
end
%regla del bit
if(regla_bit_alto==1)
    cadenaBits=5*frame;
    
else
    cadenaBits=5*frameInv;
    
end
%regla polar
if(reglaPolar==0)
    framePolar=framePolarInv;
end
%unipolar positiva
up=voltaje*frame;
%unipolar negativa
un=-voltaje*frame;


%outputs
figure(1)
subplot(2,2,1),plot(cadenaBits)
xticks('auto')
axis([0 length(cadenaBits) -voltaje*1.3 voltaje*1.3])
title('cadena de bits')
grid on
subplot(2,2,2),plot(up)
xticks('auto')
axis([0 length(cadenaBits) -voltaje*1.3 voltaje*1.3])
title('unipolar positiva')
grid on
subplot(2,2,3),plot(un)
xticks('auto')
axis([0 length(cadenaBits) -voltaje*1.3 voltaje*1.3])
title('unipolar negativa')
grid on
subplot(2,2,4),plot(framePolar*voltaje)
xticks('auto')
yticks('auto')
axis([0 length(cadenaBits) -voltaje*1.3 voltaje*1.3])
title('polar')
grid on