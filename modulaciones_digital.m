clc, clear all, close all

%input

datos='00110100010';
regla_bit_alto = 1;
%carrier
Ac=10;
fc=1000e3;
thetac=0;
cpc=15;

%process

ascii = double(datos);
bits = dec2bin(ascii);
cadena = reshape(bits',1,[]); %' al final es matriz traspuesta ;[]  para calcular la salida de bits (4*7)

%graficar cadena de funciones
tb=100 %duracion del bit
uno = ones(1,tb) %matriz de unos
cero = zeros(1,tb) %matriz de ceros
frame=[];
frameInv=[];
list=[];
f='0';
for n=1:length(cadena)
    if (cadena(n)=='1')
        frame = [ frame uno ]; %vector que se autoacumula
        frameInv = [frameInv cero] 
    else 
        frame = [ frame cero ];
        frameInv = [frameInv cero]
    end
    if (cadena(n)~= f)
        f=cadena(n);
        list = [list length(frame)];
    end
end
if(regla_bit_alto==1)
    cadenaBits=5*frame %0 a 5 voltios
else
    cadenaBIts=5*frameInv
end
%carrier
tc=linspace(0,length(datos)/fc,500);
carrier= Ac*sin(2*pi*fc*tc+thetac)

%output

titulo=cat(2,'Datos: ',datos)
figure(1)
subplot(2,1,1),plot(frame)
xticks(list-100)
axis([0 length(frame) -1 6])
grid on
subplot(2,1,2),plot(carrier) 
xticks(list-100)
axis([0 length(carrier) -1 6])
title('cadena de bits')
grid on