% This script uses the Sieve.m function, which returns a vector of all
% primes less than n (the input for Sieve).
% This function is used to find the 10,001st prime number
start = 2;
vec = Sieve(start);             % Initialize a vector
L = length(vec);                % its length
i = start + 1;                  % and the next index

while L < 10001             % Iterates until the vector's length is 10001
    vec = Sieve(i);         % Find all primes less than or equal to i
    L = length(vec);        % Find the length of that vector
    i = i+1;                % create the next index
end
i-1 % This is the 100001st prime number