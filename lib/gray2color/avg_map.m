function map = avg_map(map_init, ref_color, ref_gray)
map = map_init;

for i = 0:255
    f = find(ref_gray == i);
    [t1, t2] = size(f);
    if (t1 == 0)
         continue
    end
    f = int64(f);
    [w, h] = size(ref_gray);
    [I, J] = ind2sub([w h], f);
    [w, h] = size(I);
    sumR = 0;
    sumG = 0;
    sumB = 0;
    for j = 1:w
        sumR = sumR + ref_color(I(j),J(j),1);
        sumG = sumG + ref_color(I(j),J(j),2);
        sumB = sumB + ref_color(I(j),J(j),3);
    end        
    map(i+1,1) = double(sumR)/double(w);
    map(i+1,2) = double(sumG)/double(w);
    map(i+1,3) = double(sumB)/double(w);
end