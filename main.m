% path('generate_grayscale', path); % add generate_grayscale folder to path
% generate_grayscale('assets/'); % generate grayscale versions of color image

path('assets', path);
path('lib', path); % add lib to path
path('lib/gray2color',path); % add gray2color to path
path('lib/gray2rgb',path); % add g2color to path

color = imread('assets/color/maru.jpg');
gray = imread('assets/average_gray/mino.jpg');

colored = gray2rgb(gray, color);

figure, imshow(colored);

figure
subplot(2,2,1), imshow(color), title('Maru color');
subplot(2,2,2), imshow(gray2color(gray, color, 'last')), title('Maru colored last');
subplot(2,2,3), imshow(gray2color(gray, color, 'average')), title('Maru colored average');
subplot(2,2,4), imshow(gray2color(gray, color, 'median')), title('Maru colored median');
