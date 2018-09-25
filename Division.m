function [] = Division(a,b)
% This function uses the division algorithm to solve a = q*b + r
% where a and b are inputs and the function returns r and q.

while b <= 0                                    % This loop prevents problems caused by
    disp('b is not a positive number');         % incorrect input values
    b = input('Please enter a positive number for b. ');
end

q = 0;
if a > 0                        % For positive values of a
    while a >= b                % This loop will subtract b from a q times
        a = a - b;
        q = q+1;
    end
elseif a < 0                    % If a is negative,
    while a < 0                 % this loop adds b to a until a is greater than or equal to zero
        a = a + b;
        q = q - 1;
    end
end
    r = a;

fprintf('r = %d , q = %d \n',r,q)

    