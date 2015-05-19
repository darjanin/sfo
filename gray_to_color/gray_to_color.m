%% init
clear all;

% vstup
input_color = imread('img/country3.jpg');
input_gray = rgb2gray(input_color);
ref_color = imread('img/country9.jpg');
ref_gray = rgb2gray(ref_color);

% vysledok
[w h] = size(input_gray);
res = zeros(w, h, 3);

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

map = avg_map(map_init, im2double(ref_color), ref_gray);

%% normovanie hodnot v mape na 0-1
map(:,1) = map(:,1)/max(map(:,1));
map(:,2) = map(:,2)/max(map(:,2));
map(:,3) = map(:,3)/max(map(:,3));

%% podla mapy sa napasuju farby
for i = 1:w
    for j = 1:h
        res(i,j,1) = map(input_gray(i,j)+1, 1);
        res(i,j,2) = map(input_gray(i,j)+1, 2);
        res(i,j,3) = map(input_gray(i,j)+1, 3);
    end
end

%% vykreslenie vysledkov
figure;
subplot(2,2,1); imshow(input_gray); title ('Input gray image');
subplot(2,2,2); imshow(ref_color); title ('Reference image');
subplot(2,2,3); imshow(res); title ('Coloured input');
subplot(2,2,4); imshow(input_color); title ('Original coloured input image');

