%====================================
% 二维mallat快速分解与合成算法的演示
% 函数：mallat2d
% 输入：  im—待分解的二维信号
%        N—需要分解的级数
% 输出：  e2-均方差
%         Dsnr—信噪比
% 2009.10.21
%====================================

function [y]=mallatm2d(im,N)
im=imread('ayst.tif');
% im=imread('red.jpg');
% im=rgb2gray(im);
% im=im(:,:,1)
imshow(im);                                                      %显示原始图像
title('原始图像')
im=mat2gray(im);                                                 %将图像值转化到[0，1]范围内，即实现uint8到double型转换
pit=im;                                                          %缓存im
N=3;
[ro,cl]=size(im);                                                %得到行值与列值
for i=1:N                                                        %进行N级分解
    for j=1:ro/2^(i-1)                                           %先对行进行一维mallat快速分解
         im(j,1:cl/2^(i-1))=mallatm(im(j,1:cl/2^(i-1)),1);       %调用mallatm函数进行一级分解 
    end
    for j=1:cl/2^(i-1)                                           %对列进行一维mallat快速分解
        im(1:ro/2^(i-1),j)= mallatm(im(1:ro/2^(i-1),j)',1);      %调用mallatm函数进行一级分解 
    end
end
y=im;                                                            %赋值给输出变量
% im(abs(im)<0.1)=0;
% p=length(im(im==0))/256/256;
figure;
imshow(im)                                                       %显示N级分解后的图像
title('mallat快速分解图像')
save_path = './result/';                                         %保存图像
pic_name_n = strcat('image','Decompose',num2str(N));
imwrite(y,strcat(save_path,pic_name_n,'.jpg',[]));

for i=N:-1:1                                                     %进行N级恢复    
   for j=cl/2^(i-1):-1:1                                         %先对列进行一维mallat快速恢复，整个过程与分解完全相反
        im(1:ro/2^(i-1),j)= mallatr(im(1:ro/2^(i-1),j)',1);      %调用mallatr函数进行一级恢复
    end
   for j=ro/2^(i-1):-1:1                                         %对行进行一维mallat快速恢复，整个过程与分解完全相反
         im(j,1:cl/2^(i-1))=mallatr(im(j,1:cl/2^(i-1)),1);       %调用mallatr函数进行一级恢复
    end
end
figure
yr=im;
imshow(yr)                                                       %显示恢复后的图像
title('重建图像')
pic_name_n = strcat('image','Reconstruction',num2str(N));
imwrite(yr,strcat(save_path,pic_name_n,'.jpg'));
e2=sum(sum((pit-yr).^2))/ro/cl;                                  %计算均方差
Dsnr=10*log(255*255/e2);                                         %计算信噪比
