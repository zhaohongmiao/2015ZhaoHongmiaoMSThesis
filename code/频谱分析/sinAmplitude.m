A=imread('ayst.tif');

Af=fft2(A);
AfA=abs(Af);
AfA=angle(Af);

myfftshift=fftshift(log(1+abs(Af)));
imf=gscale(myfftshift);

myAfftshift=fftshift(AfA);
imfA=gscale(myAfftshift);

imshow(imf)
figure,imshow(imfA)
imwrite(imf,'amplitude.jpg');
imwrite(imfA,'phase.jpg');