
for a=55000:56000 %this is final interval I checked, it was increased 
    %by 1000 at a time.
    for b=31900:(58*a/100)%The starting value is the endpoint of the last 
        %interval, and the endpoint is an approximation of how large b can 
        %be before the pentagonal numbers surpass the triangular
        for c=27500:(87*b/100)%The starting value and ending value were 
            %found much the same way as those for b.
           t=a*(a+1)/2;%formula for triangular numbers
           p=b*(3*b-1)/2;%formula for pentagonal numbers
           h=c*(2*c-1);%formula for hexagonal numbers
                if t==p
                    if p==h %checking that all three are equal 
                        t %if they are all, print the value they equal
                        a %also print the index of the triangular number
                    break
                end
            end
        end
    end
end

%Note that the output of those was to large for MatLab to give exactly,
%thus we take the index we had it print and take it to Mathematica to give
%the exact value.