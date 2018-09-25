%% Michael E. Ramsey
% Project 138
% This is a Matlab file to solve project 138 on projecteuler.net

% Initialize count for indexing purposes, length of isosceles sides of
% triangle, the while condition, and the multiplying ratio
count = 1;
ratio = 1;
length = 2;
condition = false;
format long

% While we do not have 12 side lengths with the required property
while condition == false
    
    % Calculate what the possible bases of the triangle
    solution1 = (2 + sqrt(4 - 5*(-length^2+1)))/(10/4);
    solution2 = (2 - sqrt(4 + 5*(length^2-1)))/(-10/4);
    
    % Check to see if we have integers
    if mod(solution1,1) == 0 || mod(solution2,1) == 0
        
        % If we have an integer, record the length in Trianglevec
        Trianglevec(count) = length;
        
        % Calculate the new multiplying ratio
        % Update next length variable that we need to check
        if count ~= 1
            ratio = Trianglevec(count)/Trianglevec(count-1);
            length = floor(ratio*length);
            length = length - 1;
        end
        
        % Proceed the counter for indexing
        count = count + 1;
    end
    
    % Update the length
    length = length + 1;
    
    % We have reached the required number of triangles, terminate loop
    if count == 13
        condition = true;
    end
end

% Display the answer in the command window
A = uint64(sum(Trianglevec));
disp(sprintf('The sum of the side lengths for the 12 smallest special isosceles triangles is: %i',A));

