clc
clear all
close all
%format compact: para que se vea compacto we
% --------- INPUT ----------
texto = 'hola mundo';
regla_bit_alto = 1;

%----------- process ---------
ascii = double(texto);
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
%----------- OUTPUT ---------
%fprintf('Texto:%s',texto)
%ascii
%bits
%cadena
frame

%para visualizar grafica
figure(1)
subplot(2,1,1),plot(frame)
xticks(list-100)
axis([0 length(frame) -1 6])
title('Señal binaria')
grid on

subplot(2,1,2),plot(cadenaBits) %la de voltaje, no seria voltios
xticks(list-100)
axis([0 length(cadenaBits) -1 6])
title('cadena de bits')
grid on