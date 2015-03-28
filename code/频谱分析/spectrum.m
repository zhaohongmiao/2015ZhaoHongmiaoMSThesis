clc;
clear;
close all;

im=zeros(256,256);
im(1:4,:)=255;
for i=1:31
    im(8*i+1:4*(2*i+1),:)=255;
end
%imshow(im)
myFFT=fft2(im);
myfftshift=fftshift(log(1+abs(myFFT)));
imf=gscale(myfftshift);
imshow(imf)