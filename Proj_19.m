% Counting Sundays problem:
% Jan 1, 1901 is a Monday, how many Sunday's fall on the first of the month
% between 1901 and 2000?

% 30 Days: sept, apr, jun, nov
% jan feb mar apr jun jul aug sep oct nov dec
% The following is a vector of the day number of each month for a non-leap year
Year = [1:31,1:28,1:31,1:30,1:31,1:30,1:31,1:31,1:30,1:31,1:30,1:31];
% and this is for a leap year
Leap = [1:31,1:29,1:31,1:30,1:31,1:30,1:31,1:31,1:30,1:31,1:30,1:31];
A = []; %A will be a vector of the day number for each day from 1901 to 2000

for i = 1:100
    if mod(i,4) == 0 % i.e. if i is a leap year
        A = [A Leap];
    else            % if not a leap year
        A = [A Year];
    end
end
Week = [3:7, 1,2];    % Jan 1 1901 is a Tuesday, so we start with 3,
Weekly = repmat(Week,1,5218); % and repeat up to 7 until the length of A is exceeded
%% Now, count iterations for which A(i) = Weekly(i) = 1 (Sunday)
count = 0;
for j = 1:length(A)
    if A(j) == 1
        if Weekly(j) == 1
            count = count + 1;
        end
    end
end
count % count is 171, hence there are 171 months that start on a Sunday