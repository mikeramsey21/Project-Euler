% Michael E. Ramsey
% Project 99
% This is a Matlab file to solve project 99 on projecteuler.net

% Import the base, exponent pairs into Matlab
Points = readtable('Proj_99.txt');
PointMat = table2array(Points);
[row,col] = size(PointMat);

% We use the natural logarithm to find the largest number
max = 1; % Start by assuming the first number is the largest
for i = 2:row
    A = PointMat(i,2) * log(PointMat(i,1)); % Compute the ith number
    
    % Check to see if the ith number is greater than current max
    if A > PointMat(max,2) * log(PointMat(max,1))
        max = i; % Reset the max
    end
end

% Display the result
disp(sprintf('The maximum number occurs at row %i.', max + 1));