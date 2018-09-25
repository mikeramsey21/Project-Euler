function H = Collatz(n)
% Collatz.m takes in an integer n and returns a vector of all iterates of n
% according to the Collatz conjecture until n reaches 1. Taking the length
% of this vector will give the "height" of n.

H(1) = n;                   % The first entry of the vector is n
i = 2;
while n > 1                 % All following entries use the following:
    if mod(n,2) == 0        % If even, divide by 2
        n = n/2;
        H(i) = n;
    else                    % If odd, multiply by 3 and add 1
        n = 3*n+1;
        H(i) = n;
    end
    i = i+1;
end
        