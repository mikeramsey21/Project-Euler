%% Michael E. Ramsey
% Project 184
% This is a Matlab file to solve project 184 on projecteuler.net

% Generate all integer cooridinates within a circle of radius 105 in the
% first quadrant
Radius = 5;
Coord1 = zeros(2,1);
count = 1;
for i = 0:Radius
    for j = 0:Radius
        A = sqrt(i^2 + j^2);
        if A < Radius
            Coord1(count,1) = i;
            Coord1(count,2) = j; 
            count = count + 1;
        end
    end
end
Coord1(1,:) = [];
[row,col] = size(Coord1);

% Generate the interger coordinates in the other three quadrants
Temp = Coord1(:,1);
Temp = -1.*Temp;
Coord2 = [Temp, Coord1(:,2)];

Temp = Coord1(:,2);
Temp = -1.*Temp;
Coord4 = [Coord1(:,1), Temp];

Coord3 = -1.*Coord1;

% Modify the coordinate quadrants so that they are disjoint
Coord1(1:Radius-1,:) = [];

condition = false;
pass = 1;
while condition == false
    if Coord2(pass,2) == 0;
        Coord2(pass,:) = [];
        pass = pass - 1;
    end
    pass = pass + 1;
    if pass == length(Coord1(:,1))
        condition = true;
    end
end

Coord3(1:Radius-1,:) = [];

condition = false;
pass = 1;
while condition == false
    if Coord4(pass,2) == 0;
        Coord4(pass,:) = [];
        pass = pass - 1;
    end
    pass = pass + 1;
    if pass == length(Coord1(:,1))
        condition = true;
    end
end
[row,col] = size(Coord1);

Coord = [Coord1; Coord2; Coord3; Coord4];
[row,col] = size(Coord);

% Initialize our origin point and the TriangleCount
P = [0, 0];
TriangleCount = 0;

% We check to see if triangles with coordinates in the first, second, and
% third coordinates contain the origin
for i = 1: row
    for j = 1: row 
        for k = 1: row
            A = Coord(i,:);
            B = Coord(j,:);
            C = Coord(k,:);
    
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
TriangleCount/6
% TriangleCount2 = 0;
% % We check to see if triangles with coordinates in the first, first, and
% % third coordinates contain the origin
% for i = 1: row
%     for j = 1: row 
%         for k = 1: row
%             A = Coord1(i,:);
%             B = Coord1(j,:);
%             C = Coord3(k,:);
%     
%             % Calculate the areas
%             AreaTot = abs(A(1)*(B(2) - C(2)) + B(1)*(C(2) - A(2)) + C(1)*(A(2) - B(2)))/2;
%             AreaABP = abs(A(1)*(B(2) - P(2)) + B(1)*(P(2) - A(2)) + P(1)*(A(2) - B(2)))/2;
%             AreaCBP = abs(P(1)*(B(2) - C(2)) + B(1)*(C(2) - P(2)) + C(1)*(P(2) - B(2)))/2;
%             AreaACP = abs(A(1)*(P(2) - C(2)) + P(1)*(C(2) - A(2)) + C(1)*(A(2) - P(2)))/2;
%             
%             % If the sum of the three small areas is equal to the area of the
%             % larger triangle, add one to the originCount
%             Total = AreaABP + AreaCBP + AreaACP;
%              
%             % Check to see if the oriding is colinear with one of the
%             % triangle edges
%             if AreaTot ~= 0
%                 if AreaABP ~= 0
%                     if AreaCBP ~= 0
%                         if AreaACP ~= 0
%                             if AreaTot == Total
%                                 TriangleCount2 = TriangleCount2 + 1;
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% 
% Totaltriangles = TriangleCount*4 + TriangleCount2*4