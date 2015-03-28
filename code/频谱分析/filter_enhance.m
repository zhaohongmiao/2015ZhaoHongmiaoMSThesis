clear;
clc;
close all;
t=[0:0.4:1000];
y=1+sin(2*pi*0.05*t).*(t<=720)+sin(2*pi*0.25*t).*(t>720&t<=800)+sin(2*pi*0.05*t).*(t>800);
f=[-500:0.4:500];
myFrequency=fft(y);
myAmplitude = abs(fft(y));
myLogAmplitude = log(abs(fft(y)));
myAmplitudeshift = (abs(fftshift(fft(y))));
myPhase = angle(fft(y));
myLogAmplitudeshift=log(abs(fftshift(fft(y))));
 
sgm=2;
myLogAmpFiltershift = imfilter(myLogAmplitudeshift, fspecial('gaussian',[1 50],sgm));
 
myLogAmpFilter = imfilter(myLogAmplitude, fspecial('gaussian',[1 50],sgm));
myAmplitudeFiter=exp(myLogAmpFilter);
myAmpFiltershift=fftshift(myAmplitudeFiter);
ynew=ifft(exp(myLogAmpFilter+i*myPhase));  % æ»¤æ³¢åŽçš„ä¿¡å·
 
ynewFilter = imfilter(abs(ynew), fspecial('gaussian',[1 50],8));
 
yRemovedLogFrequencyShift=log(myAmplitudeshift-myAmpFiltershift);%æ»¤é™¤çš„å¹…åº¦è°±
yRemovedLogAmplitude=log(myAmplitude-myAmplitudeFiter);
 
yRemoved=ifft(exp(yRemovedLogAmplitude+i*myPhase));
 
 
subplot(211);
plot(t,ynew);grid;
title('显著图')
 
subplot(212);
plot(t,ynewFilter);grid;
title('Enhanced Saliency Map')
 