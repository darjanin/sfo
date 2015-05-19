function [ output_args ] = Untitled1( gray, reference )

%ycbcrref = rgb2ycbcr(reference);

I = imread('peppers.png');
Y = rgb2ycbcr(I);
imshow(I);
size(I)
figure
size(Y)
imshow(Y);


end
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
