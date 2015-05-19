% path('generate_grayscale', path); % add generate_grayscale folder to path
% generate_grayscale('assets/'); % generate grayscale versions of color image

path('assets', path);
path('lib', path); % add lib to path
path('lib/gray2color',path); % add gray2color to path
path('lib/gray2rgb',path); % add g2color to path

gray_name = 'les1';
reference_name = 'les';

color = imread(['assets/color/' reference_name '.jpg']);
gray = imread(['assets/matlab_gray/' gray_name '.jpg']);
gray_color = imread(['assets/color/' gray_name '.jpg']);

figure
subplot(2,4,1), imshow(gray), title('Gray Image for Coloring');
subplot(2,4,2), imshow(gray_color), title('Gray Image Original Color version');
subplot(2,4,3), imshow(color), title('Reference Color Image');
% subplot(2,4,4), imshow(), title();
subplot(2,4,5), imshow(gray2color(gray, color, 'median')), title('gray2color median method');
subplot(2,4,6), imshow(gray2color(gray, color, 'last')), title('gray2color last method');
subplot(2,4,7), imshow(gray2color(gray, color, 'average')), title('gray2color average method');
subplot(2,4,8), imshow(gray2rgb(gray, color)), title('gray2rgb using kmeans');
