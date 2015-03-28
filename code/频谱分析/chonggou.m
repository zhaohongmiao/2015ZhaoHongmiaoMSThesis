clear
clc

%% Read image from file
image = imread('0.jpg');
inImg = rgb2gray(image);
%%inImg = imresize(inImg, 64/size(inImg, 2));

%% Spectral Residual
myFFT = fft2(inImg);
myLogAmplitude = log(abs(myFFT));
myPhase = angle(myFFT);

p = abs(ifft2(exp( i*myPhase))).^2;
p=mat2gray(p);
imshow(p);
imwrite(p,'chonggou_phase.jpg');

a=abs(ifft2(exp(myLogAmplitude))).^2;
a=mat2gray(a);
figure, imshow(a);
imwrite(a,'chonggou_amplitude.jpg');

imwrite(inImg,'440.jpg')