% Michael E. Ramsey
% Project 102
% This is a Matlab file to solve project 102 on projecteuler.net

% Import the triangle.txt file into Matlab
Points = readtable('Proj_102.txt');
PointMat = table2array(Points);
[row,col] = size(PointMat);

% Initialize the OriginCount at 1 because we are not including the first
% row in our algorithm
OriginCount = 1;

% This is our origin point
P = [0, 0];
for i = 1: row
    % Label our 3 points to the triangle
    A = PointMat(i,1:2);
    B = PointMat(i,3:4);
    C = PointMat(i,5:6);
    
    % Calculate the areas
    AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
    AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
    AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
    AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
    
    % If the sum of the three small areas is equal to the area of the
    % larger triangle, add one to the originCount
    Total = AreaABP + AreaCBP + AreaACP;
    
   if AreaTot == Total
       OriginCount = OriginCount + 1;
   end
end

clc
disp(sprintf('\n'));
disp(sprintf('The total number of triangles that contain the origin is: %i', OriginCount));

    
        
    