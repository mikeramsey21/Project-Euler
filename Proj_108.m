for n = 100000:200000
    count(n-99999) = 0;
    for x = n+1:2*n
%     I = 1/n - 1/x;
%     y = 1/I;
y = x*n/(x-n);
    if floor(y) == y
        count(n-99999) = count(n-99999)+1;
    end
    end
    if count(n-99999) >= 1000
        fprintf('n = %d works!',n)
        break
    end
end

