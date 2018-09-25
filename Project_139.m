%This program will count the number of Pythagorean  triangles with
%perimeter less than 100 million that when used to make a square, their
%remaining center square in the gap can tile the larger square.


p=0;  %Initialize the values
q=0;
num=0;
for p=2:floor(sqrt(50000000)); %Setting the limit on p to prevent the 
    %perimeter from going over 100 million
    for q=1:p; %q must remain less than p
        if mod(p+q,2)==1  %p+q must be odd
            if gcd(p,q)==1 %p and q must be relatively prime
                if p*(p+q)<50000000 %Check the perimeter isn't too big
                    a=2*p*q; %Calculating the sides of the triangle
                    b=p^2-q^2;
                    c=p^2+q^2;
                    if mod(c,abs(b-a))==0 %Condition for tiling
                        num=num+floor(50000000/(p*(p+q)));
                        %This p,q method only generates primitive triples, 
                        %so we add the multiples of those triples who also 
                        %have perimeter less than 100 million
                    end
                end
            end
        end
    end
end

num %print the number of triangles