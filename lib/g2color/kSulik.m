function [ res ] = kSulik( gray_im, color_im, nColors)
    
    
	'color'
	color_seg = segmenter3000(color_im,nColors);
	'gray'
	gray_seg = segmenter3000(gray_im, nColors);
    
    figure;
     for i = 1:nColors
        subplot(2,nColors,i);
        imshow(color_seg{i});  
        subplot(2,nColors,nColors+i);
        imshow(gray_seg{i}); 
    end;
   
    figure;
    [m n c] = size(gray_seg{1});
    res = zeros(m,n,3);
    res = uint8(res);
    for i = 1:nColors
        im1 = gray_seg{i};
        im1 = im1(:,:,1);
        im1 = im1 * 255;
        
        cs1 = color_seg{i} * 255;
        
        I1 = g2rgb(im1,cs1);
        subplot(1,nColors,i);
         imshow(I1);
         I1 = uint8(I1);
       
         
        res = res + I1;
    end
    
    
   
	
end
