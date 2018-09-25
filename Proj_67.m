% MakeTriangle.m

% This script takes in a data set for Project Euler problem 67, and enters
% the data into a usable matrix that will be input into TriangleMax.m to
% find the max path length.

A = importdata('proj_67.txt');    % Saves the txt file as a column vector
A = A';                                 % change it to a row

% Now we have our data in a row vector, but we need to put is as the lower
% triangular entries in a matrix, i.e. the first entry in A is the first
% entry in row 1 of the output matrix, M, the rest of that row is zeros.
% The following row enters 2 and 3 of A into row 2 of M, again followed by
% zeros. This continues for each row of M until A is completely entered
% into M.

a = 1;                  % Initialize the first and last entry for row 1
b = 1;
M = zeros(100,100);                         % Initialize the output matrix
for i = 1:100                               % For each row,
    M(i,:) = [A(a:b), zeros(1,100-i)];      % Follow the procedure described above
    a = b + 1;                              % Set the beginning and ending
    b = b + i + 1;                          % indeces for the next row.
end