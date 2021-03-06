function [ segmented_images ] =  segmenter3000(img, nColors)
	img = im2double(img);
	ab = img;
	[nrows ncols p] = size(img);
	if (p~=3) 		
		ab = zeros(nrows,ncols,3);
		ab(:,:,1) = img;
		ab(:,:,2) = img;
		ab(:,:,3) = img;
        img = ab;
        ab = ab(:,:,2:3);
    else	
		cform = makecform('srgb2lab');
		lab_he = applycform(img,cform);

		ab = double(lab_he(:,:,2:3));	
    end    
    
        size(ab);
        nrows;
        ncols;
    ab = reshape(ab,nrows*ncols,2);

	[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
		'Replicates',3);


    
    
    size(cluster_idx)  ;
	pixel_labels = reshape(cluster_idx,nrows,ncols);
	imshow(pixel_labels,[]), title('image labeled by cluster index');


	segmented_images = cell(1,3);
	rgb_label = repmat(pixel_labels,[1 1 3]);

size(rgb_label)
	for k = 1:nColors        
		color = img;
		color(rgb_label ~= k) = 0;
		segmented_images{k} = color;
	end



end
