clc;
clear all;
close all;

%--------------------input---------------------

tc='hola';
tb=50;

%--carrier--
Ac= 10;
fc=1000e3;
thetac =0;

%--input reglas--
regla_bit_alto = 1;
regla_ask = 1;
regla_fsk = 1;
delta_freq = 500e3;

%--input cod--
regla_unipolarP = 0;
voltaje_nrz = 20;
deltay = 5; %para la visualizacion en axis 

regla_unipolarN = 0;
regla_polar = 0;


%cesar
v_ci = 3;

%---------------process-------------------------

%cifrado cesar
ascii = double(tc);
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

criptograma= char(cesar);

%cifrado vernam
%codigo sacado de https://programsofmatlab.blogspot.com/2018/10/vernam-cipher-matlab-code.html
%creditos a su respectivo autor
%se cambiaron nombres de variables para adaptarlas al codigo actual

a1=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
b1=[0:25];

%la clave debe tener el mismo numero de elementos que el texto claro 
code='ratnoiuyuge u aymetpsfy'; 

for ii=1:length(tc)
    for jj=1:length(a1)
        if tc(ii)==a1(jj)
            w1(ii)=b1(jj);
        end
        if code(ii)==a1(jj)
           c1(ii)=b1(jj);
        end
    end
end
newcode=w1+c1;
for ii=1:length(newcode)
    if(newcode(ii)>25)
        newcode(ii)=newcode(ii)-26;
    else
        continue
    end
end

for ii=1:length(newcode)
    for jj=1:length(b1)
        if newcode(ii)==b1(jj)
           finalcode(ii)=a1(jj);
        else
            continue
        end
    end
end

%para la interfaz grafica se separaran bloques para las encripciones cesar y vernam
%(aunque se sabe que son las mismas secuencias de bloques de codigo), 
%por ende creare las variables y
%bloques de digitalizacion aparte para evitar futuras confusiones de mi parte

%digitalizacion cesar
datosc=dec2bin(criptograma);
digitalstreamc=reshape(datosc',1,[]);

%digitalizacion vernam
datosv=dec2bin(finalcode);
digitalstreamv=reshape(datosv',1,[]);

%--construccion digitalizacion--
%matrices ceros y unos
cero=zeros(1,tb);
uno=ones(1,tb);

%frames
frame= [];
frameInverso= [];
framePolar= [];
framePolarInverso= [];

%--para cesar--
for n=1:length(digitalstreamc)
    if(digitalstreamc(n)=='0')
        frame= [frame cero];
        frameInverso = [frameInverso uno];
        framePolar = [framePolar (-1)*uno];
        framePolarInverso = [framePolarInverso (+1)*uno];
    else
        frame= [frame uno];
        frameInverso = [frameInverso cero];
        framePolar = [framePolar (+1)*uno];
        framePolarInverso = [framePolarInverso (-1)*uno];
    end
end

%--para vernam--
for n=1:length(digitalstreamv)
    if(digitalstreamv(n)=='0')
        frame= [frame cero];
        frameInverso = [frameInverso uno];
        framePolar = [framePolar (-1)*uno];
        framePolarInverso = [framePolarInverso (+1)*uno];
    else
        frame= [frame uno];
        frameInverso = [frameInverso cero];
        framePolar = [framePolar (+1)*uno];
        framePolarInverso = [framePolarInverso (-1)*uno];


    end
end

if (regla_bit_alto==1)
    cadenaBits=5*frame;
else
    cadenaBits=5*frameInverso;
end    


%--carrier--
%carrier cesar
tcc = linspace(0,2*length(digitalstreamc)/fc,length(cadenaBits));
carrierc = Ac* sin(2*pi*fc*tcc+thetac);

%carrier vernam
tcv = linspace(0,2*length(digitalstreamv)/fc,length(cadenaBits));
carrierv = Ac* sin(2*pi*fc*tcv+thetac);

%--ask--
%ask cesar
if(regla_ask==1)
    askc=frame.*carrierc;
else
    askc=frameInverso.*carrierc;
end

%ask vernam
if(regla_ask==1)
    askv=frame.*carrierv;
else
    askv=frameInverso.*carrierv;
end

%--fsk--
fc_delta=fc-delta_freq;
%fsk cesar
delta_carrierc=Ac* sin(2*pi*fc_delta*tcc+thetac);
if(regla_fsk==1)
    fskc_1= frame.*carrierc;
    fskc_2= frameInverso.*delta_carrierc;
else
    fskc_1= frameInverso.*carrierc;
    fskc_2= frame.*delta_carrierc;
end
fskc=fskc_1+fskc_2;

%fsk vernam
delta_carrierv=Ac* sin(2*pi*fc_delta*tcv+thetac);
if(regla_fsk==1)
    fskv_1= frame.*carrierv;
    fskv_2= frameInverso.*delta_carrierv;
else
    fskv_1= frameInverso.*carrierv;
    fskv_2= frame.*delta_carrierv;
end
fskv=fskv_1+fskv_2;

%nrzpu
if(regla_unipolarP==0)
    unipolarP=voltaje_nrz*frame;
else
    unipolarP=voltaje_nrz*frameInverso;
end

%nrznu
if(regla_unipolarN==0)
    unipolarN=(-1)*voltaje_nrz*frame;
else
    unipolarN=(-1)*voltaje_nrz*frameInverso;
end

%polar
if(regla_polar==0)
    polar=voltaje_nrz*framePolar;
else
    polar=voltaje_nrz*framePolarInverso;
end
%-------------0utput-------------
%comprobacion de datos
fprintf('texto claro: %s\n',tc)
fprintf('cesar: %s\n',criptograma)
fprintf('vernam: %s\n',finalcode)
fprintf('cadena bits para cesar: %s\n',digitalstreamc)
fprintf('cadena bits para vernam: %s\n',digitalstreamv)

%graficas
figure(1)
subplot(3,1,1);plot(cadenaBits);title('cadena de bits')
axis([0 length(cadenaBits) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(3,1,2);plot(carrierc);title('carrier cesar')
axis([0 length(carrierc) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(3,1,3);plot(carrierv);title('carrier vernam')
axis([0 length(carrierv) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on


figure(2)
subplot(4,1,1);plot(askc);title('modulacion ask para cesar')
axis([0 length(askc) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(4,1,2);plot(askv);title('modulacion ask para vernam')
axis([0 length(askv) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(4,1,3);plot(fskc);title('modulacion fsk para cesar')
axis([0 length(fskc) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(4,1,4);plot(fskv);title('modulacion fsk para vernam')
axis([0 length(fskv) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on


figure(3)
subplot(3,1,1);plot(unipolarP);title('codificacion unipolar positiva')
axis([0 length(unipolarP) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(3,1,2);plot(unipolarN);title('codificacion unipolar negativa')
axis([0 length(unipolarN) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on

subplot(3,1,3);plot(polar);title('codificacion polar')
axis([0 length(polar) -voltaje_nrz-deltay voltaje_nrz+deltay])
xticks('auto')
grid on