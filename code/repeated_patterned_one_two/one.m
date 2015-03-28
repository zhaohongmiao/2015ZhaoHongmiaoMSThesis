% 比较精确的figure4的例子，能够精确读出频率的大小。

clear;
clc;
close all;
t=[0:1/1000:1];
y1=0.*(t<=0.48)+sin(2*pi*25*t).*(t>0.48&t<=0.52)+0.*(t>0.52);
fs1=1000;
n1=0:length(fft(y1))-1;
f1=fs1*n1/length(fft(y1));
myAmplitude1=(abs(fftshift(fft(y1))));
myLogAmplitude1=log(abs(fftshift(fft(y1))))+5;

y2=0.*(t<=0.46)-sin(2*pi*25*t).*(t>0.46&t<=0.54)+0.*(t>0.54);
myAmplitude2=(abs(fftshift(fft(y2))));
myLogAmplitude2=log(abs(fftshift(fft(y2))));

y3=sin(2*pi*25*t);
myAmplitude3=(abs(fftshift(fft(y3))));
myLogAmplitude3=log(abs(fftshift(fft(y3))));


subplot(3,2,1);
plot(t,y1);grid;
title('Signal1 with one cycle')

subplot(3,2,2);
plot(f1,abs(fft(y1)));grid;
title('Log amplitude spectrum of signal1')

subplot(3,2,3);
plot(t,y2);grid;
title('Signal2 with two cycle')

subplot(3,2,4);
plot(f1,myLogAmplitude2);grid;
title('Log amplitude spectrum of signal1')

subplot(3,2,5);
plot(t,y3);grid;
title('Signal3 with many repeated cycle')

subplot(3,2,6);
plot(f1,myLogAmplitude3);grid;
title('Log amplitude spectrum of signal1')
