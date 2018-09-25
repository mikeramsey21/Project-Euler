function Max = Proj_18_67(A)
% This function takes in a lower triangular matrix, and output the max path
% sum. It is intended to solve Project Euler number 18, and also 67. The
% input matrix needs to contain zeros other than the lower triangular
% numbers.

[a ~] = size(A);            % We need a to determine the number of rows that the algorithm will go through
for i = 2:a                 % For each row after 1
    for j = 1:i             % and each non-zero entry in row i
        if j-1 == 0                             % j-1=0 means that it is the left boundary of the triangle
            A(i,j) = A(i,j)+A(i-1,j);           % and so the only option is to add the number above
        elseif A(i-1,j) == 0                    % This checks the right side of the triangle
            A(i,j) = A(i,j) + A(i-1,j-1);       % and adds the only option (the number above and to the left)
        else
            M = max(A(i-1,j),A(i-1,j-1));       % All other entries have 2 options, choose the largest
            A(i,j) = A(i,j) + M;                % and add that value to the chain
        end
    end
end                             % The final row of A is now the max path ending at each index in that row
Max = max(A(a,:));              % so choose the largest of these and that is the solution!
end