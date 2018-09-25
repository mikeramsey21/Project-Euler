% This is a Matlab Script that adds up all even Fibonacci Numbers below 4
% million

a=1;
b=2;
c=0;
sum=2;
% We initialize sum at 2 to include the initial value of b not being
% included the calculations of c.
while c < 4000000
    %We want c<4000000 since we don't want to exceed 4000000
    c=a+b;
    a=b;
    b=c;
    %We overwrite the coefficients to continue the recursion
    if mod(c,2)==0
        
        sum=sum+c;
      %We check if c is even, and if so, we add it to our sum  
    end
    
end

if mod(c,2)==0
    
    sum=sum-c;
    
end

%Since the loop goes one term too far, we subtract the last term if it
%happens to be even

sum