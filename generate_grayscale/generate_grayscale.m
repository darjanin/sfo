function generate_grayscale(assets_path)
images_path = [assets_path 'color/'];
gray_matlab_path = [assets_path 'matlab_gray/'];
dumm_gray_path = [assets_path 'average_gray/'];
ycbcr_gray_path = [assets_path 'ycbcr_gray/'];
ntsc_gray_path = [assets_path 'ntsc_gray/'];
images = dir(fullfile(images_path, '*.jpg'));
% images = dir(images_path);

for idx = 1:length(images)
    image_path = fullfile(images_path, images(idx).name);
    [pathname,filename,extension] = fileparts(image_path);
    image = imread(image_path);
    imwrite(rgb2gray(image),[gray_matlab_path filename '' extension],'jpg');
    imwrite(average_gray(image),[dumm_gray_path filename '' extension],'jpg');
    imwrite(ycbcr_gray(image),[ycbcr_gray_path filename '' extension],'jpg');
    imwrite(ntsc_gray(image),[ntsc_gray_path filename '' extension],'jpg');
end

function [result] = average_gray(img)
    img = im2double(img);
    [w,h,z] = size(img);
    result = zeros(w,h,1);
    result(:,:,1) = (img(:,:,1) + img(:,:,2) + img(:,:,3))/3;
 
function [result] = ycbcr_gray(img)
    y = rgb2ycbcr(img);
    result = y(:,:,1);
    
function [result] = ntsc_gray(img)
    lab = rgb2ntsc(img);
    f = 0.45;
    wlab = reshape(bsxfun(@times,cat(3,1-f,f/2,f/2),lab),[],3);
    [C,S] = pca(wlab);
    S = reshape(S,size(lab));
    S = S(:,:,1);
    result = (S-min(S(:)))./(max(S(:))-min(S(:)));
    