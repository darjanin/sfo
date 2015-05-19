function colored_img = gray2color(input_gray, ref_color, method)
% color gray image using reference color image
% method specifies the calculation type
% possible values: 'average', 'last', 'median'

%% init
% clear all;

% vstup
% input_color = imread('img/country3.jpg');
% input_gray = rgb2gray(input_color);
% ref_color = imread('img/country9.jpg');
ref_gray = rgb2gray(ref_color);

% vysledny obrazok
[w h] = size(input_gray);
colored_img = zeros(w, h, 3);

% mapa (intenzita -> rgb) bude default na sedu (double 0-1)
map_init = zeros(256, 3);
for i = 1:256
    for j = 1:3
        map_init(i,j) = double(i-1)/double(255);
    end
end

%% mapovanie podla metody

% dostava:
% sedu mapu (default hodnoty, ak sa nenajde taky jas)
% referencny farebny (double)
% referencny ako sedy (int 0-255)

% vracia:
% mapu(256,3) intenzita -> rgb
if strcmp(method, 'average')
    map = avg_map(map_init, im2double(ref_color), ref_gray);
elseif strcmp(method, 'last')
    map = last_map(map_init, im2double(ref_color), ref_gray);
elseif strcmp(method, 'median')
    map = median_map(map_init, im2double(ref_color), ref_gray);
else
    disp('Wrong method specified');
end

%% normovanie hodnot v mape na 0-1
map(:,1) = map(:,1)/max(map(:,1));
map(:,2) = map(:,2)/max(map(:,2));
map(:,3) = map(:,3)/max(map(:,3));

%% podla mapy sa napasuju farby
for i = 1:w
    for j = 1:h
        colored_img(i,j,1) = map(input_gray(i,j)+1, 1);
        colored_img(i,j,2) = map(input_gray(i,j)+1, 2);
        colored_img(i,j,3) = map(input_gray(i,j)+1, 3);
    end
end

%% vykreslenie vysledkov
% figure;
% subplot(2,2,1); imshow(input_gray); title ('Input gray image');
% subplot(2,2,2); imshow(ref_color); title ('Reference image');
% subplot(2,2,3); imshow(colored_img); title ('Coloured input');
% subplot(2,2,4); imshow(input_color); title ('Original coloured input image');

