clc
clear all
close all
format compact

%Cifrado Cesar

texto_claro = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
v_ci = 3;


%----------Process------------

ascii = double(texto_claro);
TK="";
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

TK = ascii+v_ci;

cesar= char(TK);

fprintf(cesar)