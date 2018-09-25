% Michael E. Ramsey
% Project 27
% This is a Matlab file to solve project 27 on projecteuler.net

% Initialize conditions
condition = false;
Maxcount = 0;

% Check each combination of a and b between -999 and 999
for a = -999:999 
    for b = -999:999
        
        % Start with n at 0 and initialize the prime counter
        n = 0;
        count = 0;
        while condition == false
            
            % Calculate the iteration of the Prime formula
            Pri = n^2 + a*n + b;
            
            % If we get a negative number, set Pri = 6 to terminate loop in
            % later if statement
            if Pri < 0
                Pri = 6;
            end
            
            % If Pri is prime
            if isprime(Pri) == 1
                count = count + 1; % Proceed counter
                n = n + 1; % Proceed n
            end
            
            % If we have a counter higher than Maxcount
            if count > Maxcount
                Maxcount = count; % Update Maxcount
                Maxa = a; % Update Maxa
                Maxb = b; % Update Maxb
            end
            
            % If Pri is not prime, terminate loop
            if isprime(Pri) == 0
                condition = true;
            end           
        end
        condition = false;
    end
    condition = false;
end

Answer = Maxa*Maxb
    