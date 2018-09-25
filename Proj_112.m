%This will the least number for which the ratio of bouncy numbers is
%exactly 99 percent.

i=0;   %Initialize our variables
b=0;
ratio=0;
while ratio ~= (99/100) %We want exactly 99%
    a=0; %We will use these to track whether or not a number is increasing
    c=0; %or decreasing
        str=num2str(i); % Convert i into a string
            for j=1:(length(str)-1)
                if str(j)<=str(j+1) %If the digits increase, tick up a
                    a=a+1;
                end
                if str(j)>=str(j+1) %If the digits decrease, tick up c
                    c=c-1;
                end    
            end
             if (a~=(length(str)-1)) && (c~=(1-length(str)))
                 %If a ticked up every time, the number is increasing, and
                 %similarly for c and decreasing numbers
                    b=b+1; %If we were not increasing or decreasing, we're
                    %bouncy and thus increment b
             end
       ratio=(b/i) %Compute the current the ratio     
end

i %Print the i that gave the correct ratio