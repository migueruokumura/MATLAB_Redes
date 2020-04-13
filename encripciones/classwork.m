clc;
clear all;
close all;
%input
texto_claro='classwork2';

%tamano del bit
tb=100;
%reglas
regla_bit_alto=0;
%regla amplitud de bit
uno=5;
cero=0;
%polar
polaruno=-12;
polarzero=12;
regla_polar=0;
%carrier
Ac=10;
fc=3000;
thetac=0;
%cpc=15;

%voltaje=20;

%process

%bits de entrada desde el texto claro
bits=reshape(dec2bin(double(texto_claro))',1,[]);

%encripcion

v_ci = 3;

ascii = double(texto_claro);
cesar="";
for i=1:length(ascii)
    
  if (ascii(i)==32)
      ascii(i)=32-v_ci;
  elseif (ascii(i)==76) %L
      ascii(i)=209-v_ci;
  elseif (ascii(i)==77) %M
      ascii(i)=79-v_ci;
  elseif (ascii(i)==78) %N
      ascii(i)=80-v_ci;
  elseif (ascii(i)==209) %Ñ
      ascii(i)=81-v_ci;
  elseif (ascii(i)==108) %l
      ascii(i)=241-v_ci;
  elseif (ascii(i)==109) %m
      ascii(i)=111-v_ci;
  elseif (ascii(i)==110) %n
      ascii(i)=112-v_ci;
  elseif (ascii(i)==241) %ñ
      ascii(i)=113-v_ci;
  elseif (ascii(i)==90) %Z
       ascii(i)=67-v_ci;
  elseif (ascii(i)==89) %Y
       ascii(i)=66-v_ci;
  elseif (ascii(i)==88) %X
       ascii(i)=65-v_ci;
  elseif (ascii(i)==122) %z
       ascii(i)=99-v_ci;
  elseif (ascii(i)==121) %y
       ascii(i)=98-v_ci;
  elseif (ascii(i)==120) %x
       ascii(i)=97-v_ci;
  end
     
end

cesar = ascii+v_ci;

criptograma = char(cesar)

longbits=length(bits);
for n=1:longbits
    valor(n)=str2double(bits(n));
    for m=1:tb
        cadenaBits(n,m)=valor(n);
    end
end
bitstream=reshape(cadenaBits',1,[]);
cadenaBits=uno*bitstream;
tc = linspace(0, 2*longbits/fc,length(cadenaBits));
carrier = Ac* sin(2*pi*fc*tc+thetac);

%ask
ask=bitstream.*carrier;
for n=1:length(cadenaBits)
    if(cadenaBits(n)==uno)
        nrz(n)=polaruno;
    else
        nrz(n)=polarzero;
    end
end


%output
fprintf('texto claro: %s\ncriptograma: %s\n',texto_claro, criptograma)
fprintf('bitstream: %s\n', bits)

figure(1)
subplot(2,2,1), plot(cadenaBits),title(cat(2,'cadena bits: ',bits))
axis([0 length(cadenaBits) abs(polarzero*1.4)*(-1) abs(polaruno*1.4)])