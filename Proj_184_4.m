%% Michael E. Ramsey
% Project 184
% This is a Matlab file to solve project 184 on projecteuler.net

%% Generation of coordinates
% Generate all integer cooridinates within a circle of radius 105 in the
% first quadrant
Radius = 105;
Quad1 = zeros(1,2);
count = 1;
for i = 1:Radius
    for j = 1:Radius
        A = i^2 + j^2;
        if A < Radius^2
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

% Generate the integer coordinates in the fourth quadrant
Temp = Quad1(:,2);
Temp = -1.*Temp;
Quad4 = [Quad1(:,1), Temp];

% Generate the coordinates on the positive y-axis
nat = [1:Radius-1]';
yaxis = [zeros(Radius-1,1),nat];

% Generate the coordinates on the positive x-axis
xaxis = [nat,zeros(Radius-1,1)];
[x,y] = size(yaxis);

% Initialize our origin point
P = [0, 0];

%%
TriangleCount1 = uint64(0);
% We check to see if triangles with coordinates on the x-axis,the second
% quadrant, and the fourth quadrant contain the origin

for i = 1: row
    for j = 1: row
        A = Quad2(i,:);
        B = Quad4(j,:);

        % Calculate linear regression from quadrant 2 and 4
        slope = (A(2) - B(2))/(A(1) - B(1));
        intercept = A(2) - slope*A(1);

        % If the y-intercept is less than zero, we have a good edge
        if intercept < 0
            % Any point on the x-axis will work so add x
            TriangleCount1 = TriangleCount1 + x;
        end
    end
end
% We multiply by 8 to account for rotations and reflections of the triangle
TriangleCount1 = uint64(TriangleCount1*8)
% Answer is: 30379845184

%%
TriangleCount2 = uint64(0);
% We check to see if triangles with coordinates in the first, second, and
% third coordinates contain the origin
for i = 1: row
    for j = 1: row 
        A = Quad1(i,:);
        B = Quad3(j,:);
            
        % Calculate linear regression from quadrant 1 and 3
        slope = (A(2) - B(2))/(A(1) - B(1));
        intercept = A(2) - slope*A(1);

        % If the y-intercept is less than zero, we have a good edge
        if intercept < 0
            % Any point in quadrant 2 will work, so add row
            TriangleCount2 = TriangleCount2 + row;
        end
    end
end
    
% We multiply by 4 to account for rotations of the triangle
TriangleCount2 = uint64(TriangleCount2*4)
% Answer is: 1248494791504
% Checked
%%
TriangleCount3 = uint64(0);
% We check to see if triangles with coordinates in the first, first, and
% third coordinates contain the origin
for i = 1: row
    A = Quad3(i,:);
    
    % Calculate linear regrression from A to origin
    slope = (A(2) - P(2))/(A(1) - P(1));
    intercept = A(2) - slope*A(1);
    
    count1 = 0; count2 = 0;
    for j = 1: row
        B = Quad1(j,:);
        
        if B(2) > slope*B(1) + intercept
            count1 = count1 + 1;
        end
        if B(2) < slope*B(1) + intercept
            count2 = count2 + 1;
        end
    end
    TriangleCount3 = TriangleCount3 + (count1*count2);
end

% We multiply by 4 to account for rotations of the triangle
TriangleCount3 = uint64((TriangleCount3-74)*4)
% Answer is: 415712453972

%%
TriangleCount4 = uint64(0);
% We check to see if triangles with coordinates on the x-axis,the second
% quadrant, and the third quadrant contain the origin
TriangleCount4 = uint64(row^2*x*4)
% Answer is: 30396414464
% Checked
%%
TriangleCount5 = uint64(0);
% We check to see if triangles with coordinates on the x-axis,the y-axis 
% and the third quadrant contain the origin
TriangleCount5 = uint64((x^2-Radius+1)*row*4)
% Answer is : 366264704
% Corrected
%% Display the total triangle sum
TriangleSum = uint64(TriangleCount1 + TriangleCount2 + TriangleCount3 + TriangleCount4 + TriangleCount5)