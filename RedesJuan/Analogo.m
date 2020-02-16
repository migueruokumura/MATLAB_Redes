clc
clear all
close all

%inputos

%Carrier
Ac= 10;
fc=1000e3;
thetac =0;
cpc=15;

%tx
Ax= 2;
fx=3400;
thetax =0;
cpx=2;

%indice de modulacion 0<= m >= 1

m = 0.5;
%indice de modulacion 0<= npm >= 1

nfm = 2;
%indice de modulacion 0<= nfm >= 1

npm = 2;


%procesos
tc = linspace(0, cpc/fc,500);
carrier = Ac* sin(2*pi*fc*tc+thetac);

tx = linspace(0, cpx/fx,500);
xt =Ax * sin(2*pi*fx*tx+thetax);
% modulacion_Am 
xam=(1+m*xt).*carrier;

%modulacio FM
xfm=Ac*sin(2*pi*fc*tc+ nfm*xt);

%Modulación PM
xt_diff = Ax*sin(2*pi*fx*tx + (thetax+pi/2));
xpm=(Ac*sin(2*pi*fc*tc+ npm*xt_diff));


%resultados

figure(1)
subplot(5,1,1), plot(tx,xt),title('Datos analogos xt')

subplot(5,1,2), plot(tc,carrier),title('Señal protadora del carrier(t)')

subplot(5,1,3), plot(tc,xam),title('Señal AM')

subplot(5,1,4), plot(tc,xfm),title('Señal FM')

subplot(5,1,5), plot(tc,xpm),title('Señal PM')
