function map = last_map(map_init, ref_color, ref_gray)
map = map_init;

[w h] = size(ref_gray);
for i = 1:w
    for j = 1:h
        map(ref_gray(i, j)+1, 1) = ref_color(i, j, 1);
        map(ref_gray(i, j)+1, 2) = ref_color(i, j, 2);
        map(ref_gray(i, j)+1, 3) = ref_color(i, j, 3);
    end;
end;
