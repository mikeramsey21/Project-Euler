% Michael Ramsey
% Project 92
% Note that this script takes about 3 hours to run

% Initialize loop condition and counter
condition = false;
count = 0;

% Check the first ten million numbers
for i = 1: 10000000
    num = i; % Rename our variable
    str = num2str(i); % Convert number to string for easy indexing
    while condition == false
        square = 0; % Initialize the squares counter
        
        % Calcualte and add the square of each digit
        for j = 1:length(str) % For each digit
            a = str2num(str(j)); % Convert back to number
            square = square + a^2; % Add the square
        end
        
        % If square is 89
        if square == 89
            count = count + 1; % Add one to count
            break % Terminate the loop
        end
        
        % If square is 1, just terminate the loop
        if square == 1
            break
        end
        
        % Reset variables for the next iteration of the algorithm
        num = square;
        str = num2str(num);
    end
end
