function RI = aha(YourImage)
[indimg, indmap] = rgb2ind(YourImage)
indasgray = rgb2gray(reshape(indmap,[size(indmap,1),1,3]));
image(indimg);
colromap(indasgray);   %image painted gray but multiple ind might have same gray
RI = ind2rgb(indimg, indmap);
size(RI)
end