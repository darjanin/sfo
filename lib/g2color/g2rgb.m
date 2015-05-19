function rgb = g2rgb(I1, I2)

I1 = uint8(I1);

I2 = uint8(I2);

%% read images

%% check number of channels
if size(I1, 3) ~= 1
I1 = rgb2gray(I1);
'je farebny, prevadzam na BW'
end
if size(I2, 3) ~= 3
%error(?img2 must be a color image (not indexed)?);
end

%% convert to ycbcr
Y1 = rgb2ycbcr(I1(:, :, [1 1 1]));
Y2 = rgb2ycbcr(I2);

%% normalize
Y1d = double(Y1(:, :, 1));
Y2d = double(Y2(:, :, 1));
Y2n = Y2d(:) / (1 - range(Y2d(:)) / 255) * (1 - range(Y1d(:)) / 255);

%% build LUT
LUT = zeros(256, 1);
for y1 = 0 : 255
[val, idx] = min(abs(Y2n - y1));
LUT(y1 + 1) = idx(1);
end

%% compare luminance
idx = LUT((Y1d + 1));
Y2_2 = Y2(:, :, 2);
Y2_3 = Y2(:, :, 3);
nimage = cat(3, Y1(:, :, 1), Y2_2(idx), Y2_3(idx));
rgb = uint8(ycbcr2rgb(nimage));
