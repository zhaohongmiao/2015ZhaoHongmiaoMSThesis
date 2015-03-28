A=imread('beauty.jpg');
A=A(101:320,8:300);
B=imread('sheep.jpg');
B=rgb2gray(B);

Af=fft2(A);
Bf=fft2(B);

AfA=abs(Af);
AfB=angle(Af);

BfA=abs(Bf);
BfB=angle(Bf);

AfR=AfA.*cos(BfB)+AfA.*sin(BfB).*i;
BfR=BfA.*cos(AfB)+BfA.*sin(AfB).*i;

AR=abs(ifft2(AfR));
BR=abs(ifft2(BfR));

subplot(2,2,1);
imshow(A);
title('beauty');

subplot(2,2,2);
imshow(B);
title('sheep');


subplot(2,2,3);
imshow(AR,[]);
title('beauty-sheep');

subplot(2,2,4);
imshow(BR,[]);
title('sheep-beauty');

imwrite(A,'beauti.jpg');
imwrite(mat2gray(AR),'beauty-sheep.jpg');
imwrite(mat2gray(BR),'sheep-beauty.jpg');

