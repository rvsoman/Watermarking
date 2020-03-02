clc; clear all; close all;
img=imread('lena.jpg');   %reading the original image
gray_img=rgb2gray(img);    %grayscale of original image
[row_size col_size]=size(gray_img);
figure;                   %plotting the 8 planes of original image
subplot(2,5,1);
imshow((gray_img));
title('Original Image');

gray_img=double(gray_img);
bin_img=fliplr(de2bi(gray_img));   %converting pixel values in decimal to binary

plane1=[];     %plane for msb bit
plane1=bin_img(:,1);
mat1=(vec2mat(plane1,row_size));
subplot(2,5,2);
imshow((mat1'));   %image using the msb bits of all pixel values
title('MSB bit');

plane2=[];
plane2=bin_img(:,2);
mat2=(vec2mat(plane2,row_size));
subplot(2,5,3);
imshow((mat2'));
title('2nd plane');

plane3=[];
plane3=bin_img(:,3);
mat3=(vec2mat(plane3,row_size));
subplot(2,5,4);
imshow((mat3'));
title('3rd plane');

plane4=[];
plane4=bin_img(:,4);
mat4=(vec2mat(plane4,row_size));
subplot(2,5,5);
imshow((mat4'));
title('4th plane');

plane5=[];
plane5=bin_img(:,5);
mat5=(vec2mat(plane5,row_size));
subplot(2,5,6);
imshow((mat5'));
title('5th plane');

plane6=[];
plane6=bin_img(:,6);
mat6=(vec2mat(plane6,row_size));
subplot(2,5,7);
imshow((mat6'));
title('6th plane');

plane7=[];
plane7=bin_img(:,7);
mat7=(vec2mat(plane7,row_size));
subplot(2,5,8);
imshow((mat7'));
title('7th plane');

plane8=[];     %plane for lsb bit
plane8=bin_img(:,8);
mat8=(vec2mat(plane8,row_size));
subplot(2,5,9);
imshow((mat8'));     %image using the lsb bits of all pixel values
title('LSB bit');


%bit slicing of watermark image
img1=imread('forest.jfif');   %reading the original image
img1=imresize(img1,[row_size,col_size]);
gray_img1=rgb2gray(img1);    %grayscale of original image
[m1 n1]=size(gray_img1);
figure;
subplot(2,5,1);
imshow((gray_img1));
title('Original Image');

gray_img1=double(gray_img1);
bin_img1=fliplr(de2bi(gray_img1));   %converting pixel values in decimal to binary

plane11=[];     %plane for msb bit
plane11=bin_img1(:,1);
mat11=(vec2mat(plane11,m1));
subplot(2,5,2);
imshow((mat11'));   %image using the msb bits of all pixel values
title('MSB bit');

plane22=[];
plane22=bin_img1(:,2);
mat22=(vec2mat(plane22,m1));
subplot(2,5,3);
imshow((mat22'));
title('2nd plane');

plane33=[];
plane33=bin_img1(:,3);
mat33=(vec2mat(plane33,m1));
subplot(2,5,4);
imshow((mat33'));
title('3rd plane');

plane44=[];
plane44=bin_img1(:,4);
mat44=(vec2mat(plane44,m1));
subplot(2,5,5);
imshow((mat44'));
title('4th plane');

plane55=[];
plane55=bin_img1(:,5);
mat55=(vec2mat(plane55,m1));
subplot(2,5,6);
imshow((mat55'));
title('5th plane');

plane66=[];
plane66=bin_img1(:,6);
mat66=(vec2mat(plane66,m1));
subplot(2,5,7);
imshow((mat66'));
title('6th plane');

plane77=[];
plane77=bin_img1(:,7);
mat77=(vec2mat(plane77,m1));
subplot(2,5,8);
imshow((mat77'));
title('7th plane');

plane88=[];     %plane for lsb bit
plane88=bin_img1(:,8);
mat88=(vec2mat(plane88,m1));
subplot(2,5,9);
imshow((mat88'));     %image using the lsb bits of all pixel values
title('LSB bit');

recomb=[];    %recombined image
% recomb= (2*(2 * (2 * (2 * (2 * (2 * (2 * mat11 + mat2) + mat3) + mat4) + mat5) + mat6) + mat7)+mat8);
recomb=(128*mat1)+(64*mat2)+(32*mat11)+(16*mat4)+(8*mat5)+(4*mat6)+(2*mat7)+(1*mat8);
subplot(2,5,10);
imshow(uint8(recomb'));      %plotting the image after recombination of all planes except lsb plane
title('Reconstructed Image');