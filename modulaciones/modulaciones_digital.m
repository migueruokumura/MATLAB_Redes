clc
clear all
close all

%input

datos = '00110100010';
regla_bit_alto = 1;


%Carrier
Ac= 10;
fc=1000e3;
thetac =0;
cpc=15;


%ask

regla_ask_tr_carrier=1;


%procesos

%graficar cadena de funciones
tb=100; %duracion del bit
uno = ones(1,tb); %matriz de unos
cero = zeros(1,tb); %matriz de ceros
frame=[];
frameInv=[];
list=[];
f='0';
for n=1:length(datos)
    if (datos(n)=='1')
        frame = [ frame uno ]; %vector que se autoacumula
        frameInv = [frameInv cero] ;
    else 
        frame = [ frame cero ];
        frameInv = [frameInv uno];
    end
    if (datos(n)~= f)
        f=datos(n);
        list = [list length(frame)];
    end
end
if(regla_bit_alto==1)
    cadenaBits=5*frame %0 a 5 voltios
else
    cadenaBits=5*frameInv
end

tc = linspace(0, 2*length(datos)/fc,length(cadenaBits));
carrier = Ac* sin(2*pi*fc*tc+thetac);

if(regla_ask_tr_carrier == 1)
    ask = frame.*carrier;
else
    ask = frameInv.*carrier;
end

%output

frame;

%para visualizar grafica
figure(1)
subplot(3,1,1),plot(cadenaBits)
xticks(list-100)
axis([0 length(cadenaBits) -1 6])
title('Datos')
grid on

subplot(3,1,2),plot(carrier) 
xticks(list-100)
axis([0 length(cadenaBits) -10 10])
title('cadena de carrier')
grid on


subplot(3,1,3),plot(ask) 
xticks(list-100)
axis([0 length(cadenaBits) -10 10])
title('cadena ask')
grid on