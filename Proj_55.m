Sols = zeros(1,10000);
for i = 1:10000
count = 1;
    Num = i;
    while count <= 50
    k = Permute(Num);
    if (Num+k) == Permute(Num+k)
        count = 100;
    else
        count = count + 1;
        Num = Num + k;
    end
    end
    if count == 100
        Sols(i) = 0;
    else
        Sols(i) = 1;
    end
end
sum(Sols)
        