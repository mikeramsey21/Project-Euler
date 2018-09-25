% Michael E. Ramsey
% This is a matlab script file used to disprove Goldbach's second
% conjecture. You will know that you are successfull when you have reached
% an indexing error in the code. Type i in the command window to see your
% answer

% We start with the first composite odd number
i = 9;
condition = false; % Initialize the condition as false
while condition == false
    if isprime(i) == 0 % Check to see if i is prime
        A = primes(i); % Find all the primes less than i
        
        % Initialize some placeholder variables
        k = 1; 
        j = 1;
        b = 1;
        
        while b ~= i % While we have not found the correct value
            b = A(j) + 2*(k^2); % Caluclate the Goldbach equation
            
            if b == i % We have found the correct answer
                disp(sprintf('%i satisfies Goldbachs conjecture.', i));
                break
            end
            
            if b < i % Continue with the same prime A(j)
                k = k + 1; % Proceed the variable k
            end
            
            if b > i % We have gone too far
               k = 1; % Set k back to 1
               j = j + 1; % Proceed to the next prime A(j+1)
            end
        end
    end
    i = i + 2; % Proceed to the next odd number
end
    
    