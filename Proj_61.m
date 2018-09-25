% Michael E. Ramsey
% Project 61
% This is a Matlab file to solve project 61 on projecteuler.net

%% We will first generate all 4 digit numbers for each polygon type using 
% the forumulas given in the problem
condition = false;

% Triangle numbers
i = 1;
j = 1;
while condition == false
    A = i*(i+1)/2;
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Tri(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

% Square numbers
i = 1;
j = 1;
while condition == false
    A = i^2;
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Squ(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

% Pentagonal numbers
i = 1;
j = 1;
while condition == false
    A = i*(3*i-1)/2;
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Pen(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

% Hexagonal numbers
i = 1;
j = 1;
while condition == false
    A = i*(2*i-1);
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Hex(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

% Heptagonal numbers
i = 1;
j = 1;
while condition == false
    A = i*(5*i-3)/2;
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Hep(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

% Octagonal numbers
i = 1;
j = 1;
while condition == false
    A = i*(3*i-2);
    
    % Terminate the loop if we reach 5 digit numbers
    if A >= 10000 
        break
    end
    
    % Only take the numbers with at least 4 digits
    if A >= 1000
        Oct(j) = A;
        j = j + 1;
    end
    i = i + 1;
end

%% Now it is time to figure out which set of numbers are cyclic

% Tri is the longest vector. Fill the other 5 polygon vectors with zeros
% so that all polygon vectors are the same length
Squ = [Squ, zeros(1,length(Tri)-length(Squ))]; 
Pen = [Pen, zeros(1,length(Tri)-length(Pen))];
Hex = [Hex, zeros(1,length(Tri)-length(Hex))];
Hep = [Hep, zeros(1,length(Tri)-length(Hep))]; 
Oct = [Oct, zeros(1,length(Tri)-length(Oct))]; 

% Concatenate all six polygon vectors into a matrix and compute the size
Mat = [Tri; Squ; Pen; Hex; Hep; Oct];
[A,B] = size(Mat);

% Calculate all possible permutations of the numbers 1 through 6. This is
% so we can hit all possible combinations of numbers in each polygon vector
Perm = perms([1,2,3,4,5,6]);
[X,Y] = size(Perm);


for k = 1: X % For each possible permutation
    Sub = Perm(k,:);
    Vec1 = Mat(Sub(1),:); % Take the corresponding row vector in Mat
    Vec2 = Mat(Sub(2),:);
    Vec3 = Mat(Sub(3),:);
    Vec4 = Mat(Sub(4),:);
    Vec5 = Mat(Sub(5),:);
    Vec6 = Mat(Sub(6),:);
    
    for j = 1:B % For each entry in the first vector
    A1 = Vec1(j);
    if A1 == 0; % If the entry is 0, terminate loop
        break
    end
    str0 = num2str(A1); % Convert number to string for easy indexing
    str1 = str0(1:2);
    str2 = str0(3:4); 
    
        for i = 1:B % For each entry in the second vector
            A2 = Vec2(i);
            if A2 == 0 % If the entry is 0, terminate loop
                break
            end
            str3 = num2str(A2); % Convert number to string for easy indexing
            str4 = str3(1:2);
            if str2(1) == str4(1) % See if the string values match up
            if str2(2) == str4(2)
            str5 = str3(3:4);

            for m = 1:B % For each entry in the third vector
                A3 = Vec3(m);
                if A3 == 0 % If the entry is 0, terminate loop
                    break
                end
                str6 = num2str(A3); % Convert number to string for easy indexing
                str7 = str6(1:2);
                if str5(1) == str7(1) % See if the string values match up
                if str5(2) == str7(2)
                str8 = str6(3:4);

                for n = 1:B % For each entry in the fourth vector
                    A4 = Vec4(n);
                    if A4 == 0 % If the entry is 0, terminate loop
                        break
                    end
                    str9 = num2str(A4); % Convert number to string for easy indexing
                    str10 = str9(1:2);
                    if str8(1) == str10(1) % See if the string values match up
                    if str8(2) == str10(2)
                    str11 = str9(3:4);

                    for p = 1:B % For each entry in the fifth vector
                        A5 = Vec5(p);
                        if A5 == 0 % If the entry is 0, terminate loop
                            break
                        end
                        str12 = num2str(A5); % Convert number to string for easy indexing
                        str13 = str12(1:2);
                        if str11(1) == str13(1) % See if the string values match up
                        if str11(2) == str13(2)
                        str14 = str12(3:4);

                        for q = 1:B % For each entry in the sixth vector
                            A6 = Vec6(q);
                            if A6 == 0 % If the entry is 0, terminate loop
                                break
                            end
                            str15 = num2str(A6); % Convert number to string for easy indexing
                            str16 = str15(1:2);
                            if str14(1) == str16(1) % See if the string values match up
                            if str14(2) == str16(2)
                            str17 = str15(3:4);

                            if str1(1) == str17(1) % See if the string values match up
                            if str1(2) == str17(2) % When we get here we have reached our goal
                                A1
                                A2
                                A3
                                A4
                                A5
                                A6
                                A = A1+A2+A3+A4+A5+A6;
                                disp(sprintf('The sum for our six Cyclical figurate numbers is %i.', A));
                            end
                            end
                            end
                            end
                        end
                        end
                        end
                    end
                    end
                    end
                end
                end
                end
            end
            end
            end
        end
    end
end




    