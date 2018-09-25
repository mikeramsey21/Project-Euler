%% Michael E. Ramsey
% Project 184
% This is a Matlab file to solve project 184 on projecteuler.net

% Generate all integer cooridinates within a circle of radius 105 in the
% first quadrant
Radius = 5;
Quad1 = zeros(1,2);
count = 1;
for i = 1:Radius
    for j = 1:Radius
        A = sqrt(i^2 + j^2);
        if A < Radius
            Quad1(count,:) = [i;j];
            count = count + 1;
        end
    end
end
[row,col] = size(Quad1);

% Generate the interger coordinates in the second quadrant
Temp = Quad1(:,1);
Temp = -1.*Temp;
Quad2 = [Temp, Quad1(:,2)];

% Generate the integer coordinates in the third quadrant
Quad3 = -1.*Quad1;

% Generate the integer corrdinates in the fourth quadrant
Temp = Quad1(:,2);
Temp = -1.*Temp;
Quad4 = [Quad1(:,1), Temp];

% Generate the coordinates on the positive y-axis
nat = [1:Radius-1]';
yaxis = [zeros(Radius-1,1),nat];

% Generate the coordinates on the positive x-axis
xaxis = [nat,zeros(Radius-1,1)];
[x,y] = size(yaxis);

% Initialize our origin point and the TriangleCount
P = [0, 0];
TriangleCount = 0;

% We check to see if triangles with coordinates in the first, second, and
% third coordinates contain the origin
for i = 1: row
    for j = 1: row 
        for k = 1: row
            A = Quad1(i,:);
            B = Quad2(j,:);
            C = Quad3(k,:);
            
            % Calculate linear regression from quadrant 1 and 3
            slope = (A(2) - C(2))/(A(1) - C(1));
            intercept = A(2) - slope*A(1);
            
            % Only continue if b is less than zero
            if intercept < 0
    
            % Calculate the areas
            AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
            AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
            AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
            AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
            
            % If the sum of the three small areas is equal to the area of the
            % larger triangle, add one to the originCount
            Total = AreaABP + AreaCBP + AreaACP;
             
            % Check to see if the oriding is colinear with one of the
            % triangle edges
            if AreaTot ~= 0
                if AreaABP ~= 0
                    if AreaCBP ~= 0
                        if AreaACP ~= 0
                            if AreaTot == Total
                                TriangleCount = TriangleCount + 1;
                            end
                        end
                    end
                end
            end
            end
        end
    end
end

% We multiply by 4 to account for rotations of the triangle
TriangleCount = TriangleCount*4

TriangleCount2 = 0;
% We check to see if triangles with coordinates in the first, first, and
% third coordinates contain the origin
for i = 1: row
    for j = 1: i
        for k = 1: row
            A = Quad1(i,:);
            B = Quad1(j,:);
            C = Quad3(k,:);
            
            % Calculate the areas
            AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
            AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
            AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
            AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
            
            % If the sum of the three small areas is equal to the area of the
            % larger triangle, add one to the originCount
            Total = AreaABP + AreaCBP + AreaACP;
             
            % Check to see if the oriding is colinear with one of the
            % triangle edges
            if AreaTot ~= 0
                if AreaABP ~= 0
                    if AreaCBP ~= 0
                        if AreaACP ~= 0
                            if AreaTot == Total
                                TriangleCount2 = TriangleCount2 + 1;
                            end
                        end
                    end
                end
            end
        end
    end
end

% We multiply by 4 to account for rotations of the triangle
TriangleCount2 = TriangleCount2*4

TriangleCount3 = 0;
% We check to see if triangles with coordinates on the x-axis,the second
% quadrant, and the third quadrant contain the origin
for i = 1: x
    for j = 1: row 
        for k = 1: row
            A = xaxis(i,:);
            B = Quad2(j,:);
            C = Quad3(k,:);
    
            % Calculate the areas
            AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
            AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
            AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
            AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
            
            % If the sum of the three small areas is equal to the area of the
            % larger triangle, add one to the originCount
            Total = AreaABP + AreaCBP + AreaACP;
             
            % Check to see if the oriding is colinear with one of the
            % triangle edges
            if AreaTot ~= 0
                if AreaABP ~= 0
                    if AreaCBP ~= 0
                        if AreaACP ~= 0
                            if AreaTot == Total
                                TriangleCount3 = TriangleCount3 + 1;
                            end
                        end
                    end
                end
            end
        end
    end
end

% We multiply by 4 to account for rotations of the triangle
TriangleCount3 = TriangleCount3*4

TriangleCount4 = 0;
% We check to see if triangles with coordinates on the x-axis,the y-axis 
% and the third quadrant contain the origin
for i = 1: x
    for j = 1: x 
        for k = 1: row
            A = xaxis(i,:);
            B = yaxis(j,:);
            C = Quad3(k,:);
    
            % Calculate the areas
            AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
            AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
            AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
            AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
            
            % If the sum of the three small areas is equal to the area of the
            % larger triangle, add one to the originCount
            Total = AreaABP + AreaCBP + AreaACP;
             
            % Check to see if the oriding is colinear with one of the
            % triangle edges
            if AreaTot ~= 0
                if AreaABP ~= 0
                    if AreaCBP ~= 0
                        if AreaACP ~= 0
                            if AreaTot == Total
                                TriangleCount4 = TriangleCount4 + 1;
                            end
                        end
                    end
                end
            end
        end
    end
end

% We multiply by 4 to account for rotations of the triangle
TriangleCount4 = TriangleCount4*4

TriangleCount5 = 0;

% We check to see if triangles with coordinates on the x-axis,the second
% quadrant, and the fourth quadrant contain the origin
for i = 1: x
    for j = 1: row
        for k = 1: row
            A = xaxis(i,:);
            B = Quad2(j,:);
            C = Quad4(k,:);
    
            % Calculate the areas
            AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
            AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
            AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
            AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
            
            % If the sum of the three small areas is equal to the area of the
            % larger triangle, add one to the originCount
            Total = AreaABP + AreaCBP + AreaACP;
             
            % Check to see if the oriding is colinear with one of the
            % triangle edges
            if AreaTot ~= 0
                if AreaABP ~= 0
                    if AreaCBP ~= 0
                        if AreaACP ~= 0
                            if AreaTot == Total
                                TriangleCount5 = TriangleCount5 + 1;
                            end
                        end
                    end
                end
            end
        end
    end
end

% We multiply by 8 to account for rotations and reflections of the triangle
TriangleCount5 = TriangleCount5*8

TriangleSum = TriangleCount + TriangleCount2 + TriangleCount3 + TriangleCount4 + TriangleCount5