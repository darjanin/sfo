function map = median_map(init_map, ref_color, ref_gray)
map = init_map;

for i = 0:255
    f = find(ref_gray == i);
    [t1 t2] = size(f);
    if (t1 == 0)
         continue
    end
    f = int64(f);
    [w h] = size(ref_gray);
    [I J] = ind2sub([w h], f);
    [w h] = size(I);
    sumR = 0;
    sumG = 0;
    sumB = 0;
    
    valR = zeros(w,1);
    valG = zeros(w,1);
    valB = zeros(w,1);
    for j = 1:w
        valR(j,1) = ref_color(I(j),J(j),1);
        valG(j,1) = ref_color(I(j),J(j),2);
        valB(j,1) = ref_color(I(j),J(j),3);
    end        
    map(i+1,1) = median(valR);
    map(i+1,2) = median(valG);
    map(i+1,3) = median(valB);
end