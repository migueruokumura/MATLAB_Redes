clc, clear all, close all
%------- INPUT ---------
A=10;
f=10e3;
cp= 1;

%-------- PROCESS -------
t=linspace (0,cp/f,500);

cuadrada_1cf = (1/1)*sin(2*pi*1*f*t);
cuadrada_2cf = cuadrada_1cf + (1/3)*sin(2*pi*3*f*t);
cuadrada_3cf = cuadrada_2cf + (1/5)*sin(2*pi*5*f*t);
cuadrada_4cf = cuadrada_3cf + (1/7)*sin(2*pi*7*f*t);
cuadrada_5cf = cuadrada_4cf + (1/9)*sin(2*pi*9*f*t);
cuadrada_6cf = cuadrada_5cf + (1/11)*sin(2*pi*11*f*t);

tf_1cf = abs (fftshift(fft(cuadrada_1cf)));
tf_2cf = abs (fftshift(fft(cuadrada_2cf)));
tf_3cf = abs (fftshift(fft(cuadrada_3cf)));
tf_4cf = abs (fftshift(fft(cuadrada_4cf)));
tf_5cf = abs (fftshift(fft(cuadrada_5cf)));
tf_6cf = abs (fftshift(fft(cuadrada_6cf)));

%--------- OUTPUT ---------
figure (1)
subplot (3,2,1), plot(cuadrada_1cf)
subplot (3,2,2), plot(cuadrada_2cf)
subplot (3,2,3), plot(cuadrada_3cf)
subplot (3,2,4), plot(cuadrada_4cf)
subplot (3,2,5), plot(cuadrada_5cf)
subplot (3,2,6), plot(cuadrada_6cf)

figure (2)
subplot (3,2,1), plot(tf_1cf(200:300))
subplot (3,2,2), plot(tf_2cf(200:300))
subplot (3,2,3), plot(tf_3cf(200:300))
subplot (3,2,4), plot(tf_4cf(200:300))
subplot (3,2,5), plot(tf_5cf(200:300))
subplot (3,2,6), plot(tf_6cf(200:300))

figure (3)
subplot (3,2,1), plot(tf_1cf(251:300))
subplot (3,2,2), plot(tf_2cf(251:300))
subplot (3,2,3), plot(tf_3cf(251:300))
subplot (3,2,4), plot(tf_4cf(251:300))
subplot (3,2,5), plot(tf_5cf(251:300))
subplot (3,2,6), plot(tf_6cf(251:300))



