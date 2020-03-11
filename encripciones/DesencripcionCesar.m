clc
clear all
close all
format compact

%Cifrado Cesar

% ----------Input------------

texto_claro = 'HOLA niño XYZ xyz';
v_ci = 3;

%----------Process------------

ascii = double(texto_claro);
TK="";
for i=1:length(ascii)
  if (ascii(i)==32)
      ascii(i)=32-v_ci;
  elseif (ascii(i)==90)
       ascii(i)=67-v_ci;
  elseif (ascii(i)==89)
       ascii(i)=66-v_ci;
  elseif (ascii(i)==88)
       ascii(i)=65-v_ci;
  elseif (ascii(i)==122)
       ascii(i)=99-v_ci;
  elseif (ascii(i)==121)
       ascii(i)=100-v_ci;
  elseif (ascii(i)==120)
       ascii(i)=101-v_ci;
  end
     
end

TK = ascii+v_ci;

cesar= char(TK);

%----------Output--------------

fprintf("Texto claro : %s \n", texto_claro);

fprintf("Cifrado : %s \n\n", cesar);

ascii = double(cesar);

for i=1:length(cesar)
  if(ascii(i)==32)
       ascii(i)=32+v_ci;
  elseif (ascii(i)==67)
       ascii(i)=90+v_ci;
  elseif (ascii(i)==66)
       ascii(i)=89+v_ci;
  elseif (ascii(i)==65)
       ascii(i)=88+v_ci;
  elseif (ascii(i)==97)
       ascii(i)=120+v_ci;
  elseif (ascii(i)==98)
       ascii(i)=121+v_ci;
  elseif (ascii(i)==99)
       ascii(i)=122+v_ci;
  end
   
end

de = ascii-v_ci;

Descri= char(de)