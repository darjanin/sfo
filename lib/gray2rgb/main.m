function [] = main()
segments =3;

clc;
I1 = imread('images/les.jpg');
I2 = imread('images/les1.jpg');
I1 = rgb2gray(I1);
rgb = gray2rgb(I1,I2);
figure;
subplot(2,2,1);
imshow(I1);
subplot(2,2,2);
imshow(I2);
subplot(2,2,3);
imshow(rgb);

subplot(2,2,4);

res = kSulik(I1,I2,segments);
figure ;
subplot(1,3,1);
imshow(I2);
subplot(1,3,2);
imshow(I1);
subplot(1,3,3);
imshow(res);

%imshow(I);
'done'
