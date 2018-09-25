a=1;
num=0;
r=0;
while r<=1000000
    for b=1:(a-1);
        r=a^3-b^3;
        if isprime(r)
            num=num+1;
        end
    end
    a=a+1;
end

num