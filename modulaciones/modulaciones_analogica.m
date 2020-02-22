clc
clear all
close all

%input
%carrier
Ac=10;
fc=1000e3;
thetac=0;
cpc=15;

%x(t)
Ax=2;
fx=3400;
thetax=0;
cpx=2;

%indice de modulacion am 0<=m<=1
m=1;

%indice de modulacion fm m>=2
nfm=2;

%indice de modulacion pm m>=2
npm=2;

%process
%carrier
tc=linspace(0,cpc/fc,500);
carrier = Ac*sin(2*pi*fc*tc+thetac);

%x(t)
tx=linspace(0,cpx/fx,500);
xt=Ax*sin(2*pi*fx*tx+thetax);

%frecuencia am
xam = (1+m*xt).*carrier;

%modulacion fm
xfm=Ac*sin(2*pi*fc*tc+nfm*xt);

%modulacion pm
xt_diff=Ax*sin(2*pi*fx*tx+(thetax+pi/2));
xpm=Ac*sin(2*pi*fc*tc+npm*xt_diff);

%output
figure(1)
subplot(5,1,1)
plot(tx,xt)
title('datos analogios x(t)')
subplot(5,1,2)
plot(tc,carrier)
title('señal portadora carrier(t)')
subplot(5,1,3)
plot(tc,xam)
title('señal am')
subplot(5,1,4)
plot(tc,xfm)
title('señal fm')
subplot(5,1,5)
plot(tc,xpm)
title('señal pm')