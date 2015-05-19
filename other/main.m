img = rgb2gray(imread('peppers.png'));
ref = imread('peppers.png');
[w, h] = size(img);

img(:,:,2) = img(:,:,1);
img(:,:,3) = img(:,:,1);

% K-MEANS METHOD

he = ref;
% figure, imshow(he); %Nacitanie obrazka
% cform = makecform('srgb2lab');
% lab_he = applycform(he,cform);
lab_he = he;
% figure, imshow(lab_he);

se = strel('disk', 5,0);

Ie = imerode(lab_he, se);
Iobr = imreconstruct(Ie, lab_he);
% if (show_figures == 1)
    figure
    imshow(Iobr), title('Opening-by-reconstruction (Iobr)')
% end

Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
% if (show_figures == 1)
    figure
    imshow(Iobrcbr), title('Opening-closing by reconstruction (Iobrcbr)')
% end

lab_he = Iobrcbr;

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 8;
[cluster_idx cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', 'Replicates',2);

pixel_labels = reshape(cluster_idx,nrows,ncols);
% figure, imshow(pixel_labels,[]), title('image labeled by clusterindex');

Lrgb = label2rgb(pixel_labels, 'jet', 'w', 'shuffle');
figure, medfilt2(imshow(Lrgb)),title('Colored k-means label matrix (Lrgb)');
