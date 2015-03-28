close all;
clear all;
clc;

L=200;
l=0.5*L;
x=zeros(4,4);
x(1,1)=0.9;
x(2,2)=0.9;
x(2,1)=0.9;
x(1,2)=0.9;
x(3,3)=0.9;
x(4,4)=0.9;
x(3,4)=0.9;
x(4,3)=0.9;
x(1,3)=0.1;
x(2,4)=0.1;
x(2,3)=0.1;
x(1,4)=0.1;
x(2,3)=0.1;
x(3,1)=0.1;
x(4,2)=0.1;
x(3,2)=0.1;
x(4,1)=0.1;
y1=repmat(x,50,50);

myfft1=fft2(y1);                      % 信号的傅利叶变换;
myamplitude1=abs(myfft1);            % 信号的幅度谱;
myphase1=angle(myfft1);              % 信号的相位谱;
mylogamplitude1=fftshift(log(1+myamplitude1));   % 幅度谱取log;

subplot(325)
imshow(y1)
subplot(326)
mesh(mylogamplitude1);figure(gcf);

%y2=0.9.*ones(200,200);
y2=zeros(200,200);
yf2=repmat(x,10,10);
y2(81:120,81:120)=yf2;

myfft2=fft2(y2);                      % 信号的傅利叶变换;
myamplitude2=abs(myfft2);            % 信号的幅度谱;
myphase2=angle(myfft2);              % 信号的相位谱;
mylogamplitude2=fftshift(log(1+myamplitude2));   % 幅度谱取log;


subplot(323)
imshow(y2)
subplot(324)
mesh(mylogamplitude2);figure(gcf);


%y3=0.9.*ones(200,200);
y3=zeros(200,200);
yf3=repmat(x,2,2);
y3(97:104,97:104)=yf3;

myfft3=fft2(y3);                      % 信号的傅利叶变换;
myamplitude3=abs(myfft3);            % 信号的幅度谱;
myphase3=angle(myfft3);              % 信号的相位谱;
mylogamplitude3=fftshift(log(1+myamplitude3));   % 幅度谱取log;


subplot(321)
imshow(y3)
subplot(322)
mesh(mylogamplitude3);figure(gcf);
